<?php

declare(strict_types=1);

/**
 * @copyright  2024 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

namespace App\Libraries\RSSFeed;

class Tag
{
    /**
     * @param array{string,string}[] $attributes
     * @param key-of<RSSFeed::NAMESPACES> $namespace
     */
    public function __construct(
        private string $name,
        private string $value,
        private array $attributes,
        private string $namespace
    ) {
    }
}
