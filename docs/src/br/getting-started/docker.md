---
title: Skoazelloù dreistlennadel Docker
sidebarDepth: 3
---

# Skoazelloù dreistlennadel Docker

En oberiant embann Castopod 3 skoazell dreistlennadel dre ar Restro_dressed Dockeñs :

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): un holl-enn unan-stumm embannadenn Castopod a gousk gant ynji nginx
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): ar verzhiad mikro
  gant pep tra zo anezho eus Castopod
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): ur skin eus Nginx evit Castopod

Deuit da essayal ez anvioù

- `développer` [dibresel], ar verzhin-stub penn-blokhoù divyezhek
- `beta` [stabil], ar verzhin vanityou dibresel
- `1.x.x` [stabil], verzhin spaekadennel (abaoe `1.0.0`)

## Ur skouer da achampion

1.  Montit [docker](https://docs.docker.com/get-docker/) ha
    [docker-compose](https://docs.docker.com/compose/install/)
2.  Krouit ur restr `docker-compose.yml` gant an traoù-mañ :

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

    Ret eo deoc'h troidigezañ boutailhoù nemetiñ ouzh ho aotrenioù (ennennoù p. ex.
    `CP_BASEURL`, `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` ha `CP_ANALYTICS_SALT`).

3.  Montit ur renverssez bregustell evit TLS (SSL/HTTPS)

    Ret eo mont ul renverssez bregustell evit glotaat gant TLS. Gallout a reomp mont gant an betek [Caddy](https://caddyserver.com/):

    ```
    #castopod
    castopod.example.com {
        reverse_proxy localhost:8000
    }
    ```

4.  Leit-stur `docker-compose up -d`, kuitit evit ma vehe eno war
    `https://castopod.example.com/cp-install` gant mañskrid ho dihuniañ.

5.  Prest oc'h, deuit da embann! 🎙️🚀

## Aotrenioù Adalek

- **castopod/castopod** ha **castopod/app**

  | Anv ar bajenn                                     | Typ (`default`)        | Parad pregemper |
  | ------------------------------------------------- | ----------------------- | ---------------- |
  | **`CP_BASEURL`**                                  | chadennell                | `undefined`      |
  | **`CP_MEDIA_BASEURL`**                            | ?chadennell               | `CP_BASEURL`     |
  | **`CP_ADMIN_GATEWAY`**                            | ?chadennell               | `"cp-admin"`     |
  | **`CP_AUTH_GATEWAY`**                             | ?chadennell               | `"cp-auth"`      |
  | **`CP_ANALYTICS_SALT`**                           | chadennell                | `undefined`      |
  | **`CP_DATABASE_HOSTNAME`**                        | ?chadennell               | `"mariadb"`      |
  | **`CP_DATABASE_NAME`**                            | ?chadennell               | `MYSQL_DATABASE` |
  | **`CP_DATABASE_USERNAME`**                        | ?chadennell               | `MYSQL_USER`     |
  | **`CP_DATABASE_PASSWORD`**                        | ?chadennell               | `MYSQL_PASSWORD` |
  | **`CP_DATABASE_PREFIX`**                          | ?chadennell               | `"cp_"`          |
  | **`CP_CACHE_HANDLER`**                            | [`"file"` pe `"redis"`] | `"file"`         |
  | **`CP_REDIS_HOST`**                               | ?chadennell               | `"localhost"`    |
  | **`CP_REDIS_PASSWORD`**                           | ?chadennell               | `null`           |
  | **`CP_REDIS_PORT`**                               | ?niverenn                 | `6379`           |
  | **`CP_REDIS_DATABASE`**                           | ?niverenn                 | `0`              |
  | **`CP_EMAIL_SMTP_HOST`**                          | ?chadennell               | `undefined`      |
  | **`CP_EMAIL_FROM`**                               | ?chadennell               | `undefined`      |
  | **`CP_EMAIL_SMTP_USERNAME`**                      | ?chadennell               | `"localhost"`    |
  | **`CP_EMAIL_SMTP_PASSWORD`**                      | ?chadennell               | `null`           |
  | **`CP_EMAIL_SMTP_PORT`**                          | ?niverenn                 | `25`             |
  | **`CP_EMAIL_SMTP_CRYPTO`**                        | [`"tls"` pe `"ssl"`]    | `"tls"`          |
  | **`CP_ENABLE_2FA`**                               | ?boolezenn               | `undefined`      |
  | **`CP_MEDIA_FILE_MANAGER`**                       | ?chadennell               | `undefined`      |
  | **`CP_MEDIA_S3_ENDPOINT`**                        | ?chadennell               | `undefined`      |
  | **`CP_MEDIA_S3_KEY`**                             | ?chadennell               | `undefined`      |
  | **`CP_MEDIA_S3_SECRET`**                          | ?chadennell               | `undefined`      |
  | **`CP_MEDIA_S3_REGION`**                          | ?chadennell               | `undefined`      |
  | **`CP_MEDIA_S3_BUCKET`**                          | ?chadennell               | `undefined`      |
  | **`CP_MEDIA_S3_PROTOCOL`**                        | ?niverenn                 | `undefined`      |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`**             | ?boolezenn               | `undefined`      |
  | **`CP_MEDIA_S3_KEY_PREFIX`**                      | ?chadennell               | `undefined`      |
  | **`CP_DISABLE_HTTPS`**                            | ?[`0` pe `1`]           | `undefined`      |
  | **`CP_MAX_BODY_SIZE`**                            | ?niverenn (gant saozh)  | `512M`           |
  | **`CP_PHP_MEMORY_LIMIT`**                         | ?niverenn (gant saozh)  | `512M`           |
  | **`CP_TIMEOUT`**                                  | ?niverenn                 | `900`            |

- **castopod/web-server**

  | Anv ar bajenn                  | Typ                  | Parad pregemper |
  | ------------------------------ | --------------------- | ---------------- |
  | **`CP_APP_HOSTNAME`**          | ?chadennell          | `"app"`          |
  | **`CP_MAX_BODY_SIZE`**         | ?niverenn (gant saozh) | `512M`           |
  | **`CP_TIMEOUT`**               | ?niverenn            | `900`            |