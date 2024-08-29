<?php

declare(strict_types=1);

/**
 * @copyright  2020 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

return [
    'season' => 'Temporada {seasonNumber}',
    'season_abbr' => 'S{seasonNumber}',
    'number' => 'Episodi {episodeNumber}',
    'number_abbr' => 'Ep. {episodeNumber}',
    'season_episode' => 'Temporada {seasonNumber} episodi {episodeNumber}',
    'season_episode_abbr' => 'S{seasonNumber}:E{episodeNumber}',
    'persons' => '{personsCount, plural,
        one {# persona}
        other {# persones}
    }',
    'persons_list' => 'Persones',
    'back_to_episodes' => 'Tornar als episodis de {podcast}',
    'comments' => 'Comentaris',
    'activity' => 'Activitat',
    'chapters' => 'Capítols',
    'transcript' => 'Transcripció',
    'description' => 'Descripció de l\'episodi',
    'number_of_comments' => '{numberOfComments, plural,
        one {# comentari}
        other {# comentaris}
    }',
    'all_podcast_episodes' => 'Tots els episodis del podcast',
    'back_to_podcast' => 'Tornar al podcast',
    'preview' => [
        'title' => 'Vista prèvia',
        'not_published' => 'No publicat',
        'text' => '{publication_status, select,
            published {L\'episodi ja s\'ha publicat.}
            scheduled {L\'episodi està programat perquè es publiqui a {publication_date}.}
            with_podcast {Aquest episodi es publicarà alhora que el podcast.}
            other {Aquest episodi encara no s\'ha publicat.}
        }',
        'publish' => 'Publica',
        'publish_edit' => 'Edita la publicació',
    ],
    'no_chapters' => 'Aquest episodi no està dividit en capítols.',
    'download_transcript' => 'Descarrega\'n la transcripció ({extension})',
    'no_transcript' => 'Aquest episodi no té transcripció.',
];
