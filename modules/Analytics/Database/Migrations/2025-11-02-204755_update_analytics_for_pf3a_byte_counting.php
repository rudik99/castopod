<?php

declare(strict_types=1);

/**
 * Class UpdateAnalyticsForPf3aByteCountin
 * Updates analytics schema to support PF3A proportional byte counting
 *
 * BREAKING CHANGE: Removes unique_listeners tracking and changes hits to proportional values.
 * - Removes unique_listeners column from analytics_podcasts
 * - Changes hits from INT to DOUBLE in all analytics tables
 *
 * @copyright  2020 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

namespace Modules\Analytics\Database\Migrations;

use App\Database\Migrations\BaseMigration;
use Override;

class UpdateAnalyticsForPf3aByteCounting extends BaseMigration
{
    #[Override]
    public function up(): void
    {
        $prefix = $this->db->getPrefix();

        // Remove unique_listeners column from analytics_podcasts
        $this->forge->dropColumn('analytics_podcasts', 'unique_listeners');

        // Change hits from INT to DOUBLE in all analytics tables
        // This allows for proportional counting based on downloaded bytes / total file size

        $tables = [
            'analytics_podcasts',
            'analytics_podcasts_by_episode',
            'analytics_podcasts_by_hour',
            'analytics_podcasts_by_player',
            'analytics_podcasts_by_country',
            'analytics_podcasts_by_region',
            'analytics_podcasts_by_subscription',
        ];

        foreach ($tables as $table) {
            $sql = "ALTER TABLE `{$prefix}{$table}` MODIFY `hits` DOUBLE UNSIGNED DEFAULT 1";
            $this->db->query($sql);
        }
    }

    #[Override]
    public function down(): void
    {
        $prefix = $this->db->getPrefix();

        // Restore hits to INT (data will be truncated)
        $tables = [
            'analytics_podcasts',
            'analytics_podcasts_by_episode',
            'analytics_podcasts_by_hour',
            'analytics_podcasts_by_player',
            'analytics_podcasts_by_country',
            'analytics_podcasts_by_region',
            'analytics_podcasts_by_subscription',
        ];

        foreach ($tables as $table) {
            $sql = "ALTER TABLE `{$prefix}{$table}` MODIFY `hits` INT UNSIGNED DEFAULT 1";
            $this->db->query($sql);
        }

        // Add back unique_listeners column (with default value 0, data cannot be restored)
        $this->forge->addColumn('analytics_podcasts', [
            'unique_listeners' => [
                'type'     => 'INT',
                'unsigned' => true,
                'default'  => 0,
                'after'    => 'bandwidth',
            ],
        ]);
    }
}
