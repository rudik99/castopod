<?php

declare(strict_types=1);

/**
 * Class DropWebsiteAnalyticsTables
 * Removes website analytics tables as part of PF3A compliance
 *
 * BREAKING CHANGE: All website analytics data will be permanently deleted.
 * Users should use Matomo or Plausible plugins for website analytics instead.
 *
 * @copyright  2020 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

namespace Modules\Analytics\Database\Migrations;

use App\Database\Migrations\BaseMigration;
use Override;

class DropWebsiteAnalyticsTables extends BaseMigration
{
    #[Override]
    public function up(): void
    {
        $prefix = $this->db->getPrefix();

        // Drop stored procedure
        $this->db->query("DROP PROCEDURE IF EXISTS `{$prefix}analytics_website`");

        // Drop website analytics tables
        $this->forge->dropTable('analytics_website_by_browser', true);
        $this->forge->dropTable('analytics_website_by_referer', true);
        $this->forge->dropTable('analytics_website_by_entry_page', true);
    }

    #[Override]
    public function down(): void
    {
        // Cannot restore deleted data - down migration not supported
        throw new \RuntimeException(
            'Cannot rollback website analytics removal. Data has been permanently deleted. ' .
            'If you need website analytics, please use Matomo or Plausible plugins instead.'
        );
    }
}
