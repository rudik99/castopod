<?php

declare(strict_types=1);

/**
 * @copyright  2022 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

return [
    'installed' => 'Plugins installed',
    'about' => 'Over',
    'website' => 'Website',
    'repository' => 'Code repository',
    'authors' => 'Auteurs',
    'author_email' => 'E-mail {authorName}',
    'author_homepage' => '{authorName} startpagina',
    'declaredHooks' => 'Declared hooks',
    'settings' => 'Instellingen',
    'settingsTitle' => '{type, select,
        podcast {{pluginTitle} podcast settings}
        episode {{pluginTitle} episode settings}
        other {{pluginTitle} general settings}
    }',
    'view' => 'Weergeven',
    'activate' => 'Activeren',
    'deactivate' => 'Deactiveren',
    'active' => 'Actief',
    'inactive' => 'Inactief',
    'invalid' => 'Ongeldig',
    'incompatible' => 'Niet compatibel',
    'incompatible_hint' => 'Plugin requires Castopod v{minCastopodVersion} minimum.',
    'uninstall' => 'Deïnstalleren',
    'keywords' => [
        'podcasting20' => 'Podcasting 2.0',
        'seo' => 'SEO',
        'analytics' => 'Statistieken',
        'accessibility' => 'Toegankelijkheid',
    ],
    'noDescription' => 'Geen beschrijving',
    'noReadme' => 'Geen README-bestand gevonden.',
    'messages' => [
        'saveSettingsSuccess' => '{pluginTitle} settings were successfully saved!',
    ],
    'errors' => [
        'manifestError' => 'Plugin manifest has errors',
        'manifestMissing' => 'Plugin manifest "{manifestPath}" is missing.',
        'manifestJsonInvalid' => 'Plugin manifest "{manifestPath}" is not a valid JSON.',
    ],
];
