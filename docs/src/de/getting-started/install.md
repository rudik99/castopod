---
title: Installation
sidebarDepth: 3
---

# Wie installiere ich Castopod?

Castopod wurde entwickelt, um einfach zu installieren zu sein. Es kann auf den meisten PHP-MySQL-kompatiblen Webservern installiert werden, ob dediziert oder shared.

::: tip Hinweis

Wir haben offizielle Docker-Images für Castopod veröffentlicht!

Wenn du Docker bevorzugst, kannst du diesen Teil überspringen und zur [Docker-Dokumentation](./docker.md) für Castopod gehen.

:::

## Voraussetzungen

- PHP v8.1
- MySQL Version 5.7 oder höher oder MariaDB Version 10.2 oder höher
- HTTPS-Unterstützung
- Eine [mit NTP synchronisierte Uhr](https://wiki.debian.org/NTP), um eingehende Anfragen der Föderation zu validieren

### PHP v8.1

Es wird PHP Version 8.1 benötigt, mit den folgenden installierten Erweiterungen:

- [intl](https://www.php.net/manual/de/intl.requirements.php)
- [libcurl](https://www.php.net/manual/de/curl.requirements.php)
- [mbstring](https://www.php.net/manual/de/mbstring.installation.php)
- [gd](https://www.php.net/manual/de/image.installation.php) mit den Bibliotheken **JPEG**, **PNG** und **WEBP**.
- [exif](https://www.php.net/manual/de/exif.installation.php)

Stelle außerdem sicher, dass die folgenden Erweiterungen in deinem PHP aktiviert sind:

- json (standardmäßig aktiviert - nicht deaktivieren)
- xml (standardmäßig aktiviert - nicht deaktivieren)
- [mysqlnd](https://www.php.net/manual/de/mysqlnd.install.php)

### MySQL-kompatible Datenbank

> Wir empfehlen die Verwendung von [MariaDB](https://mariadb.org).

::: warning Achtung

Castopod funktioniert nur mit MySQL-Datenbanken ab Version 5.7. Ältere Versionen wie 5.6 (der Support wurde am 5. Februar 2021 eingestellt) werden nicht funktionieren.

:::

Du benötigst den Hostnamen des Servers, den Datenbanknamen, den Benutzernamen und das Passwort, um den Installationsprozess abzuschließen. Wenn du diese Informationen nicht hast, kontaktiere bitte deinen Administrator.

#### Zugriffsberechtigungen

Der Benutzer muss mindestens die folgenden Zugriffsberechtigungen auf die Datenbank haben, damit Castopod funktioniert: `CREATE`, `ALTER`, `DELETE`, `EXECUTE`, `INDEX`, `INSERT`, `SELECT`, `UPDATE`, `REFERENCES`, `CREATE VIEW`.

### (Optional) FFmpeg v4.1.8 oder höher für Videoclips

[FFmpeg](https://www.ffmpeg.org/) in Version 4.1.8 oder höher wird benötigt, wenn du Videoclips generieren möchtest. Die folgenden Erweiterungen müssen installiert sein:

- Die **FreeType 2**-Bibliothek für [gd](https://www.php.net/manual/de/image.installation.php).

### (Optional) Weitere Empfehlungen

- Redis für bessere Cache-Performance
- CDN zur Cache-Speicherung statischer Dateien und für bessere Performance
- E-Mail-Gateway für verlorene Passwörter

## Installationsanleitung

### Voraussetzungen

0. Beschaffe einen Webserver mit den [Voraussetzungen](#voraussetzungen) installiert
1. Erstelle eine MySQL-Datenbank für Castopod mit einem Benutzer mit Schreib- und Zugriffsrechten (Weitere Informationen findest du unter [MySQL-kompatible Datenbank](#mysql-kompatible-datenbank)).
2. Aktiviere HTTPS für deine Domain mit einem _SSL-Zertifikat_.
3. Lade das neueste [Castopod-Paket](https://castopod.org/) herunter und entpacke es auf deinem Webserver, falls noch nicht geschehen.
   - ⚠️ Setze das Hauptdokument des Webservers auf den Unterordner `public/` des `castopod`-Ordners.

4. Füge **Cron-Jobs** auf deinem Webserver für verschiedene Hintergrundprozesse hinzu (ersetze die Pfade entsprechend):

   ```bash
      * * * * * /path/to/php /path/to/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Hinweis** - Wenn du diesen Cron-Job nicht hinzufügst, werden folgende Castopod-Funktionen nicht funktionieren:

   - Importieren eines Podcasts aus einem vorhandenen RSS-Feed
   - Teilen von sozialen Aktivitäten an deine Follower im Fediverse
   - Veröffentlichen von Episoden an offene Hubs mit Hilfe von [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Generieren von Videoclips - [benötigt FFmpeg](#optional-ffmpeg-v418-or-higher-for-video-clips)

### (Empfohlen) Installationsassistent

1. Rufe das Castopod-Installations-Skript mit deinem bevorzugten Webbrowser auf, indem du die Installationsseite aufrufst (`https://your_domain_name.com/cp-install`).
2. Befolge die angezeigten Anweisungen.
3. Fang an zu podcasten!

:::info Hinweis

Das Installations-Skript erstellt eine `.env`-Datei in der Wurzel des Pakets. Wenn du den Installationsassistenten nicht verwenden kannst, kannst du die `.env`-Datei manuell anhand der `.env.example`-Datei erstellen und bearbeiten.

:::

### E-Mail/SMTP-Konfiguration

Die E-Mail-Konfiguration ist erforderlich, damit bestimmte Funktionen ordnungsgemäß funktionieren (z. B. das Abrufen deines vergessenen Passworts, das Senden von Anweisungen an Premium-Abonnenten, ...).

Du kannst deine E-Mail-Konfiguration in der `.env`-Datei deiner Instanz wie folgt hinzufügen:

```ini
# […]

email.fromEmail="deine_e-mail_adresse"
email.SMTPHost="dein_smtp_host"
email.SMTPUser="dein_smtp_benutzer"
email.SMTPPass="dein_smtp_passwort"
```

#### E