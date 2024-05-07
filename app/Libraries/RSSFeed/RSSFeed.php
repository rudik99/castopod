<?php

declare(strict_types=1);

/**
 * @copyright  2024 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

namespace App\Libraries\RSSFeed;

class RSSFeed
{
    public const NAMESPACES = [
        'itunes'  => 'http://www.itunes.com/dtds/podcast-1.0.dtd',
        'podcast' => 'https://podcastindex.org/namespace/1.0',
        'atom'    => 'http://www.w3.org/2005/Atom',
    ];

    /**
     * @var Tag[]
     */
    private array $tags = [];

    private SimpleRSSElement $root;

    private SimpleRSSElement $channel;

    public function findTag(string $name): Tag
    {
    }

    public function render(): string
    {
        $this->root = new SimpleRSSElement(
            "<rss version='2.0' xmlns:content='http://purl.org/rss/1.0/modules/content/' />"
        );

        foreach ($this::NAMESPACES as $key => $namespace) {
            $this->root->addAttribute('xmlns:' . $key, $namespace);
        }

        $this->channel = $this->root->addChild('channel');

        /** @var string|false $xml */
        $xml = $this->root->asXML();

        if (! $xml) {
            return ''; // TODO: show exception?
        }

        return $xml;
    }

    /**
     * @param array{string,string}[] $attributes
     * @param key-of<self::NAMESPACES> $namespace
     */
    private function addTag(string $name, string $value, $attributes, $namespace)
    {
        $this->tags[] = new Tag($name, $value, $attributes, $namespace);
    }
}
