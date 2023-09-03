---
title: Autentisering og Autorisering
sidebarDepth: 3
---

# Autentisering og Autorisering

Castopod håndterer autentisering og autorisering ved hjelp av `codeigniter/shield`
sammen med tilpassede regler. Roller og tillatelser er definert på to nivåer:

1. [Instance-baserte roller og tillatelser](#1-roller-og-tillatelser-basert-på-instans)
2. [Podcast-baserte roller og tillatelser](#2-roller-og-tillatelser-basert-på-podcast)

## 1. Roller og tillatelser basert på instans

### Roller på instansen

<!-- AUTH-INSTANCE-ROLES-LIST:START - Do not remove or modify this section -->

| rolle         | beskrivelse                           | tillatelser                                                                                  |
| ------------  | -----------------------------------   | ------------------------------------------------------------------------------------------   |
| Super admin   | Har full kontroll over Castopod.      | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks   |
| Leder         | Håndterer innholdet i Castopod.       | podcasts.create, podcasts.import, persons.manage, pages.manage                               |
| Podcaster     | Generelle brukere av Castopod.        | admin.access                                                                                 |

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Tillatelser på instansen

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| tillatelse                | beskrivelse                                                                   |
| -----------------------   | ------------------------------------------------------------------             |
| admin.access            | Kan få tilgang til administrasjonssiden til Castopod.                   |
| admin.settings          | Kan få tilgang til innstillingene til Castopod.                          |
| users.manage            | Kan administrere brukere på Castopod.                                    |
| persons.manage          | Kan håndtere personer.                                                     |
| pages.manage            | Kan administrere sider.                                                    |
| podcasts.view           | Kan se alle podcaster.                                                     |
| podcasts.create         | Kan opprette nye podcaster.                                                |
| podcasts.import         | Kan importere podcaster.                                                   |
| fediverse.manage-blocks | Kan blokkere fediverse-brukere/domener fra å samhandle med Castopod.      |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Roller og tillatelser basert på podcast

### Roller basert på podcast

<!-- AUTH-PODCAST-ROLES-LIST:START - Do not remove or modify this section -->

| rolle    | beskrivelse                                                          | tillatelser                                                                                                                                                                                                                                            |
| -------  | ------------------------------------------------------------------  | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  |
| Admin    | Har full kontroll over podcast #{id}.                              | \*                                                                                                                                                                                                                                                     |
| Redaktør | Administrerer innholdet og publiseringene til podcast #{id}.        | view, edit, manage-import, manage-persons, manage-platforms, manage-publications, manage-notifications, interact-as, episodes.view, episodes.create, episodes.edit, episodes.delete, episodes.manage-persons, episodes.manage-clips, episodes.manage-publications, episodes.manage-comments |
| Forfatter | Håndterer innholdet i podcast #{id}, men kan ikke publisere det.    | view, manage-persons, episodes.view, episodes.create, episodes.edit, episodes.manage-persons, episodes.manage-clips                                                                                                                                |
| Gjest    | Generell bidragsyter til podcast #{id}.                             | view, episodes.view                                                                                                                                                                                                                                    |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Tillatelser basert på podcast

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| tillatelse                 | beskrivelse                                                                                   |
| ------------------------  | -----------------------------------------------------------------------------------------    |
| view                      | Kan se oversikten og analysene av podcast #{id}.                                               |
| edit                      | Kan redigere podcast #{id}.                                                                   |
| delete                    | Kan slette podcast #{id}.                                                                    |
| manage-imports            | Kan synkronisere importerte podcast #{id}.                                                    |
| manage-persons            | Kan håndtere abonnementer for podcast #{id}.                                                  |
| manage-subscriptions      | Kan håndtere abonnementer for podcast #{id}.                                                  |
| manage-contributors       | Kan håndtere bidragsytere for podcast #{id}.                                                   |
| manage-platforms          | Kan konfigurere/slette plattformkoblinger for podcast #{id}.                                   |
| manage-publications       | Kan publisere podcast #{id}.                                                                  |
| manage-notifications      | Kan vise og merke notifikasjoner som lest for podcast #{id}.                                  |
| interact-as               | Kan samhandle som podcast #{id} for å legge til, dele eller svare på meldinger.              |
| episodes.view             | Kan se oversikten og analysene av podcast #{id}.                                              |
| episodes.create           | Kan opprette episoder for podcast #{id}.                                                      |
| episodes.edit             | Kan redigere podcast #{id}.                                                                   |
| episodes.delete           | Kan slette podcast #{id}.                                                                    |
| episodes.manage-persons   | Kan håndtere abonnementer for podcast #{id}.                                                  |
| episodes.manage-clips     | Kan administrere videoklipp eller lydbiter for podcast #{id}.                                  |
| episodes.manage-publications | Kan publisere podcast #{id}.                                                                 |
| episodes.manage-comments  | Kan opprette/slette kommentarer for episoder i podcast #{id}.                                 |

<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->