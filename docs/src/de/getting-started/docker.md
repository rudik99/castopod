---
title: Offizielle Docker-Images
sidebarDepth: 3
---

# Offizielle Docker-Images

Während des automatischen Build-Prozesses lädt Castopod 3 Docker-Images in den Docker Hub hoch:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): ein All-in-One Castopod-Image mit Nginx Unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): das Anwendungs-Bundle mit allen Castopod-Abhängigkeiten
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): eine Nginx-Konfiguration für Castopod

Zusätzlich benötigt Castopod eine mit MySQL kompatible Datenbank. Eine Redis-Datenbank kann als Cache-Manager hinzugefügt werden.

## Unterstützte Tags

- `develop` [unstable], die neueste Version des Entwicklungszweigs
- `beta` [stable], die neueste Beta-Version
- `1.x.x` [stable], eine bestimmte Version (ab `1.0.0`)

## Beispielnutzung

1. Installiere [docker](https://docs.docker.com/get-docker/) und [docker-compose](https://docs.docker.com/compose/install/)
2. Erstelle eine `docker-compose.yml`-Datei mit folgendem Inhalt:

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

    Passe die Variablen (z.B. `CP_BASEURL`, `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` und `CP_ANALYTICS_SALT`) an deine Bedürfnisse an.

3. Erstelle einen Reverse Proxy für TLS (SSL/HTTPS)

    TLS ist zum Betrieb von ActivityPub erforderlich. Dies kann einfach mit einem Reverse Proxy wie [Caddy](https://caddyserver.com/) realisiert werden:

    ```
    #castopod
    castopod.example.com {
        reverse_proxy localhost:8000
    }
    ```

4. Führe `docker-compose up -d` aus und warte, bis unter `https://castopod.example.com/cp-install` die Castopod-Konfiguration abgeschlossen ist!

5. Du bist bereit, mit dem Podcasting zu beginnen! 🎙️🚀

## Umgebungsvariablen

- **castopod/castopod** und **castopod/app**

  | Variablenname                    | Typ (`default`)        | Standardwert   |
  | -------------------------------- | ---------------------- | -------------- |
  | **`CP_BASEURL`**                 | string                 | `undefined`    |
  | **`CP_MEDIA_BASEURL`**           | ?string                | `CP_BASEURL`   |
  | **`CP_ADMIN_GATEWAY`**           | ?string                | `"cp-admin"`   |
  | **`CP_AUTH_GATEWAY`**            | ?string                | `"cp-auth"`    |
  | **`CP_ANALYTICS_SALT`**          | string                 | `undefined`    |
  | **`CP_DATABASE_HOSTNAME`**       | ?string                | `"mariadb"`    |
  | **`CP_DATABASE_NAME`**           | ?string                | `MYSQL_DATABASE` |
  | **`CP_DATABASE_USERNAME`**       | ?string                | `MYSQL_USER`   |
  | **`CP_DATABASE_PASSWORD`**       | ?string                | `MYSQL_PASSWORD` |
  | **`CP_DATABASE_PREFIX`**         | ?string                | `"cp_"`        |
  | **`CP_CACHE_HANDLER`**           | [`"file"` oder `"redis"`] | `"file"`       |
  | **`CP_REDIS_HOST`**              | ?string                | `"localhost"`  |
  | **`CP_REDIS_PASSWORD`**          | ?string                | `null`         |
  | **`CP_REDIS_PORT`**              | ?number                | `6379`         |
  | **`CP_REDIS_DATABASE`**          | ?number                | `0`            |
  | **`CP_EMAIL_SMTP_HOST`**         | ?string                | `undefined`    |
  | **`CP_EMAIL_FROM`**              | ?string                | `undefined`    |
  | **`CP_EMAIL_SMTP_USERNAME`**     | ?string                | `"localhost"`  |
  | **`CP_EMAIL_SMTP_PASSWORD`**     | ?string                | `null`         |
  | **`CP_EMAIL_SMTP_PORT`**         | ?number                | `25`           |
  | **`CP_EMAIL_SMTP_CRYPTO`**       | [`"tls"` oder `"ssl"`] | `"tls"`        |
  | **`CP_ENABLE_2FA`**              | ?boolean               | `undefined`    |
  | **`CP_MEDIA_FILE_MANAGER`**      | ?string                | `undefined`    |
  | **`CP_MEDIA_S3_ENDPOINT`**       | ?string                | `undefined`    |
  | **`CP_MEDIA_S3_KEY`**            | ?string                | `undefined`    |
  | **`CP_MEDIA_S3_SECRET`**         | ?string                | `undefined`    |
  | **`CP_MEDIA_S3_REGION`**         | ?string                | `undefined`    |
  | **`CP_MEDIA_S3_BUCKET`**         | ?string                | `undefined`    |
  | **`CP_MEDIA_S3_PROTOCOL`**       | ?number                | `undefined`    |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`** | ?boolean         | `undefined`    |
  | **`CP_MEDIA_S3_KEY_PREFIX`**     | ?string                | `undefined`    |
  | **`CP_DISABLE_HTTPS`**           | ?[`0` oder `1`]        | `undefined`    |
  | **`CP_MAX_BODY_SIZE`**           | ?number (mit Suffix)   | `512M`         |
  | **`CP_PHP_MEMORY_LIMIT`**        | ?number (mit Suffix)   | `512M`         |
  | **`CP_TIMEOUT`**                 | ?number                | `900`          |

- **castopod/web-server**

  | Variablenname          | Typ                   | Standardwert |
  | ---------------------  | ----------------------| ------------ |
  | **`CP_APP_HOSTNAME`**  | ?string               | `"app"`      |
  | **`CP_MAX_BODY_SIZE`** | ?number (mit Suffix)  | `512M`       |
  | **`CP_TIMEOUT`**       | ?number               | `900`        |