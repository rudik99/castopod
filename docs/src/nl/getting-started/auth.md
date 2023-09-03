---
title: Authenticatie en Autorisatie
sidebarDepth: 3
---

# Authenticatie en Autorisatie

Castopod beheert authenticatie en autorisatie met behulp van
`codeigniter/shield` in combinatie met aangepaste regels. Rollen en
machtigingen zijn gedefinieerd op twee niveaus:

1. [Instancebrede rollen en machtigingen](#1-instance-wide-roles-and-permissions)
2. [Per podcast](#2-per-podcast-roles-and-permissions)

## 1. Instancebrede rollen en machtigingen

### Rollen in de instance

<!-- AUTH-INSTANCE-ROLES-LIST:START - Do not remove or modify this section -->

| rol          | beschrijving                                 | machtigingen                                                                                                |
| ------------ | -----------------------------------         | ------------------------------------------------------------------------------------------                    |
| Super admin  | Heeft volledige controle over Castopod.       | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks                 |
| Manager      | Beheert de inhoud van Castopod.              | podcasts.create, podcasts.import, persons.manage, pages.manage                                               |
| Podcaster    | Gewone gebruikers van Castopod.              | admin.access                                                                                                 |

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Machtigingen in de instance

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| machtiging              | beschrijving                                                     |
| ----------------------- | -------------------------------------------------------------------- |
| admin.access            | Kan toegang krijgen tot het Castopod-beheergebied.                   |
| admin.settings          | Kan Castopod-instellingen bekijken en wijzigen.                      |
| users.manage            | Kan gebruikers beheren.                                              |
| persons.manage          | Kan personen beheren.                                                |
| pages.manage            | Kan pagina's beheren.                                                |
| podcasts.view           | Kan alle podcasts bekijken.                                          |
| podcasts.create         | Kan nieuwe podcasts aanmaken.                                        |
| podcasts.import         | Kan podcasts importeren.                                             |
| fediverse.manage-blocks | Kan fediverse actoren/domeinen blokkeren zodat ze niet kunnen communiceren met Castopod. |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Rollen en machtigingen per podcast

### Rollen per podcast

<!-- AUTH-PODCAST-ROLES-LIST:START - Do not remove or modify this section -->

| rol    | beschrijving                                                | machtigingen                                                                                                                                                                                                                  |
| ------- | ----------------------------------------------------        | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Admin   | Heeft volledige controle over podcast #{id}.                  | \*                                                                                                                                                                                                                                   |
| Editor | Beheert de inhoud en publicaties van podcast #{id}.         | view, edit, manage-import, manage-persons, manage-platforms, manage-publications, manage-notifications, interact-as, episodes.view, episodes.create, episodes.edit, episodes.delete, episodes.manage-persons, episodes.manage-clips, episodes.manage-publications, episodes.manage-comments |
| Auteur  | Beheert de inhoud van podcast #{id}, maar kan deze niet publiceren. | view, manage-persons, episodes.view, episodes.create, episodes.edit, episodes.manage-persons, episodes.manage-clips                                                                                                                                                                          |
| Gast  | Algemene bijdrager van podcast #{id}.                        | view, episodes.view                                                                                                                                                                                                         |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Machtigingen per podcast

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| machtiging               | beschrijving                                                                                     |
| ------------------------ | ------------------------------------------------------------------------------------------------- |
| view                     | Toegang tot het dashboard en de analyse van podcast #{id}.                                         |
| edit                     | Kan podcast #{id} bewerken.                                                                      |
| delete                   | Kan podcast #{id} verwijderen.                                                                   |
| manage-import             | Kan geïmporteerde podcast #{id} synchroniseren.                                                   |
| manage-persons            | Kan abonnees beheren van podcast #{id}.                                                           |
| manage-subscriptions      | Kan abonnementen beheren van podcast #{id}.                                                        |
| manage-contributors       | Kan bijdragers beheren van podcast #{id}.                                                          |
| manage-platforms          | Kan koppelingen naar podcast #{id} platformen configureren/verwijderen.                            |
| manage-publications       | Kan podcast #{id} publiceren.                                                                     |
| manage-notifications      | Kan meldingen voor podcast #{id} bekijken en markeren als gelezen.                                |
| interact-as               | Kan namens podcast #{id} interacties toevoegen, delen of beantwoorden.                            |
| episodes.view             | Kan dashboard en analyses van podcast #{id} bekijken.                                             |
| episodes.create           | Kan afleveringen maken voor podcast #{id}.                                                        |
| episodes.edit             | Kan podcast #{id} bewerken.                                                                      |
| episodes.delete           | Kan podcast #{id} verwijderen.                                                                   |
| episodes.manage-persons    | Kan abonnees beheren van podcast #{id}.                                                           |
| episodes.manage-clips      | Kan videoclips of audiofragmenten van podcast #{id} beheren.                                      |
| episodes.manage-publications | Kan podcast #{id} publiceren.                                                                     |
| episodes.manage-comments   | Kan opmerkingen maken/verwijderen voor afleveringen van podcast #{id}.                           |

<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->