---
titel: Autentisering och behörighet
sidebarDepth: 3
---

# Autentisering och behörighet

Castopod hanterar autentisering och behörighet med hjälp av `codeigniter/shield` med anpassade regler. Roller och behörigheter definieras på två nivåer:

1. [På instansnivå](#1-roller-och-behorigheter-pa-instansniva)
2. [Per podcast](#2-roller-och-behorigheter-per-podcast)

## 1. Roller och behörigheter på instansnivå

### Roller på instansen

<!-- AUTH-INSTANCE-ROLES-LIST:START - Do not remove or modify this section -->

| roll          | beskrivning                               | behörigheter                                                                                   |
| ------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------------- |
| Super admin   | Har full kontroll över Castopod.          | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks    |
| Manager       | Hanterar Castopods innehåll.              | podcasts.create, podcasts.import, persons.manage, pages.manage                                |
| Podcaster     | Allmänna användare av Castopod.           | admin.access                                                                                  |

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Behörigheter på instansen

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| behörighet                | beskrivning                                               |
| ------------------------- | --------------------------------------------------------- |
| admin.access              | Kan komma åt Castopods administrationsområde.             |
| admin.settings            | Kan komma åt Castopods inställningar.                     |
| users.manage              | Kan hantera Castopod-användare.                           |
| persons.manage            | Kan hantera personer.                                     |
| pages.manage              | Kan hantera sidor.                                        |
| podcasts.view             | Kan se alla podcasts.                                     |
| podcasts.create           | Kan skapa nya podcasts.                                   |
| podcasts.import           | Kan importera podcasts.                                   |
| fediverse.manage-blocks   | Kan blockera fediverse-aktörer/domäner från att interagera med Castopod. |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Roller och behörigheter per podcast

### Roller per podcast

<!-- AUTH-PODCAST-ROLES-LIST:START - Do not remove or modify this section -->

| roll     | beskrivning                                        | behörigheter                                                                                                                                                                                                                   |
| -------- | -------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Admin    | Har fullständig kontroll över podcast #{id}.        | \*                                                                                                                                                                                                                             |
| Redaktör | Hanterar innehåll och publicering för podcast #{id}. | view, edit, manage-import, manage-persons, manage-platforms, manage-publications, manage-notifications, interact-as, episodes.view, episodes.create, episodes.edit, episodes.delete, episodes.manage-persons, episodes.manage-clips, episodes.manage-publications, episodes.manage-comments |
| Författare  | Hanterar innehållet för podcast #{id}, men kan inte publicera det. | view, manage-persons, episodes.view, episodes.create, episodes.edit, episodes.manage-persons, episodes.manage-clips                                                                                                                                                                 |
| Gäst  | Allmän medarbetare för podcast #{id}.                  | view, episodes.view                                                                                                                                                                                                                   |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Behörigheter per podcast

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| behörighet                      | beskrivning                                                                             |
| ------------------------------- | --------------------------------------------------------------------------------------- |
| view                            | Kan visa podcast #{id}s instrumentpanel och analysera.                                   |
| edit                            | Kan redigera podcast #{id}.                                                             |
| delete                          | Kan ta bort podcast #{id}.                                                              |
| manage-imports                  | Kan synkronisera importerad podcast #{id}.                                               |
| manage-persons                  | Kan hantera prenumerationer för podcast #{id}.                                           |
| manage-subscriptions            | Kan hantera prenumerationer för podcast #{id}.                                           |
| manage-contributors             | Kan hantera medarbetare för podcast #{id}.                                               |
| manage-platforms                | Kan konfigurera/ta bort länkar till podcast #{id}s plattform.                           |
| manage-publications             | Kan publicera podcast #{id}.                                                            |
| manage-notifications            | Kan visa och markera meddelanden som lästa för podcast #{id}.                           |
| interact-as                     | Kan interagera som podcast #{id} för att lägga till, dela eller svara på meddelanden.    |
| episodes.view                   | Kan visa podcast #{id}s instrumentpanel och analysera.                                   |
| episodes.create                 | Kan skapa episoder för podcast #{id}.                                                   |
| episodes.edit                   | Kan redigera podcast #{id}.                                                             |
| episodes.delete                 | Kan ta bort podcast #{id}.                                                              |
| episodes.manage-persons         | Kan hantera prenumerationer för podcast #{id}.                                           |
| episodes.manage-clips           | Kan hantera videoklipp eller ljudklipp för podcast #{id}.                                |
| episodes.manage-publications    | Kan publicera podcast #{id}.                                                            |
| episodes.manage-comments        | Kan skapa/ta bort kommentarer för podcast #{id}s episod.                                 |

<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->