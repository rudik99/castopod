---
title: Offisielle Docker-bilder
sidebarDepth: 3
---

# Offisielle Docker-bilder for Castopod

Castopod sender 3 Docker-bilder til Docker-hubben under den automatiserte byggprosessen:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): et alt-i-ett Castopod-bilde som bruker nginx unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): app-pakken med alle Castopod-avhengigheter
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): en Nginx-konfigurasjon for Castopod

I tillegg krever Castopod en MySQL-kompatibel database. En Redis-database kan legges til som en cache-håndterer.

## Støttede tagger

- `devel` [unstable], siste utviklerutgave
- `beta` [stable], siste betautgave
- `1.x.x` [stable], spesifikk versjon (fra `1.0.0`)

## Eksempelbruk

1. Installer [docker](https://docs.docker.com/get-docker/) og [docker-compose](https://docs.docker.com/compose/install/)
2. Opprett en `docker-compose.yml`-fil med følgende innhold:

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

    Du må tilpasse noen variabler etter dine behov (f.eks. `CP_BASEURL`, `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` og `CP_ANALYTICS_SALT`).

3. Sett opp en revers proxy for TLS (SSL/HTTPS)

    TLS er påkrevd for at ActivityPub skal fungere. Dette kan enkelt håndteres av en revers proxy, for eksempel med [Caddy](https://caddyserver.com/):

    ```
    #castopod
    castopod.example.com {
        reverse_proxy localhost:8000
    }
    ```

4. Kjør `docker-compose up -d`, og vent til konfigurasjonen av Castopod er ferdig på `https://castopod.example.com/cp-install`!

5. Du er klar! Begynn å podcaste! 🎙️🚀

## Miljøvariabler

- **castopod/castopod** og **castopod/app**

  | Variabelnavn                    | Type (`default`)        | Standardverdi   |
  | ------------------------------- | ----------------------- | --------------- |
  | **`CP_BASEURL`**                | streng                  | `undefined`     |
  | **`CP_MEDIA_BASEURL`**          | ?streng                 | `CP_BASEURL`    |
  | **`CP_ADMIN_GATEWAY`**          | ?streng                 | `"cp-admin"`    |
  | **`CP_AUTH_GATEWAY`**           | ?streng                 | `"cp-auth"`     |
  | **`CP_ANALYTICS_SALT`**         | streng                  | `undefined`     |
  | **`CP_DATABASE_HOSTNAME`**      | ?streng                 | `"mariadb"`     |
  | **`CP_DATABASE_NAME`**          | ?streng                 | `MYSQL_DATABASE`|
  | **`CP_DATABASE_USERNAME`**      | ?streng                 | `MYSQL_USER`    |
  | **`CP_DATABASE_PASSWORD`**      | ?streng                 | `MYSQL_PASSWORD`|
  | **`CP_DATABASE_PREFIX`**        | ?streng                 | `"cp_"`         |
  | **`CP_CACHE_HANDLER`**          | [`"file"` eller `"redis"`] | `"file"`       |
  | **`CP_REDIS_HOST`**             | ?streng                 | `"localhost"`   |
  | **`CP_REDIS_PASSWORD`**         | ?streng                 | `null`          |
  | **`CP_REDIS_PORT`**             | ?nummer                 | `6379`          |
  | **`CP_REDIS_DATABASE`**         | ?nummer                 | `0`             |
  | **`CP_EMAIL_SMTP_HOST`**        | ?streng                 | `undefined`     |
  | **`CP_EMAIL_FROM`**             | ?streng                 | `undefined`     |
  | **`CP_EMAIL_SMTP_USERNAME`**    | ?streng                 | `"localhost"`   |
  | **`CP_EMAIL_SMTP_PASSWORD`**    | ?streng                 | `null`          |
  | **`CP_EMAIL_SMTP_PORT`**        | ?nummer                 | `25`            |
  | **`CP_EMAIL_SMTP_CRYPTO`**      | [`"tls"` eller `"ssl"`] | `"tls"`         |
  | **`CP_ENABLE_2FA`**             | ?boolean                | `undefined`     |
  | **`CP_MEDIA_FILE_MANAGER`**     | ?streng                 | `undefined`     |
  | **`CP_MEDIA_S3_ENDPOINT`**      | ?streng                 | `undefined`     |
  | **`CP_MEDIA_S3_KEY`**           | ?streng                 | `undefined`     |
  | **`CP_MEDIA_S3_SECRET`**        | ?streng                 | `undefined`     |
  | **`CP_MEDIA_S3_REGION`**        | ?streng                 | `undefined`     |
  | **`CP_MEDIA_S3_BUCKET`**        | ?streng                 | `undefined`     |
  | **`CP_MEDIA_S3_PROTOCOL`**      | ?nummer                 | `undefined`     |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`** | ?boolean         | `undefined`     |
  | **`CP_MEDIA_S3_KEY_PREFIX`**    | ?streng                 | `undefined`     |
  | **`CP_DISABLE_HTTPS`**          | ?[`0` eller `1`]        | `undefined`     |
  | **`CP_MAX_BODY_SIZE`**          | ?nummer (med suffiks)   | `512M`          |
  | **`CP_PHP_MEMORY_LIMIT`**       | ?nummer (med suffiks)   | `512M`          |
  | **`CP_TIMEOUT`**                | ?nummer                 | `900`           |

- **castopod/web-server**

  | Variabelnavn         | Type                  | Standardverdi   |
  | -------------------- | --------------------- | --------------- |
  | **`CP_APP_HOSTNAME`**| ?streng               | `"app"`         |
  | **`CP_MAX_BODY_SIZE`** | ?nummer (med suffiks) | `512M`          |
  | **`CP_TIMEOUT`**       | ?nummer               | `900`           |