---
title: Oficjalne obrazy Dockera
sidebarDepth: 3
---

# Oficjalne obrazy Dockera

Podczas procesu automatycznego budowania, Castopod wysyła 3 obrazy Dockera na Docker Hub:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): obraz Castopod zintegrowany z nginx unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): zestaw aplikacji zawierający wszystkie zależności Castopod
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): konfiguracja Nginx do Castopod

Dodatkowo, Castopod wymaga bazy danych zgodnej z MySQL. Baza danych Redis może zostać dodana jako mechanizm cache'owania.

## Wspierane tagi

- `devel` [unstable], najnowszy rozwijany branch
- `beta` [stable], najnowsza wersja beta
- `1.x.x` [stable], konkretne wydanie (od `1.0.0`)

## Przykładowe użycie

1.  Zainstaluj [dockera](https://docs.docker.com/get-docker/) i
    [docker-compose](https://docs.docker.com/compose/install/)
2.  Utwórz plik `docker-compose.yml` z następującą zawartością:

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

    Musisz dostosować niektóre zmienne do swoich potrzeb (np. `CP_BASEURL`,
    `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD`, `CP_ANALYTICS_SALT`).

3.  Skonfiguruj reverse proxy dla TLS (SSL/HTTPS)

    TLS jest wymagany do działania protokołu ActivityPub. Zadanie to można łatwo zrealizować za pomocą reverse proxy, na przykład za pomocą [Caddy](https://caddyserver.com/):

    ```
    #castopod
    castopod.example.com {
        reverse_proxy localhost:8000
    }
    ```

4.  Uruchom `docker-compose up -d`, poczekaj, aż się zainicjalizuje na
    `https://castopod.example.com/cp-install`, aby zakończyć konfigurację Castopod!

5.  Jesteś gotowy, zacznij publikować podcasty! 🎙️🚀

## Zmienne środowiskowe

- **castopod/castopod** i **castopod/app**

  | Nazwa zmiennej                     | Typ (`default`)        | Domyślnie  |
  | --------------------------------- | ----------------------- | ---------- |
  | **`CP_BASEURL`**                   | string                  | `undefined`|
  | **`CP_MEDIA_BASEURL`**             | ?string                 | `CP_BASEURL`|
  | **`CP_ADMIN_GATEWAY`**             | ?string                 | `"cp-admin"`|
  | **`CP_AUTH_GATEWAY`**              | ?string                 | `"cp-auth"` |
  | **`CP_ANALYTICS_SALT`**            | string                  | `undefined`|
  | **`CP_DATABASE_HOSTNAME`**         | ?string                 | `"mariadb"`|
  | **`CP_DATABASE_NAME`**             | ?string                 | `MYSQL_DATABASE`|
  | **`CP_DATABASE_USERNAME`**         | ?string                 | `MYSQL_USER`|
  | **`CP_DATABASE_PASSWORD`**         | ?string                 | `MYSQL_PASSWORD`|
  | **`CP_DATABASE_PREFIX`**           | ?string                 | `"cp_"`     |
  | **`CP_CACHE_HANDLER`**             | [`"file"` or `"redis"`] | `"file"`    |
  | **`CP_REDIS_HOST`**                | ?string                 | `"localhost"`|
  | **`CP_REDIS_PASSWORD`**            | ?string                 | `null`      |
  | **`CP_REDIS_PORT`**                | ?number                 | `6379`      |
  | **`CP_REDIS_DATABASE`**            | ?number                 | `0`         |
  | **`CP_EMAIL_SMTP_HOST`**           | ?string                 | `undefined` |
  | **`CP_EMAIL_FROM`**                | ?string                 | `undefined` |
  | **`CP_EMAIL_SMTP_USERNAME`**       | ?string                 | `"localhost"`|
  | **`CP_EMAIL_SMTP_PASSWORD`**       | ?string                 | `null`      |
  | **`CP_EMAIL_SMTP_PORT`**           | ?number                 | `25`        |
  | **`CP_EMAIL_SMTP_CRYPTO`**         | [`"tls"` or `"ssl"`]    | `"tls"`     |
  | **`CP_ENABLE_2FA`**                | ?boolean                | `undefined` |
  | **`CP_MEDIA_FILE_MANAGER`**        | ?string                 | `undefined` |
  | **`CP_MEDIA_S3_ENDPOINT`**         | ?string                 | `undefined` |
  | **`CP_MEDIA_S3_KEY`**              | ?string                 | `undefined` |
  | **`CP_MEDIA_S3_SECRET`**           | ?string                 | `undefined` |
  | **`CP_MEDIA_S3_REGION`**           | ?string                 | `undefined` |
  | **`CP_MEDIA_S3_BUCKET`**           | ?string                 | `undefined` |
  | **`CP_MEDIA_S3_PROTOCOL`**         | ?number                 | `undefined` |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`** | ?boolean            | `undefined` |
  | **`CP_MEDIA_S3_KEY_PREFIX`**       | ?string                 | `undefined` |
  | **`CP_DISABLE_HTTPS`**             | ?[`0` or `1`]           | `undefined` |
  | **`CP_MAX_BODY_SIZE`**             | ?number (with suffix)   | `512M`      |
  | **`CP_PHP_MEMORY_LIMIT`**          | ?number (with suffix)   | `512M`      |
  | **`CP_TIMEOUT`**                   | ?number                 | `900`       |

- **castopod/web-server**

  | Nazwa zmiennej              | Typ                  | Domyślnie |
  | -------------------------- | -------------------- | --------- |
  | **`CP_APP_HOSTNAME`**      | ?string              | `"app"`   |
  | **`CP_MAX_BODY_SIZE`**     | ?number (with suffix)| `512M`    |
  | **`CP_TIMEOUT`**           | ?number              | `900`     |