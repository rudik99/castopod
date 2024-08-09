<?php

declare(strict_types=1);

/**
 * @copyright  2021 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

return [
    'list' => [
        'title' => 'Videoclips',
        'status' => [
            'label' => 'Status',
            'queued' => 'in wachtrij',
            'queued_hint' => 'Clip is in afwachting van verwerking.',
            'pending' => 'in behandeling',
            'pending_hint' => 'Clip zal binnenkort worden gegenereerd.',
            'running' => 'actief',
            'running_hint' => 'Clip wordt gegenereerd.',
            'failed' => 'mislukt',
            'failed_hint' => 'Clip could not be generated: script failure.',
            'passed' => 'geslaagd',
            'passed_hint' => 'Clip is met succes gegenereerd!',
        ],
        'clip' => 'Clip',
        'duration' => 'Job duration',
    ],
    'title' => 'Videoclip: {videoClipLabel}',
    'download_clip' => 'Clip downloaden',
    'create' => 'Nieuwe videoclip',
    'go_to_page' => 'Go to clip page',
    'retry' => 'Retry clip generation',
    'delete' => 'Clip verwijderen',
    'logs' => 'Job logs',
    'messages' => [
        'alreadyExistingError' => 'De videoclip die u probeert te maken bestaat al!',
        'addToQueueSuccess' => 'Video clip has been added to queue, awaiting to be created!',
        'deleteSuccess' => 'Videoclip is succesvol verwijderd!',
    ],
    'format' => [
        'landscape' => 'Liggend',
        'portrait' => 'Portret',
        'squared' => 'Vierkant',
    ],
    'form' => [
        'title' => 'Nieuwe videoclip',
        'params_section_title' => 'Videoclip parameters',
        'clip_title' => 'Clip titel',
        'format' => [
            'label' => 'Kies een formaat',
            'landscape_hint' => 'With a 16:9 ratio, landscape videos are great for PeerTube, Youtube and Vimeo.',
            'portrait_hint' => 'With a 9:16 ratio, portrait videos are great for TikTok, Youtube shorts and Instagram stories.',
            'squared_hint' => 'With a 1:1 ratio, squared videos are great for Mastodon, Facebook, Twitter and LinkedIn.',
        ],
        'theme' => 'Selecteer een thema',
        'start_time' => 'Begintijd',
        'duration' => 'Duur',
        'trim_start' => 'Trim start',
        'trim_end' => 'Trim end',
        'submit' => 'Videoclip aanmaken',
    ],
    'requirements' => [
        'title' => 'Ontbrekende vereisten',
        'missing' => 'Je hebt ontbrekende vereisten. Zorg ervoor dat je alle vereiste items toevoegt om een video te maken voor deze aflevering!',
        'ffmpeg' => 'FFmpeg',
        'gd' => 'Graphics Draw (GD)',
        'freetype' => 'Freetype library for GD',
        'transcript' => 'Transcriptbestand (.srt)',
    ],
];
