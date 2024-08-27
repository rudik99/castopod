<?php

declare(strict_types=1);

/**
 * @copyright  2022 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

return [
    'installed' => 'Plugin installé',
    'about' => 'À propos',
    'website' => 'Site web',
    'repository' => 'Dépôt du code',
    'authors' => 'Auteurs',
    'author_email' => 'Envoyer un email à {authorName}',
    'author_homepage' => 'Page de {authorName}',
    'declaredHooks' => 'Declared hooks',
    'settings' => 'Paramètres',
    'settingsTitle' => '{type, select,
        podcast {{pluginTitle} Paramètres du podcast}
        episode {{pluginTitle} Paramètres de l\'épisode}
        other {{pluginTitle} Paramètres généraux}
    }',
    'view' => 'Voir',
    'activate' => 'Activer',
    'deactivate' => 'Désactiver',
    'active' => 'Actif',
    'inactive' => 'Inactif',
    'invalid' => 'Invalide',
    'incompatible' => 'Incompatible',
    'incompatible_hint' => 'Le plugin nécessite Castopod v{minCastopodVersion} au minimum.',
    'uninstall' => 'Désinstaller',
    'keywords' => [
        'podcasting20' => 'Podcasting 2.0',
        'seo' => 'Optimisation pour les moteurs de recherche (SEO)',
        'analytics' => 'Mesures d’audience',
        'accessibility' => 'Accessibilité',
    ],
    'noDescription' => 'Aucune description',
    'noReadme' => 'Aucun fichier README trouvé.',
    'messages' => [
        'saveSettingsSuccess' => 'Les paramètres du plugin {pluginTitle} ont été enregistrés avec succès !',
    ],
    'errors' => [
        'manifestError' => 'Plugin manifest has errors',
        'manifestMissing' => 'Plugin manifest "{manifestPath}" is missing.',
        'manifestJsonInvalid' => 'Plugin manifest "{manifestPath}" is not a valid JSON.',
    ],
];
