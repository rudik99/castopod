<?php

declare(strict_types=1);

/**
 * @copyright  2020 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

return [
    'title' => 'Algemene instellingen',
    'instance' => [
        'title' => 'Instantie',
        'site_icon' => 'Site icon',
        'site_icon_delete' => 'Delete site icon',
        'site_icon_hint' => 'Site icons are what you see on your browser tabs, bookmarks bar, and when you add a website as a shortcut on mobile devices.',
        'site_icon_helper' => 'Icon must be squared and at least 512px wide and tall.',
        'site_name' => 'Naam van site',
        'site_description' => 'Site beschrijving',
        'submit' => 'Opslaan',
        'editSuccess' => 'Instantie is succesvol bijgewerkt!',
        'deleteIconSuccess' => 'Site icon has been remove successfully!',
    ],
    'images' => [
        'title' => 'Afbeeldingen',
        'subtitle' => 'Here you can regenerate all images based on the originals that were uploaded. To be used if you find that some images are missing. This task may take a while.',
        'regenerate' => 'Afbeeldingen regenereren',
        'regenerationSuccess' => 'All images have been regenerated successfully!',
    ],
    'housekeeping' => [
        'title' => 'Huishouden',
        'subtitle' => 'Runs various housekeeping tasks. Use this feature if you ever encounter issues with media files or data integrity. These tasks may take a while.',
        'reset_counts' => 'Reset counts',
        'reset_counts_helper' => 'Deze optie zal alle gegevensaantallen herberekenen en resetten (aantal volgers, berichten, opmerkingen, …).',
        'rewrite_media' => 'Herschrijf mediametagegevens',
        'rewrite_media_helper' => 'This option will delete all superfluous media files and recreate them (images, audio files, transcripts, chapters, …)',
        'rename_episodes_files' => 'Hernoem audiobestanden voor aflevering',
        'rename_episodes_files_hint' => 'This option will rename all episodes audio files to a random string of characters. Use this if one of your private episodes link was leaked as this will effectively hide it.',
        'clear_cache' => 'Alle cache wissen',
        'clear_cache_helper' => 'This option will flush redis cache or writable/cache files.',
        'run' => 'Run housekeeping',
        'runSuccess' => 'Housekeeping has been run successfully!',
    ],
    'theme' => [
        'title' => 'Thema',
        'accent_section_title' => 'Accentkleur',
        'accent_section_subtitle' => 'Kies de kleur om het uiterlijk van alle openbare pagina\'s te bepalen.',
        'pine' => 'Den',
        'crimson' => 'Crimson',
        'amber' => 'Amber',
        'lake' => 'Meer',
        'jacaranda' => 'Jacaranda',
        'onyx' => 'Onyx',
        'submit' => 'Opslaan',
        'setInstanceThemeSuccess' => 'Thema is succesvol bijgewerkt!',
    ],
];
