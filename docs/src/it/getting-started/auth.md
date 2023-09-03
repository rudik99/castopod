---
title: Autenticazione e Autorizzazione
sidebarDepth: 3
---

# Autenticazione e Autorizzazione

Castopod gestisce l'autenticazione e l'autorizzazione utilizzando
`codeigniter/shield` associato a regole personalizzate. I ruoli e i
permessi vengono definiti su due livelli:

1. [a livello di istanza](#1-ruoli-e-permessi-a-livello-di-istanza)
2. [per podcast](#2-ruoli-e-permessi-per-podcast)

## 1. Ruoli e permessi a livello di istanza

### Ruoli nell'istanza

<!-- AUTH-INSTANCE-ROLES-LIST:START - Non rimuovere o modificare questa sezione -->

| ruolo        | descrizione                          | permessi                                                                                     |
| ------------ | ------------------------------------ | ------------------------------------------------------------------------------------------- |
| Super admin  | Ha completo controllo su Castopod.   | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks |
| Gestore      | Gestisce i contenuti di Castopod.     | podcasts.create, podcasts.import, persons.manage, pages.manage                            |
| Podcaster    | Utenti generali di Castopod.          | admin.access                                                                                |

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Autorizzazioni nell'istanza

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - Non rimuovere o modificare questa sezione -->

| autorizzazione            | descrizione                                                        |
| ------------------------- | ------------------------------------------------------------------ |
| admin.access              | Può accedere all'area di amministrazione di Castopod.             |
| admin.settings            | Può accedere alle impostazioni di Castopod.                       |
| users.manage              | Può gestire gli utenti di Castopod.                               |
| persons.manage            | Può gestire le persone.                                           |
| pages.manage              | Permette di gestire le pagine.                                    |
| podcasts.view             | Può visualizzare tutti i podcast.                                 |
| podcasts.create           | Può creare nuovi podcast.                                         |
| podcasts.import           | Può importare podcast.                                            |
| fediverse.manage-blocks   | Può bloccare gli attori/domini fediverse dall'interagire con Castopod. |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Ruoli e permessi per podcast

### Ruoli per podcast

<!-- AUTH-PODCAST-ROLES-LIST:START - Non rimuovere o modificare questa sezione -->

| ruolo      | descrizione                                                  | permessi                                                                                                                                                                                                                                   |
| -----------| ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Admin      | Ha il controllo completo sul podcast #{id}.                  | \*                                                                                                                                                                                                                                         |
| Editor     | Gestisce i contenuti e le pubblicazioni del podcast #{id}.   | view, edit, manage-import, manage-persons, manage-platforms, manage-publications, manage-notifications, interact-as, episodes.view, episodes.create, episodes.edit, episodes.delete, episodes.manage-persons, episodes.manage-clips, episodes.manage-publications, episodes.manage-comments |
| Autore     | Gestisce i contenuti del podcast #{id}, ma non può pubblicarli. | view, manage-persons, episodes.view, episodes.create, episodes.edit, episodes.manage-persons, episodes.manage-clips                                                                                                                       |
| Ospite     | Contributore generale del podcast #{id}.                     | view, episodes.view                                                                                                                                                                                                                         |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Autorizzazioni per podcast

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - Non rimuovere o modificare questa sezione -->

| autorizzazione              | descrizione                                                                               |
| --------------------------- | ----------------------------------------------------------------------------------------- |
| view                        | Visualizza la dashboard e le statistiche del podcast #{id}.                                |
| edit                        | Può modificare il podcast #{id}.                                                           |
| delete                      | Può cancellare il podcast #{id}.                                                           |
| manage-imports              | Può sincronizzare il podcast importato #{id}.                                              |
| manage-persons              | Permette di gestire gli iscritti al podcast #{id}.                                         |
| manage-subscriptions        | Permette di gestire gli abbonamenti al podcast #{id}.                                      |
| manage-contributors         | Permette di gestire i contributori del podcast #{id}.                                      |
| manage-platforms            | Può configurare/rimuovere i link delle piattaforme del podcast #{id}.                     |
| manage-publications         | Può pubblicare il podcast #{id}.                                                           |
| manage-notifications        | Può visualizzare e contrassegnare come lette le notifiche per il podcast #{id}.            |
| interact-as                 | Può interagire come podcast #{id} per aggiungere, condividere o rispondere ai messaggi.   |
| episodes.view               | Può visualizzare la dashboard e le statistiche del podcast #{id}.                         |
| episodes.create             | Può creare episode per il podcast #{id}.                                                   |
| episodes.edit               | Può modificare il podcast #{id}.                                                           |
| episodes.delete             | Può cancellare il podcast #{id}.                                                           |
| episodes.manage-persons     | Permette di gestire gli iscritti al podcast #{id}.                                         |
| episodes.manage-clips       | Permette di gestire le clip video o parti audio del podcast #{id}.                         |
| episodes.manage-publications| Può pubblicare il podcast #{id}.                                                           |
| episodes.manage-comments    | Può creare/eliminare i commenti degli episodi del podcast #{id}.                           |

<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->