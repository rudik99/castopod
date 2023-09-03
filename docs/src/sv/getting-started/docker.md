# Officiella Docker-bilder

Castopod skickar 3 Docker-bilder till Docker-hubben under sin automatiserade byggprocess:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): en allt-i-ett Castopod-bild som använder nginx unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): apppaketet med alla Castopods beroenden
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): en Nginx-konfiguration för Castopod

Förutom detta behöver Castopod en MySQL-kompatibel databas. En Redis-databas kan läggas till som en cachemanager.

## Stödda taggar

- `develop` [instabil], den senaste utvecklingsgrenen
- `beta` [stabil], den senaste betaversionen
- `1.x.x` [stabil], en specifik version (från `1.0.0`)

## Användnings exempel

1. Installera [docker](https://docs.docker.com/get-docker/) och
   [docker-compose](https://docs.docker.com/compose/install/)
2. Skapa en `docker-compose.yml`-fil med följande innehåll:

   ```yml
   version: "3.7"

   services:
     app:
       image: castopod/castopod:latest
       container_name: "castopod-app"
       volumes:
         - castopod-media:/var/www/castopod/public/media
       environment:
         MYSQL_DATABASE: castopod
         MYSQL_USER: castopod
         MYSQL_PASSWORD: changeme
         CP_BASEURL: "https://castopod.example.com"
         CP_ANALYTICS_SALT: changeme
         CP_CACHE_HANDLER: redis
         CP_REDIS_HOST: redis
       networks:
         - castopod-app
         - castopod-db
       ports:
         - 8000:8000
       restart: unless-stopped

     mariadb:
       image: mariadb:10.5
       container_name: "castopod-mariadb"
       networks:
         - castopod-db
       volumes:
         - castopod-db:/var/lib/mysql
       environment:
         MYSQL_ROOT_PASSWORD: changeme
         MYSQL_DATABASE: castopod
         MYSQL_USER: castopod
         MYSQL_PASSWORD: changeme
       restart: unless-stopped

     redis:
       image: redis:7.0-alpine
       container_name: "castopod-redis"
       volumes:
         - castopod-cache:/data
       networks:
         - castopod-app

   volumes:
     castopod-media:
     castopod-db:
     castopod-cache:

   networks:
     castopod-app:
     castopod-db:
   ```

   Du behöver anpassa vissa variabler efter dina behov (t.ex. `CP_BASEURL`,
   `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` och `CP_ANALYTICS_SALT`).

3. Installera en omvänd proxy för TLS (SSL/HTTPS)

   TLS krävs för att ActivityPub ska fungera. Detta kan enkelt hanteras av en omvänd proxy, till exempel med [Caddy](https://caddyserver.com/):

   ```
   # Castopod
   castopod.example.com {
       reverse_proxy localhost:8000
   }
   ```

4. Kör `docker-compose up -d`, vänta på att det initialiseras på
   `https://castopod.example.com/cp-install` för att slutföra konfigurationen av Castopod!

5. Du är redo att börja podcasta! 🎙️🚀

## Miljövariabler

- **castopod/castopod** och **castopod/app**

  | Variabel namn                          | Typ (`default`)          | Standardvärde    |
  | -------------------------------------- | ------------------------ | ---------------- |
  | **`CP_BASEURL`**                       | sträng                   | `undefined`      |
  | **`CP_MEDIA_BASEURL`**                 | ?sträng                  | `CP_BASEURL`     |
  | **`CP_ADMIN_GATEWAY`**                 | ?sträng                  | `"cp-admin"`     |
  | **`CP_AUTH_GATEWAY`**                  | ?sträng                  | `"cp-auth"`      |
  | **`CP_ANALYTICS_SALT`**                | sträng                   | `undefined`      |
  | **`CP_DATABASE_HOSTNAME`**             | ?sträng                  | `"mariadb"`      |
  | **`CP_DATABASE_NAME`**                 | ?sträng                  | `MYSQL_DATABASE` |
  | **`CP_DATABASE_USERNAME`**             | ?sträng                  | `MYSQL_USER`     |
  | **`CP_DATABASE_PASSWORD`**             | ?sträng                  | `MYSQL_PASSWORD` |
  | **`CP_DATABASE_PREFIX`**               | ?sträng                  | `"cp_"`          |
  | **`CP_CACHE_HANDLER`**                 | [`"file"` eller `"redis"`] | `"file"`        |
  | **`CP_REDIS_HOST`**                    | ?sträng                  | `"localhost"`    |
  | **`CP_REDIS_PASSWORD`**                | ?sträng                  | `null`           |
  | **`CP_REDIS_PORT`**                    | ?tal                     | `6379`           |
  | **`CP_REDIS_DATABASE`**                | ?tal                     | `0`              |
  | **`CP_EMAIL_SMTP_HOST`**               | ?sträng                  | `undefined`      |
  | **`CP_EMAIL_FROM`**                    | ?sträng                  | `undefined`      |
  | **`CP_EMAIL_SMTP_USERNAME`**           | ?sträng                  | `"localhost"`    |
  | **`CP_EMAIL_SMTP_PASSWORD`**           | ?sträng                  | `null`           |
  | **`CP_EMAIL_SMTP_PORT`**               | ?tal                     | `25`             |
  | **`CP_EMAIL_SMTP_CRYPTO`**             | [`"tls"` eller `"ssl"`]  | `"tls"`          |
  | **`CP_ENABLE_2FA`**                    | ?boolesk                 | `undefined`      |
  | **`CP_MEDIA_FILE_MANAGER`**            | ?sträng                  | `undefined`      |
  | **`CP_MEDIA_S3_ENDPOINT`**             | ?sträng                  | `undefined`      |
  | **`CP_MEDIA_S3_KEY`**                  | ?sträng                  | `undefined`      |
  | **`CP_MEDIA_S3_SECRET`**               | ?sträng                  | `undefined`      |
  | **`CP_MEDIA_S3_REGION`**               | ?sträng                  | `undefined`      |
  | **`CP_MEDIA_S3_BUCKET`**               | ?sträng                  | `undefined`      |
  | **`CP_MEDIA_S3_PROTOCOL`**             | ?tal                     | `undefined`      |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`**  | ?boolesk                 | `undefined`      |
  | **`CP_MEDIA_S3_KEY_PREFIX`**           | ?sträng                  | `undefined`      |
  | **`CP_DISABLE_HTTPS`**                 | [1 eller 0]              | `undefined`      |
  | **`CP_MAX_BODY_SIZE`**                 | ?tal (med suffix)        | `512M`           |
  | **`CP_PHP_MEMORY_LIMIT`**              | ?tal (med suffix)        | `512M`           |
  | **`CP_TIMEOUT`**                       | ?tal                     | `900`            |

- **castopod/web-server**

  | Variabel namn            | Typ                    | Standardvärde |
  | ------------------------ | -----------------------| -------------- |
  | **`CP_APP_HOSTNAME`**    | ?sträng                 | `"app"`       |
  | **`CP_MAX_BODY_SIZE`**   | ?tal (med suffix)       | `512M`        |
  | **`CP_TIMEOUT`**         | ?tal                   | `900`         |