---
title: Autenticació i Autorització
sidebarDepth: 3
---

# Autenticació i Autorització

Castopod gestiona l'autenticació i l'autorització utilitzant `codeigniter/shield` amb regles personalitzades. Els rols i les autoritzacions es defineixen a dos nivells:

1. [A nivell d'instància](#1-roles-i-autoritzacions-a-nivell-dinstancia)
2. [Per podcast](#2-roles-i-autoritzacions-per-podcast)

## 1. Rols i autoritzacions a nivell d'instància

### Rols a l'instància

<!-- AUTH-INSTANCE-ROLES-LIST:START - Do not remove or modify this section -->

| rol           | descripció                           | autoritzacions                                                                              |
| -------------- | ----------------------------------- | ------------------------------------------------------------------------------------------ |
| Super admin    | Té un control complet sobre Castopod | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks |
| Gestor         | Gestiona el contingut de Castopod    | podcasts.create, podcasts.import, persons.manage, pages.manage                             |
| Podcaster      | Usuaris generals de Castopod         | admin.access                                                                               |

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Autoritzacions a l'instància

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| autorització           | descripció                                                                                                                                                 |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| admin.access           | Pot accedir a la zona d'administració de Castopod.                                                                                                         |
| admin.settings         | Pot accedir a la configuració de Castopod.                                                                                                                 |
| users.manage           | Pot gestionar els usuaris de Castopod.                                                                                                                     |
| persons.manage         | Pot gestionar les persones.                                                                                                                               |
| pages.manage           | Permet gestionar les pàgines.                                                                                                                             |
| podcasts.view          | Pot veure tots els podcasts.                                                                                                                              |
| podcasts.create        | Pot crear nous podcasts.                                                                                                                                  |
| podcasts.import        | Pot importar podcasts.                                                                                                                                    |
| fediverse.manage-blocks | Pot bloquejar actors o dominis de la fediverse per interactuar amb Castopod.                                                                              |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Rols i autoritzacions per podcast

### Rols per podcast

<!-- AUTH-PODCAST-ROLES-LIST:START - Do not remove or modify this section -->

| rol       | descripció                                                      | autoritzacions                                                                                                                                                                                                                                           |
| ---------- | -------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Admin      | Té control total sobre el podcast #{id}                         | \*                                                                                                                                                                                                                                                      |
| Editor     | Gestiona el contingut i les publicacions del podcast #{id}     | view, edit, manage-import, manage-persons, manage-platforms, manage-publications, manage-notifications, interact-as, episodes.view, episodes.create, episodes.edit, episodes.delete, episodes.manage-persons, episodes.manage-clips, episodes.manage-publications, episodes.manage-comments |
| Autor      | Gestiona el contingut del podcast #{id}, però no el pot publicar | view, manage-persons, episodes.view, episodes.create, episodes.edit, episodes.manage-persons, episodes.manage-clips                                                                                                                                   |
| Convidat   | Col·laborador general del podcast #{id}                        | view, episodes.view                                                                                                                                                                                                                                     |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Autoritzacions per podcast

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| autorització                | descripció                                                                                                                                                                        |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| veure                       | Visualització del tauler de control i l'anàlisi del podcast #{id}.                                                                                                                |
| editar                      | Pot editar el podcast #{id}.                                                                                                                                                     |
| eliminar                    | Pot eliminar el podcast #{id}.                                                                                                                                                   |
| gestionar importacions      | Pot sincronitzar el podcast importat #{id}.                                                                                                                                      |
| gestionar persones          | Permet gestionar les subscripcions al podcast #{id}.                                                                                                                            |
| gestionar subscripcions     | Permet gestionar les subscripcions al podcast #{id}.                                                                                                                            |
| gestionar col·laboradors    | Permet gestionar els col·laboradors del podcast #{id}.                                                                                                                           |
| gestionar plataformes       | Pot configurar/eliminar els enllaços a les plataformes del podcast #{id}.                                                                                                         |
| gestionar publicacions      | Pot publicar el podcast #{id}.                                                                                                                                                   |
| gestionar notificacions     | Pot veure i marcar les notificacions com a llegides per al podcast #{id}.                                                                                                        |
| interactuar com a           | Pot interactuar com a podcast #{id} per afegir, compartir o respondre missatges.                                                                                                 |
| episodes.view               | Pot veure el tauler de control i l'anàlisi del podcast #{id}.                                                                                                                   |
| crear episodis              | Pot crear episodis per al podcast #{id}.                                                                                                                                         |
| editar episodis             | Pot editar el podcast #{id}.                                                                                                                                                     |
| eliminar episodis           | Pot eliminar el podcast #{id}.                                                                                                                                                   |
| episodes.manage-persons     | Permet gestionar les subscripcions al podcast #{id}.                                                                                                                            |
| episodes.manage-clips       | Permet gestionar clips de vídeo o parts sonores del podcast #{id}.                                                                                                              |
| episodes.manage-publications| Pot publicar el podcast #{id}.                                                                                                                                                   |
| episodes.manage-comments    | Pot crear/eliminar comentaris de l'episodi del podcast #{id}.                                                                                                                   |
                                                                                                    
<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->