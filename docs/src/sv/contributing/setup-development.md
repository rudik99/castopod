# Konfigurera din utvecklingsmiljö

## Introduktion

Castopod är en webbapplikation baserad på php-ramverket [CodeIgniter 4](https://codeigniter.com).

Vi använder [Docker](https://www.docker.com/) för att snabbt konfigurera en utvecklingsmiljö. En `docker-compose.yml`- och `Dockerfile`-fil finns i projektets rotmapp för att hjälpa dig komma igång med ditt bidrag.

> Du behöver ingen tidigare kunskap om Docker för att följa nästa steg.
> Om du dock vill använda din egen miljö kan du göra det fritt!

## Installationsinstruktioner

### 1. Förutsättningar

0. Installera [docker](https://docs.docker.com/get-docker).

1. Klona Castopods projekt genom att köra:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Skapa en `.env`-fil med den minsta konfigurationen som krävs för att ansluta appen till databasen och använda Redis som cacheminne:

   ```ini
   CI_ENVIRONMENT="development"
   # Om det är inställt som development, måste du köra `npm run dev` för att starta servern för statiska resurser
   vite.environment="development"

   # Som standard är den här inställd på true i appens konfiguration.
   # För development måste den vara inställd på false eftersom den är
   # i en lokal miljö
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

   # Du kanske inte vill använda Redis som cacheminne
   # Kommentera/bort den ovanstående raden och ta bort kommentar
   # från nästa rad för att använda filcachning.
   #cache.handler="file"
   ```

   > _NB._ Du kan anpassa din miljö genom att ange fler miljövariabler
   > i din anpassade `.env`-fil. Se `env` för exempel eller
   > [CodeIgniter4 användarguide](https://codeigniter.com/user_guide/index.html)
   > för mer information.

3. (för Docker Desktop) Lägg till det klonade projektet i Docker Desktop under
   `Inställningar` > `Resurser` > `Delade filer`

### 2. (rekommenderas) Utveckla inuti appens container med VSCode

Om du arbetar i VSCode kan du dra nytta av mappen `.devcontainer/`. Den definierar en utvecklingsmiljö (dev container) med förinstallerade krav och VSCode-tillägg så att du inte behöver oroa dig för dem. Alla nödvändiga tjänster laddas automatiskt! 🪄

1. Installera VSCode-tillägget [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. `Ctrl/Cmd + Skift + P` > `Öppna i container`

   > VSCode-fönstret kommer att ladda om inuti dev-containern. Förvänta dig flera minuter vid första inladdning då alla nödvändiga tjänster byggs.

   **Obs**: Dev-behållaren kommer att starta genom att köra Castopods php-server. Under utvecklingen måste du starta [Vites](https://vitejs.dev) utvecklingsserver för att kompilera typescript-koden och stilarna:

   ```bash
   # starta Vites utvecklingsserver
   npm run dev
   ```

   Om det uppstår några problem med att php-servern inte körs kan du starta om dem med följande kommandon:

   ```bash
   # starta Castopods server
   php spark serve - 0.0.0.0
   ```

3. Du är klar! 🎉

   Du är nu **inne i dev-behållaren**, du kan använda VSCode-konsolen (`Terminal` > `Ny terminal`) för att köra valfritt kommando:

   ```bash
   # PHP är installerat
   php -v

   # Composer är installerat
   composer -V

   # npm är installerat
   npm -v

   # git är installerat
   git --version
   ```

För mer information, se [VSCode Remote Containers](https://code.visualstudio.com/docs/remote/containers)

### 3. Börja koda

Du är klar! Börja arbeta med att uppdatera projektets filer! Använd gärna [CodeIgniter4 användarguide](https://codeigniter.com/user_guide/index.html) för mer information.

För att se dina ändringar, gå till:

- `http://localhost:8080/` för Castopod-appen
- `http://localhost:8888/` för phpMyAdmin-gränssnittet:

  - användarnamn: **castopod**
  - lösenord: **castopod**

### 2-alt. Utveckling utanför appbehrållaren

Vill du inte använda VSCode-devbehrållaren? Inga problem!

1. Starta behållarna manuellt:

   Gå till projektets rotmapp och kör:

   ```bash
   # startar alla tjänster som anges i docker-compose.yml-filen
   # -d-alternativet startar behållarna i bakgrunden
   docker-compose up -d

   # Visa alla körande processer (du bör se 3 körande processer)
   docker-compose ps

   # Alternativt kan du visa alla Docker-processer
   docker ps -a

   ```

   > Kommandot `docker-compose up -d` startar 4 behållare i
   > bak