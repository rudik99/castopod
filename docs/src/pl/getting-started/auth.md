---
title: Autoryzacja i Uprawnienia
sidebarDepth: 3
---

# Autoryzacja i Uprawnienia

Castopod zarządza autoryzacją i uprawnieniami za pomocą `codeigniter/shield` w połączeniu z niestandardowymi regułami. Role i uprawnienia są zdefiniowane na dwóch poziomach:

1. [W skali instancji](#1-role-i-uprawnienia-w-skali-instancji)
2. [Dla poszczególnych podcastów](#2-role-i-uprawnienia-dla-poszczególnych-podcastów)

## 1. Role i uprawnienia w skali instancji

### Role w instancji

<!-- AUTH-INSTANCE-ROLES-LIST:START - Do not remove or modify this section -->

| rola         | opis                                      | uprawnienia                                                                                       |
| ------------ | ----------------------------------------- | ------------------------------------------------------------------------------------------------- |
| Super admin  | Ma pełną kontrolę nad Castopod.           | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks       |
| Zarządzający | Zarządza treścią Castopod.                | podcasts.create, podcasts.import, persons.manage, pages.manage                                   |
| Podcaster    | Zwykły użytkownik Castopod.               | admin.access                                                                                      |

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Uprawnienia w instancji

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| uprawnienie              | opis                                                             |
| ----------------------- | ---------------------------------------------------------------- |
| admin.access            | Może uzyskać dostęp do panelu administracyjnego Castopod.        |
| admin.settings          | Może uzyskać dostęp do ustawień Castopod.                        |
| users.manage            | Może zarządzać użytkownikami Castopod.                            |
| persons.manage          | Może zarządzać osobami.                                          |
| pages.manage            | Może zarządzać stronami.                                          |
| podcasts.view           | Może przeglądać wszystkie podcasty.                              |
| podcasts.create         | Może tworzyć nowe podcasty.                                      |
| podcasts.import         | Może importować podcasty.                                        |
| fediverse.manage-blocks | Może blokować aktorów/domenei federacji od interakcji z Castopod. |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Role i uprawnienia dla poszczególnych podcastów

### Role dla poszczególnych podcastów

<!-- AUTH-PODCAST-ROLES-LIST:START - Do not remove or modify this section -->

| rola     | opis                                                   | uprawnienia                                                                                                                                                                                                                                                                                     |
| -------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Admin    | Ma pełną kontrolę nad podcastem #{id}.                 | \*                                                                                                                                                                                                                                                                                              |
| Redaktor | Zarządza treścią i publikacjami podcastu #{id}.        | view, edit, manage-import, manage-persons, manage-platforms, manage-publications, manage-notifications, interact-as, episodes.view, episodes.create, episodes.edit, episodes.delete, episodes.manage-persons, episodes.manage-clips, episodes.manage-publications, episodes.manage-comments |
| Autor    | Zarządza treścią podcastu #{id}, ale nie może publikować. | view, manage-persons, episodes.view, episodes.create, episodes.edit, episodes.manage-persons, episodes.manage-clips                                                                                                                                                                           |
| Gość     | Ogólny współtwórca podcastu #{id}.                       | view, episodes.view                                                                                                                                                                                                                                                                           |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Uprawnienia dla poszczególnych podcastów

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| uprawnienie                 | opis                                                                 |
| --------------------------- | ------------------------------------------------------------------- |
| widzieć                     | Dostęp do panelu sterowania i analizy podcastu #{id}.                |
| edytować                    | Może edytować podcast #{id}.                                         |
| usunąć                      | Może usunąć podcast #{id}.                                           |
| zarządzać importami         | Może synchronizować zaimportowany podcast #{id}.                     |
| zarządzać osobami           | Może zarządzać subskrypcjami dla podcastu #{id}.                     |
| zarządzać subskrypcjami     | Może zarządzać subskrypcjami dla podcastu #{id}.                     |
| zarządzać współpracownikami  | Może zarządzać współpracownikami podcastu #{id}.                      |
| zarządzać platformami       | Może konfigurować/usuwać linki do platformy na podcast #{id}.        |
| zarządzać publikacjami      | Może publikować podcast #{id}.                                       |
| zarządzać powiadomieniami    | Może przeglądać i oznaczać powiadomienia jako przeczytane dla podcastu #{id}. |
| działać jako                | Może działać jako podcast #{id}, aby dodawać, udostępniać lub odpowiadać na wiadomości. |
| episodes.view               | Może przeglądać zestawienia i analizy podcastu #{id}.               |
| stworzyć odcinki            | Może tworzyć odcinki dla podcastu #{id}.                             |
| edytować odcinki            | Może edytować odcinki podcastu #{id}.                                |
| usunąć odcinki              | Może usunąć odcinki podcastu #{id}.                                  |
| episodes.manage-persons     | Może zarządzać subskrypcjami dla podcastu #{id}.                     |
| episodes.manage-clips       | Może zarządzać klipami wideo lub dźwiękowymi dla podcastu #{id}.     |
| episodes.manage-publications| Może publikować podcast #{id}.                                       |
| episodes.manage-comments    | Może tworzyć/usuwać komentarze odcinka podcastu #{id}.              |

<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->