---
title: Authentifizierung und Autorisierung
sidebarDepth: 3
---

# Authentifizierung und Autorisierung

Castopod verwaltet die Authentifizierung und Autorisierung mithilfe von `codeigniter/shield` in Verbindung mit benutzerdefinierten Regeln. Rollen und Berechtigungen werden auf zwei Ebenen definiert:

1. [Auf Instanzebene](#1-Instanzweite-Rollen-und-Berechtigungen)
2. [Pro Podcast](#2-Rollen-und-Berechtigungen-pro-Podcast)

## 1. Instanzweite Rollen und Berechtigungen

### Rollen auf Instanzebene

<!-- AUTH-INSTANCE-ROLES-LIST:START - Do not remove or modify this section -->

| Rolle         | Beschreibung                          | Berechtigungen                                                                               |
| ------------- | ------------------------------------- | -------------------------------------------------------------------------------------------- |
| Superadmin    | Hat vollständige Kontrolle über Castopod. | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks |
| Manager       | Verwaltet den Inhalt von Castopod.      | podcasts.create, podcasts.import, persons.manage, pages.manage                             |
| Podcaster     | Allgemeine Benutzer von Castopod.       | admin.access                                                                               |

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Berechtigungen auf Instanzebene

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| Berechtigung            | Beschreibung                                           |
| ----------------------- | ------------------------------------------------------ |
| admin.access            | Kann auf den Castopod-Adminbereich zugreifen.           |
| admin.settings          | Kann auf die Castopod-Einstellungen zugreifen.          |
| users.manage            | Kann Benutzer von Castopod verwalten.                   |
| persons.manage          | Kann Personen verwalten.                               |
| pages.manage            | Kann Seiten verwalten.                                 |
| podcasts.view           | Kann alle Podcasts anzeigen.                           |
| podcasts.create         | Kann neue Podcasts erstellen.                          |
| podcasts.import         | Kann Podcasts importieren.                              |
| fediverse.manage-blocks | Kann fediverse-Akteure/ -Domains blockieren.            |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Rollen und Berechtigungen pro Podcast

### Rollen pro Podcast

<!-- AUTH-PODCAST-ROLES-LIST:START - Do not remove or modify this section -->

| Rolle       | Beschreibung                                                     | Berechtigungen                                                                                                                                                                                                                                                                                               |
| ----------- | --------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Admin       | Hat vollständige Kontrolle über den Podcast #{id}.               | \*                                                                                                                                                                                                                                                                                                          |
| Editor      | Verwaltet den Inhalt und die Veröffentlichungen des Podcasts #{id}.           | view, edit, manage-import, manage-persons, manage-platforms, manage-publications, manage-notifications, interact-as, episodes.view, episodes.create, episodes.edit, episodes.delete, episodes.manage-persons, episodes.manage-clips, episodes.manage-publications, episodes.manage-comments |
| Autor       | Verwaltet den Inhalt des Podcasts #{id}, kann ihn aber nicht veröffentlichen. | view, manage-persons, episodes.view, episodes.create, episodes.edit, episodes.manage-persons, episodes.manage-clips                                                                                                                                                                                       |
| Gast        | Allgemeiner Beitragender des Podcasts #{id}.                      | view, episodes.view                                                                                                                                                                                                                                                                                          |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Berechtigungen pro Podcast

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| Berechtigung                 | Beschreibung                                                                               |
| ---------------------------- | ----------------------------------------------------------------------------------------- |
| view                         | Anzeigen des Dashboards und der Analytics des Podcasts #{id}.                             |
| edit                         | Kann den Podcast #{id} bearbeiten.                                                         |
| delete                       | Kann den Podcast #{id} löschen.                                                            |
| manage-imports               | Kann den importierten Podcast #{id} synchronisieren.                                       |
| manage-persons               | Kann Abonnements des Podcasts #{id} verwalten.                                             |
| manage-subscriptions         | Kann Abonnements des Podcasts #{id} verwalten.                                             |
| manage-contributors          | Kann Beitragende des Podcasts #{id} verwalten.                                             |
| manage-platforms             | Kann Plattform-Links des Podcasts #{id} konfigurieren/löschen.                            |
| manage-publications          | Kann den Podcast #{id} veröffentlichen.                                                    |
| manage-notifications         | Kann die Benachrichtigungen für den Podcast #{id} anzeigen und als gelesen markieren.      |
| interact-as                  | Kann als Podcast #{id} interagieren und Nachrichten hinzufügen, teilen oder beantworten. |
| episodes.view                | Kann das Dashboard und die Analysen des Podcasts #{id} anzeigen.                           |
| episodes.create              | Kann Episoden für den Podcast #{id} erstellen.                                             |
| episodes.edit                | Kann den Podcast #{id} bearbeiten.                                                         |
| episodes.delete              | Kann den Podcast #{id} löschen.                                                            |
| episodes.manage-persons      | Kann Abonnements des Podcasts #{id} verwalten.                                             |
| episodes.manage-clips        | Kann Video-Clips oder Audio-Segmente des Podcasts #{id} verwalten.                         |
| episodes.manage-publications | Kann den Podcast #{id} veröffentlichen.                                                    |
| episodes.manage-comments     | Kann Kommentare der Episode des Podcasts #{id} erstellen/löschen.                          |

<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->