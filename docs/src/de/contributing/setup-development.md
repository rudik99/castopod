---
title: Einrichtung der Entwicklungsumgebung
sidebarDepth: 3
---

# Richte deine Entwicklungsumgebung ein

## Einführung

Castopod ist eine Webanwendung, die auf dem `php`-Framework [CodeIgniter 4](https://codeigniter.com) basiert.

Wir verwenden [Docker](https://www.docker.com/), um schnell eine Entwicklungs-Umgebung einzurichten. In dem Projektordner sind eine `docker-compose.yml`-Datei und eine `Dockerfile` enthalten, die dir helfen sollen, deinen Beitrag zu starten.

> Du benötigst keine vorherigen Kenntnisse in Docker, um den nächsten Schritten zu folgen. Wenn du jedoch deine eigene Umgebung verwenden möchtest, kannst du das gerne tun!

## Installationsanleitung

### 1. Voraussetzungen

0. Installiere [docker](https://docs.docker.com/get-docker).

1. Klonen das Castopod-Projekt, indem du folgenden Befehl ausführst:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Erstelle eine `.env` Datei mit der minimalen Konfiguration, um die App mit der Datenbank zu verbinden und Redis als Cache-Handler zu verwenden:

   ```ini
   CI_ENVIRONMENT="development"
   # Wenn die Einstellung auf "development" gesetzt ist, musst du `npm run dev` ausführen, um den Server für die statischen Assets zu starten
   vite.environment="development"

   # Standardmäßig ist dies in der App-Konfiguration auf "true" eingestellt.
   # Für die Entwicklung muss dies auf "false" gesetzt werden, da es
   # sich um eine lokale Umgebung handelt
   app.forceGlobalSecureRequests=false

   app.baseURL="http://localhost:8080/"
   media.baseURL="http://localhost:8080/"

   admin.gateway="cp-admin"
   auth.gateway="cp-auth"

   database.default.hostname="mariadb"
   database.default.database="castopod"
   database.default.username="castopod"
   database.default.password="castopod"

   cache.handler="redis"
   cache.redis.host = "redis"

   # Du möchtest möglicherweise Redis nicht als Cache-Handler verwenden
   # Kommentiere/entferne die beiden Zeilen darüber und kommentiere die
   # nächste Zeile für den Datei-Cache.
   #cache.handler="file"
   ```

   > _Hinweis:_ Du kannst deine Umgebung anpassen, indem du weitere Umgebungsvariablen in deiner eigenen `.env`-Datei festlegst. Siehe die `env`-Datei für Beispiele oder das [CodeIgniter4 Benutzerhandbuch](https://codeigniter.com/user_guide/index.html) für weitere Informationen.

3. (für Docker Desktop) Füge das von dir geklonte Repository unter "Settings" > "Resources" > "File Sharing" in Docker Desktop hinzu.

### 2. (empfohlen) Entwicklung innerhalb des App-Containers mit VSCode

Wenn du mit VSCode arbeitest, kannst du den `.devcontainer/`-Ordner nutzen. Dieser definiert eine Entwicklungsumgebung (Dev Container) mit vorinstallierten Anforderungen und VSCode-Erweiterungen, sodass du dir keine Sorgen darum machen musst. Alle erforderlichen Dienste werden automatisch geladen! 🪄

1. Installiere die VSCode-Erweiterung [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
2. `Strg/Cmd + Umschalt + P` > `Im Container öffnen`.

   > Das VSCode-Fenster wird innerhalb des Dev-Containers neu geladen. Erwarte einige Minuten beim ersten Laden, da alle erforderlichen Dienste erstellt werden.

   **Hinweis**: Der Dev-Container wird durch Starten des Castopod-php-Servers gestartet. Während der Entwicklung musst du den Dev-Server von [Vite](https://vitejs.dev) starten, um den TypeScript-Code und die Styles zu kompilieren:

   ```bash
   # Vite Dev-Server starten
   npm run dev
   ```

   Wenn es Probleme mit dem php-Server gibt, der nicht läuft, kannst du sie mit den folgenden Befehlen neu starten:

   ```bash
   # Castopod-Server starten
   php spark serve - 0.0.0.0
   ```

3. Du bist fertig! 🎉

   Du befindest dich nun **im Dev-Container** und kannst die VSCode-Konsole (`Terminal` > `Neues Terminal`) verwenden, um beliebige Befehle auszuführen:

   ```bash
   # PHP ist installiert
   php -v

   # Composer ist installiert
   composer -V

   # npm ist installiert
   npm -v

   # git ist installiert
   git version
   ```

Weitere Informationen findest du unter [VSCode Remote Containers](https://code.visualstudio.com/docs/remote/containers)

### 3. Leg los!

Du bist bereit! Fange an, deine Magie zu wirken, indem du die Dateien des Projekts aktualisierst! Nutze die [CodeIgniter4 Benutzerhandbuch](https://codeigniter.com/user_guide/index.html), um weitere Einblicke zu erhalten.

Um deine Änderungen zu sehen, gehe zu:

- `http://localhost:8080/` für die Castopod-App
- `http://localhost:8888/` für die phpMyAdmin-Benutzeroberfläche:
  - Benutzername: **castopod**
  - Passwort: **castopod**

### 2-alt. Entwicklung außerhalb des App-Containers

Du möchtest den VSCode-Devcontainer nicht verwenden? Kein Problem!

1. Starte Docker-Container manuell:

   Gehe zum Stammordner des Projekts und führe aus:

   ```bash
   # startet alle im docker-compose.yml-Datei deklarierten Dienste
   # Die Option -d startet die Container im Hintergrund
   docker-compose up -d

   # Zeige alle ausgeführten Prozesse an (du solltest 3 Prozesse sehen)
   docker-compose ps

   # Du kannst auch alle Docker-Prozesse anzeigen
   docker ps -a
   ```

   > Der Befehl `docker-compose