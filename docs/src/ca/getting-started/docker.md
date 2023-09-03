---
title: Imatges oficials de Docker
sidebarDepth: 3
---

# Imatges oficials de Docker

Castopod envia 3 imatges Docker al Hub de Docker durant el seu procés de construcció automàtica:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): una imatge de Castopod tot en un utilitzant Nginx Unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): el paquet d'aplicació amb totes les dependències de Castopod
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): una configuració de Nginx per a Castopod

A més, Castopod requereix una base de dades compatible amb MySQL. Es pot afegir una base de dades Redis com a gestor de memòria cau.

## Tags compatibles

- `develop` [inestable], última versió de la branca de desenvolupament
- `beta` [estable], última versió beta
- `1.x.x` [estable], versió específica (a partir de `1.0.0`)

## Exemple d'ús

1.  Instal·la el [docker](https://docs.docker.com/get-docker/) i el
    [docker-compose](https://docs.docker.com/compose/install/)
2.  Crea un fitxer `docker-compose.yml` amb el següent contingut:

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

    Has d'adaptar algunes variables segons les teves necessitats (p. ex., `CP_BASEURL`,
    `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` i `CP_ANALYTICS_SALT`).

3.  Configura un servidor proxy invers per a TLS (SSL/HTTPS)

    TLS és obligatori per a què funcioni ActivityPub. Aquesta tasca es pot gestionar fàcilment mitjançant un servidor proxy invers, per exemple amb [Caddy](https://caddyserver.com/):

    ```
    #castopod
    castopod.example.com {
        reverse_proxy localhost:8000
    }
    ```

4.  Executa `docker-compose up -d`, espera que s'inicialitzi a
    `https://castopod.example.com/cp-install` per finalitzar la configuració de
    Castopod!

5.  Estàs llest, comença a publicar podcasts! 🎙️🚀

## Variables d'entorn

- **castopod/castopod** i **castopod/app**

  | Nom de la variable                    | Tipus (`default`)       | Valor per defecte |
  | ------------------------------------- | -----------------------| ----------------- |
  | **`CP_BASEURL`**                      | cadena                 | `undefined`       |
  | **`CP_MEDIA_BASEURL`**                | ?cadena                | `CP_BASEURL`      |
  | **`CP_ADMIN_GATEWAY`**                | ?cadena                | `"cp-admin"`      |
  | **`CP_AUTH_GATEWAY`**                 | ?cadena                | `"cp-auth"`       |
  | **`CP_ANALYTICS_SALT`**               | cadena                 | `undefined`       |
  | **`CP_DATABASE_HOSTNAME`**            | ?cadena                | `"mariadb"`       |
  | **`CP_DATABASE_NAME`**                | ?cadena                | `MYSQL_DATABASE`  |
  | **`CP_DATABASE_USERNAME`**            | ?cadena                | `MYSQL_USER`      |
  | **`CP_DATABASE_PASSWORD`**            | ?cadena                | `MYSQL_PASSWORD`  |
  | **`CP_DATABASE_PREFIX`**              | ?cadena                | `"cp_"`           |
  | **`CP_CACHE_HANDLER`**                | [`"file"` o `"redis"`] | `"file"`          |
  | **`CP_REDIS_HOST`**                   | ?cadena                | `"localhost"`     |
  | **`CP_REDIS_PASSWORD`**               | ?cadena                | `null`            |
  | **`CP_REDIS_PORT`**                   | ?nombre                | `6379`            |
  | **`CP_REDIS_DATABASE`**               | ?nombre                | `0`               |
  | **`CP_EMAIL_SMTP_HOST`**              | ?cadena                | `undefined`       |
  | **`CP_EMAIL_FROM`**                   | ?cadena                | `undefined`       |
  | **`CP_EMAIL_SMTP_USERNAME`**          | ?cadena                | `"localhost"`     |
  | **`CP_EMAIL_SMTP_PASSWORD`**          | ?cadena                | `null`            |
  | **`CP_EMAIL_SMTP_PORT`**              | ?nombre                | `25`              |
  | **`CP_EMAIL_SMTP_CRYPTO`**            | [`"tls"` o `"ssl"`]    | `"tls"`           |
  | **`CP_ENABLE_2FA`**                   | ?booleà                | `undefined`       |
  | **`CP_MEDIA_FILE_MANAGER`**           | ?cadena                | `undefined`       |
  | **`CP_MEDIA_S3_ENDPOINT`**            | ?cadena                | `undefined`       |
  | **`CP_MEDIA_S3_KEY`**                 | ?cadena                | `undefined`       |
  | **`CP_MEDIA_S3_SECRET`**              | ?cadena                | `undefined`       |
  | **`CP_MEDIA_S3_REGION`**              | ?cadena                | `undefined`       |
  | **`CP_MEDIA_S3_BUCKET`**              | ?cadena                | `undefined`       |
  | **`CP_MEDIA_S3_PROTOCOL`**            | ?nombre                | `undefined`       |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`** | ?booleà                | `undefined`       |
  | **`CP_MEDIA_S3_KEY_PREFIX`**          | ?cadena                | `undefined`       |
  | **`CP_DISABLE_HTTPS`**                | ?[`0` o `1`]           | `undefined`       |
  | **`CP_MAX_BODY_SIZE`**                | ?nombre (amb sufix)    | `512M`            |
  | **`CP_PHP_MEMORY_LIMIT`**             | ?nombre (amb sufix)    | `512M`            |
  | **`CP_TIMEOUT`**                      | ?nombre                | `900`             |

- **castopod/web-server**

  | Nom de la variable     | Tipus                 | Valor per defecte |
  | ----------------------| ----------------------| ----------------- |
  | **`CP_APP_HOSTNAME`** | ?cadena               | `"app"`           |
  | **`CP_MAX_BODY_SIZE`**| ?nombre (amb sufix)   | `512M`            |
  | **`CP_TIMEOUT`**      | ?nombre               | `900`             |