---
title: Officiële Docker-afbeeldingen
sidebarDepth: 3
---

# Officiële Docker-afbeeldingen

Tijdens het geautomatiseerde bouwproces maakt Castopod gebruik van 3 Docker-afbeeldingen die naar de Docker-hub worden gestuurd:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): een alles-in-één Castopod-afbeelding met behulp van NGINX Unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): de app-bundel met alle afhankelijkheden van Castopod
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): een NGINX-configuratie voor Castopod

Daarnaast heeft Castopod een MySQL-compatibele database nodig. Een Redis-database kan worden toegevoegd als cachebeheerder.

## Ondersteunde tags

- `latest` [onstabiel], de nieuwste ontwikkelingsversie
- `beta` [stabiel], de nieuwste bètaversie
- `1.x.x` [stabiel], specifieke versie (vanaf `1.0.0`)

## Gebruik voorbeeld

1. Installeer [docker](https://docs.docker.com/get-docker/) en [docker-compose](https://docs.docker.com/compose/install/)
2. Maak een `docker-compose.yml`-bestand met de volgende inhoud:

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

    Pas enkele variabelen aan naar jouw wensen (bijvoorbeeld `CP_BASEURL`, `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` en `CP_ANALYTICS_SALT`).

3. Configureer een reverse proxy voor TLS (SSL/HTTPS)

    TLS is nodig voor ActivityPub om te werken. Dit kan eenvoudig worden geregeld met een reverse proxy, bijvoorbeeld met [Caddy](https://caddyserver.com/):

    ```
    #castopod
    castopod.example.com {
        reverse_proxy localhost:8000
    }
    ```

4. Voer `docker-compose up -d` uit, wacht tot het geïnitialiseerd is op `https://castopod.example.com/cp-install` om de configuratie van Castopod te voltooien!

5. Je bent klaar om te podcasten! 🎙️🚀

## Omgevingsvariabelen

- **castopod/castopod** en **castopod/app**

  | Variabelenaam                     | Type (`default`)        | Standaardwaarde |
  | -------------------------------- | ----------------------- | --------------- |
  | **`CP_BASEURL`**                  | string                  | `undefined`     |
  | **`CP_MEDIA_BASEURL`**            | ?string                 | `CP_BASEURL`    |
  | **`CP_ADMIN_GATEWAY`**            | ?string                 | `"cp-admin"`    |
  | **`CP_AUTH_GATEWAY`**             | ?string                 | `"cp-auth"`     |
  | **`CP_ANALYTICS_SALT`**           | string                  | `undefined`     |
  | **`CP_DATABASE_HOSTNAME`**        | ?string                 | `"mariadb"`     |
  | **`CP_DATABASE_NAME`**            | ?string                 | `MYSQL_DATABASE`|
  | **`CP_DATABASE_USERNAME`**        | ?string                 | `MYSQL_USER`    |
  | **`CP_DATABASE_PASSWORD`**        | ?string                 | `MYSQL_PASSWORD`|
  | **`CP_DATABASE_PREFIX`**          | ?string                 | `"cp_"`         |
  | **`CP_CACHE_HANDLER`**            | [`"file"` of `"redis"`] | `"file"`        |
  | **`CP_REDIS_HOST`**               | ?string                 | `"localhost"`   |
  | **`CP_REDIS_PASSWORD`**           | ?string                 | `null`          |
  | **`CP_REDIS_PORT`**               | ?number                 | `6379`          |
  | **`CP_REDIS_DATABASE`**           | ?number                 | `0`             |
  | **`CP_EMAIL_SMTP_HOST`**          | ?string                 | `undefined`     |
  | **`CP_EMAIL_FROM`**               | ?string                 | `undefined`     |
  | **`CP_EMAIL_SMTP_USERNAME`**      | ?string                 | `"localhost"`   |
  | **`CP_EMAIL_SMTP_PASSWORD`**      | ?string                 | `null`          |
  | **`CP_EMAIL_SMTP_PORT`**          | ?number                 | `25`            |
  | **`CP_EMAIL_SMTP_CRYPTO`**        | [`"tls"` of `"ssl"`]    | `"tls"`         |
  | **`CP_ENABLE_2FA`**               | ?boolean                | `undefined`     |
  | **`CP_MEDIA_FILE_MANAGER`**       | ?string                 | `undefined`     |
  | **`CP_MEDIA_S3_ENDPOINT`**        | ?string                 | `undefined`     |
  | **`CP_MEDIA_S3_KEY`**             | ?string                 | `undefined`     |
  | **`CP_MEDIA_S3_SECRET`**          | ?string                 | `undefined`     |
  | **`CP_MEDIA_S3_REGION`**          | ?string                 | `undefined`     |
  | **`CP_MEDIA_S3_BUCKET`**          | ?string                 | `undefined`     |
  | **`CP_MEDIA_S3_PROTOCOL`**        | ?number                 | `undefined`     |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`** | ?boolean            | `undefined`     |
  | **`CP_MEDIA_S3_KEY_PREFIX`**      | ?string                 | `undefined`     |
  | **`CP_DISABLE_HTTPS`**            | ?[`0` of `1`]           | `undefined`     |
  | **`CP_MAX_BODY_SIZE`**            | ?number (with suffix)   | `512M`          |
  | **`CP_PHP_MEMORY_LIMIT`**         | ?number (with suffix)   | `512M`          |
  | **`CP_TIMEOUT`**                  | ?number                 | `900`           |

- **castopod/web-server**

  | Variabelenaam          | Type                  | Standaardwaarde |
  | ---------------------- | --------------------- | ----------------|
  | **`CP_APP_HOSTNAME`**  | ?string               | `"app"`         |
  | **`CP_MAX_BODY_SIZE`** | ?number (with suffix) | `512M`          |
  | **`CP_TIMEOUT`**       | ?number               | `900`           |