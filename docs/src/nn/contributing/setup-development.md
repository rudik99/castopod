---
title: Oppsett av utviklingsmiljø
sidebarDepth: 3
---

# Sett opp utviklingsmiljøet ditt

## Innledning

Castopod er en nettapplikasjon basert på `php`-rammeverket
[CodeIgniter 4](https://codeigniter.com).

Vi bruker [Docker](https://www.docker.com/) for å raskt sette opp et utviklingsmiljø. En
`docker-compose.yml`- og en `Dockerfile`-fil er inkludert i prosjektets rotmappe for å hjelpe deg med å komme i gang med bidraget.

> Du trenger ingen forkunnskaper om Docker for å følge de neste trinnene.
> Hvis du ønsker å bruke ditt eget miljø, er du velkommen til å gjøre det!

## Oppsettinstruksjoner

### 1. Forutsetninger

0. Installer [docker](https://docs.docker.com/get-docker).

1. Klon Castopod-prosjektet ved å kjøre:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Opprett en `.env`-fil med minimumskonfigurasjonen som kreves for å koble appen til
   databasen og bruke Redis som hurtigbufferbehandler:

   ```ini
   CI_ENVIRONMENT="development"
   # Hvis det er satt til development, må du kjøre `npm run dev` for å starte serveren for statiske ressurser
   vite.environment="development"

   # Som standard er dette satt til true i appkonfigurasjonen.
   # For utvikling må dette settes til false fordi det
   # kjøres i et lokalt miljø
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

   # Du vil muligens ikke bruke Redis som hurtigbufferbehandler
   # Kommenter/fjern de to linjene ovenfor og kommenter ut
   # neste linje for filhurtigbufretjenester.
   #cache.handler="file"
   ```

   > _NB._ Du kan tilpasse miljøet ditt ved å sette flere miljøvariabler
   > i den egendefinerte `.env`-filen din. Se `env` for eksempler eller
   > [CodeIgniter4-brukerveiledningen](https://codeigniter.com/user_guide/index.html)
   > for mer informasjon.

3. (for Docker Desktop) Legg til repositoriet du har klonet i Docker Desktops
   `Settings` > `Resources` > `File Sharing`

### 2. (anbefalt) Utvikle inne i appkontaineren med VSCode

Hvis du bruker VSCode, kan du dra nytte av `.devcontainer/`-mappen. Den definerer et utviklingsmiljø (utviklerkontainer) med forhåndsinstallerte
krav og VSCode-utvidelser, slik at du ikke trenger å bekymre deg for dem. Alle
nødvendige tjenester vil bli lastet inn automatisk! 🪄

1. Installer VSCode-utvidelsen
   [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. `Ctrl/Cmd + Shift + P` > `Open in container`

   > VSCode-vinduet lastes inn på nytt inne i utviklerkontaineren. Forvent flere
   > minutter under første lasting, da det bygger alle nødvendige tjenester.

   **Merk**: Utviklerkontaineren vil starte ved å kjøre Castopods PHP-server.
   Under utviklingen må du også starte [Vite](https://vitejs.dev)s utviklingsserver for å kompilere TypeScript-koden og stilene:

   ```bash
   # Kjør Vite-utviklingsserveren
   npm run dev
   ```

   Hvis det oppstår problemer med at PHP-serveren ikke kjører, kan du starte dem på nytt
   ved å bruke følgende kommandoer:

   ```bash
   # Kjør Castopod-serveren
   php spark serve - 0.0.0.0
   ```

3. Du er klar til å starte! 🎉

   Du er nå **inne i utviklerkontaineren**, og du kan bruke VSCode-konsollen
   (`Terminal` > `New Terminal`) for å kjøre kommandoer:

   ```bash
   # PHP er installert
   php -v

   # Composer er installert
   composer -V

   # npm er installert
   npm -v

   # Git er installert
   git version
   ```

For mer informasjon, se
[VSCode Remote Containers](https://code.visualstudio.com/docs/remote/containers)

### 3. Start med å utvikle

Du er klar til å gå i gang! Begynn med å trylle frem endringer i prosjektfilene! Du kan
bruke
[CodeIgniter4 User Guide](https://codeigniter.com/user_guide/index.html)
for å få flere innsikter.

For å se endringene dine, gå til:

- `http://localhost:8080/` for Castopod-appen
- `http://localhost:8888/` for phpmyadmin-grensesnittet:

  - Brukernavn: **castopod**
  - Passord: **castopod**

### 2-alt. Utvikle utenfor appkontaineren

Hvis du ikke ønsker å bruke VSCode-utviklerkontaineren, er det ikke noe problem!

1. Start Docker-kontainere manuelt:

   Gå til prosjektets rotmappe og kjør:

   ```bash
   # Starter alle tjenester som er oppført i docker-compose.yml-filen
   # -d-bruket starter kontainerne i bakgrunnen
   docker