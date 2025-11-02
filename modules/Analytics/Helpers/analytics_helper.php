<?php

declare(strict_types=1);

/**
 * @copyright  2020 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

use AdAures\Ipcat\IpDb;
use GeoIp2\Database\Reader;
use Opawg\UserAgentsV2Php\UserAgents;

if (! function_exists('base64_url_encode')) {
    /**
     * Encode Base64 for URLs
     */
    function base64_url_encode(string $input): string
    {
        return strtr(base64_encode($input), '+/=', '._-');
    }
}

if (! function_exists('base64_url_decode')) {
    /**
     * Decode Base64 from URL
     */
    function base64_url_decode(string $input): string
    {
        return base64_decode(strtr($input, '._-', '+/='), true);
    }
}

if (! function_exists('client_ip')) {
    /**
     * Get the client IP, depending on available headers
     */
    function client_ip(): string
    {
        $superglobals = service('superglobals');
        if (! empty($superglobals->server('HTTP_X_FORWARDED_FOR'))) {
            return $superglobals->server('HTTP_X_FORWARDED_FOR');
        }

        return $superglobals->server('REMOTE_ADDR');
    }
}

if (! function_exists('podcast_hit')) {
    /**
     * Counting podcast episode downloads for analytic purposes (PF3A compliant)
     *
     * ✅ No IP address is ever stored on the server
     * ✅ Only aggregate data is stored in the database
     * ✅ GDPR compliant - no persistent user tracking
     * ✅ Proportional counting based on downloaded bytes / total file size
     * ✅ IP deny list filtering (https://github.com/client9/ipcat)
     * ✅ User-agent filtering (https://github.com/opawg/user-agents-v2)
     * ✅ Ignores Apple iOS check requests (Range: 0-1)
     *
     * PF3A spec: https://pf3a.org/PF3A_guidelines_v01-draft03.pdf
     * Every download is counted proportionally to bytes downloaded.
     * No unique listener tracking. No session-based caching. No 24h windows.
     *
     * @param integer $podcastId The podcast ID
     * @param integer $episodeId The Episode ID
     * @param integer $fileSize The podcast complete file size
     * @param double $duration The episode duration in seconds
     * @param int $publicationTime The episode's publication time as a UNIX timestamp
     * @param string $serviceName The name of the service that had fetched the RSS feed
     * @param int|null $subscriptionId The subscription ID if this is a premium download
     */
    function podcast_hit(
        int $podcastId,
        int $episodeId,
        int $fileSize,
        float $duration,
        int $publicationTime,
        string $serviceName,
        ?int $subscriptionId,
    ): void {
        try {
            $superglobals = service('superglobals');
            $clientIp = client_ip();
            $userAgent = $superglobals->server('HTTP_USER_AGENT') ?? '- unknown -';

            // Check if IP is on deny list (bots/crawlers)
            $isDeniedIp = IpDb::find($clientIp) !== null;

            // Detect player/app/device/os
            $player = ['app' => '- unknown -', 'device' => '', 'os' => '', 'bot' => 0];
            try {
                $playerFound = UserAgents::find($userAgent);
                if ($playerFound) {
                    $player = $playerFound;
                }
            } catch (Exception) {
                // If detection fails, add to unknown list
                try {
                    $db = db_connect();
                    $procedureNameUnknown = $db->prefixTable('analytics_unknown_useragents');
                    $db->query("CALL {$procedureNameUnknown}(?)", [$userAgent]);
                } catch (Exception) {
                }
            }

            // Mark as bot if IP is denied
            if ($isDeniedIp) {
                $player['bot'] = 1;
            }

            // Get geographic location from GeoIP
            $location = ['countryCode' => 'N/A', 'regionCode' => 'N/A', 'latitude' => null, 'longitude' => null];
            try {
                $cityReader = new Reader(WRITEPATH . 'uploads/GeoLite2-City/GeoLite2-City.mmdb');
                $city = $cityReader->city($clientIp);
                $location = [
                    'countryCode' => $city->country->isoCode ?? 'N/A',
                    'regionCode'  => $city->subdivisions[0]->isoCode ?? 'N/A',
                    'latitude'    => round($city->location->latitude, 3),
                    'longitude'   => round($city->location->longitude, 3),
                ];
            } catch (Exception) {
            }

            // Parse HTTP Range header
            $httpRange = $superglobals->server('HTTP_RANGE') ?? null;

            // Skip Apple iOS file existence check (Range: 0-1)
            if ($httpRange === 'bytes=0-1') {
                return;
            }

            // Calculate downloaded bytes
            $downloadedBytes = 0;
            if (! $httpRange) {
                // Full file download
                $downloadedBytes = $fileSize;
            } else {
                // Partial content - calculate bytes from range
                $ranges = explode(',', substr((string) $httpRange, 6));
                foreach ($ranges as $range) {
                    $parts = explode('-', $range);
                    if (count($parts) === 2) {
                        $start = $parts[0] !== '' ? (int) $parts[0] : 0;
                        $end = $parts[1] !== '' ? (int) $parts[1] : $fileSize - 1;
                        $downloadedBytes += ($end - $start + 1);
                    }
                }
            }

            // Calculate proportional hit value (PF3A spec)
            // hitValue = downloaded bytes / total file size
            $hitValue = $fileSize > 0 ? $downloadedBytes / $fileSize : 0;

            // Only record if there's actual data downloaded
            if ($hitValue <= 0) {
                return;
            }

            // Calculate episode age in days
            $age = intdiv(time() - $publicationTime, 86400);

            // Call stored procedure with proportional hit value
            $db = db_connect();
            $procedureName = $db->prefixTable('analytics_podcasts');

            $db->query(
                "CALL {$procedureName}(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
                [
                    $podcastId,
                    $episodeId,
                    $location['countryCode'],
                    $location['regionCode'],
                    $location['latitude'],
                    $location['longitude'],
                    $serviceName,
                    $player['app'],
                    $player['device'],
                    $player['os'],
                    $player['bot'],
                    $fileSize,
                    $duration,
                    $age,
                    $hitValue, // Proportional hit value instead of newListener
                    $subscriptionId,
                ],
            );
        } catch (Exception $exception) {
            // If things go wrong the show must go on and the user must be able to download the file
            log_message('critical', $exception->getMessage());
        }
    }
}
