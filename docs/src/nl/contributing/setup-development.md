---
title: Ontwikkelomgeving instellen
sidebarDepth: 3
---

# Stel je ontwikkelomgeving in

## Inleiding

Castopod is een web-app gebaseerd op het `php` framework [CodeIgniter 4](https://codeigniter.com).

We gebruiken [Docker](https://www.docker.com/) om snel een ontwikkelomgeving in te stellen. Een `docker-compose.yml` en `Dockerfile` zijn opgenomen in de hoofdmap van het project om je op weg te helpen met je bijdrage.

> Je hebt geen voorkennis van Docker nodig om de volgende stappen te volgen. Als je echter je eigen omgeving wilt gebruiken, voel je vrij om dat te doen!

## Instructies voor installatie

### 1. Benodigdheden

0. Installeer [docker](https://docs.docker.com/get-docker).

1. Clone het Castopod project door het volgende commando uit te voeren:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Maak een `.env`-bestand aan met de minimale vereiste configuratie om de app te verbinden met de database en redis te gebruiken als cache handler:

   ```ini
   CI_ENVIRONMENT="development"
   # If set to development, you must run `npm run dev` to start the static assets server
   vite.environment="development"

   # By default, this is set to true in the app config.
   # For development, this must be set to false as it is
   # on a local environment
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

   # You may not want to use redis as your cache handler
   # Comment/remove the two lines above and uncomment
   # the next line for file caching.
   #cache.handler="file"
   ```

   > _NB._ Je kunt je omgeving aanpassen door meer omgevingsvariabelen in je aangepaste `.env`-bestand in te stellen. Zie `env` voor voorbeelden of de [CodeIgniter4 User Guide](https://codeigniter.com/user_guide/index.html) voor meer informatie.

3. (voor docker desktop) Voeg de repository die je hebt gekloond toe aan `Settings` > `Resources` > `File Sharing` van Docker desktop.

### 2. (aanbevolen) Ontwikkel binnen de app container met VSCode

Als je werkt in VSCode, kun je gebruikmaken van de `.devcontainer/` map. Hiermee definieer je een ontwikkelomgeving (dev container) met vooraf geïnstalleerde vereisten en VSCode-extensies, zodat je je daar geen zorgen over hoeft te maken. Alle vereiste services worden automatisch geladen! 🪄

1. Installeer de VSCode-extensie [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
2. `Ctrl/Cmd + Shift + P` > `Openen in container`

   > Het VSCode-venster wordt opnieuw geladen in de development container. Verwacht enkele minuten tijdens de eerste keer laden, omdat alle benodigde services worden opgebouwd.

   **Let op**: De ontwikkelcontainer wordt gestart door de php-server van Castopod uit te voeren. Tijdens de ontwikkeling moet je de [Vite](https://vitejs.dev) dev-server starten voor het compileren van de TypeScript-code en stijlen:

   ```bash
   # voer Vite dev server uit
   npm run dev
   ```

   Als er problemen zijn met de php-server die niet wordt uitgevoerd, kun je deze opnieuw starten met de volgende commando's:

   ```bash
   # voer Castopod server uit
   php spark serve - 0.0.0.0
   ```

3. Je bent klaar! 🎉

   Je bent nu **binnen de dev container**, je kunt de VSCode-console (`Terminal` > `Nieuwe Terminal`) gebruiken om elk commando uit te voeren:

   ```bash
   # PHP is geïnstalleerd
   php -v

   # Composer is geïnstalleerd
   composer -V

   # npm is geïnstalleerd
   npm -v

   # git is geïnstalleerd
   git version
   ```

Voor meer informatie, zie [VSCode Remote Containers](https://code.visualstudio.com/docs/remote/containers).

### 3. Begin met programmeren

Je bent klaar! Begin met het bijwerken van de bestanden van het project! Raadpleeg de [CodeIgniter4 User Guide](https://codeigniter.com/user_guide/index.html) voor meer inzicht.

Om je wijzigingen te zien, ga naar:

- `http://localhost:8080/` voor de Castopod-app
- `http://localhost:8888/` voor de phpmyadmin-interface:

  - gebruikersnaam: **castopod**
  - wachtwoord: **castopod**

### 2-alt. Ontwikkelen buiten de app-container

Wil je de VSCode-devcontainer niet gebruiken? Geen probleem!

1. Start de Docker-containers handmatig:

   Ga naar de hoofdmap van het project en voer het volgende commando uit:

   ```bash
   # start alle services die zijn gedeclareerd in het docker-compose.yml-bestand
   # de optie -d start de containers op de achtergrond
   docker-compose up -d

   # Bekijk alle actieve processen (je zou 3 processen moeten zien uitgevoerd worden)
   docker-compose ps

   # Als alternatief kun je alle Docker-processen bekijken
   docker ps -a
   ```

   > Het commando `docker-compose up -d` start 4 containers op de achtergrond:
   >
   > - `castopod_app`: een op php gebaseerde container met Castopod-vereisten geïnstalleerd
   > - `castopod_redis`: een [redis](