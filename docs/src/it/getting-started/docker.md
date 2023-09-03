---
title: Immagini ufficiali Docker
sidebarDepth: 3
---

# Immagini ufficiali di Docker

Castopod invia 3 immagini Docker all'hub Docker durante il suo processo di
costruzione automatizzata:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): un'immagine di castopod all-in-one che utilizza nginx unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): il bundle dell'app con tutte le dipendenze di Castopod
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): una configurazione Nginx per Castopod

Inoltre, Castopod richiede un database compatibile con MySQL. Un database Redis può essere aggiunto come gestore della cache.

## Tags supportate

- `développer` [instabile], l'ultima versione del ramo di sviluppo
- `beta` [stabili], l'ultima versione beta
- `1.x.x` [stabili], versione specifica (a partire da `1.0.0`)

## Esempio di utilizzo

1. Installa [docker](https://docs.docker.com/get-docker/) e
   [docker-compose](https://docs.docker.com/compose/install/)
2. Crea un file `docker-compose.yml` con i seguenti contenuti:

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
          MYSQL_PASSWORD: cambiami
          CP_BASEURL: "https://castopod.example.com"
          CP_ANALYTICS_SALT: cambiami
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
          MYSQL_ROOT_PASSWORD: cambiami
          MYSQL_DATABASE: castopod
          MYSQL_USER: castopod
          MYSQL_PASSWORD: cambiami
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

    È necessario adattare alcune variabili alle tue esigenze (ad esempio `CP_BASEURL`,
    `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` e `CP_ANALYTICS_SALT`).

3. Configura un reverse proxy per TLS (SSL/HTTPS)

   TLS è obbligatorio per far funzionare ActivityPub. Questa operazione può essere facilmente gestita da un reverse proxy, ad esempio con [Caddy](https://caddyserver.com/):

   ```
   #castopod
   castopod.example.com {
       reverse_proxy localhost:8000
   }
   ```

4. Esegui `docker-compose up -d`, aspetta che si inizializzi su
   `https://castopod.example.com/cp-install` per completare la configurazione di
   Castopod!

5. Sei pronto per iniziare a creare podcast! 🎙️🚀

## Variabili d'ambiente

- **castopod/castopod** e **castopod/app**

  | Nome variabile                   | Tipo (`default`)        | Predefinito       |
  | -------------------------------- | ----------------------- | ---------------- |
  | **`CP_BASEURL`**                 | stringa                 | `undefined`      |
  | **`CP_MEDIA_BASEURL`**           | ?stringa                | `CP_BASEURL`     |
  | **`CP_ADMIN_GATEWAY`**           | ?stringa                | `"cp-admin"`     |
  | **`CP_AUTH_GATEWAY`**            | ?stringa                | `"cp-auth"`      |
  | **`CP_ANALYTICS_SALT`**          | stringa                 | `undefined`      |
  | **`CP_DATABASE_HOSTNAME`**       | ?stringa                | `"mariadb"`      |
  | **`CP_DATABASE_NAME`**           | ?stringa                | `MYSQL_DATABASE` |
  | **`CP_DATABASE_USERNAME`**       | ?stringa                | `MYSQL_USER`     |
  | **`CP_DATABASE_PASSWORD`**       | ?stringa                | `MYSQL_PASSWORD` |
  | **`CP_DATABASE_PREFIX`**         | ?stringa                | `"cp_"`          |
  | **`CP_CACHE_HANDLER`**           | [`"file"` o `"redis"`]  | `"file"`         |
  | **`CP_REDIS_HOST`**              | ?stringa                | `"localhost"`    |
  | **`CP_REDIS_PASSWORD`**          | ?stringa                | `null`           |
  | **`CP_REDIS_PORT`**              | ?numero                 | `6379`           |
  | **`CP_REDIS_DATABASE`**          | ?numero                 | `0`              |
  | **`CP_EMAIL_SMTP_HOST`**         | ?stringa                | `undefined`      |
  | **`CP_EMAIL_FROM`**              | ?stringa                | `undefined`      |
  | **`CP_EMAIL_SMTP_USERNAME`**     | ?stringa                | `"localhost"`    |
  | **`CP_EMAIL_SMTP_PASSWORD`**     | ?stringa                | `null`           |
  | **`CP_EMAIL_SMTP_PORT`**         | ?numero                 | `25`             |
  | **`CP_EMAIL_SMTP_CRYPTO`**       | [`"tls"` o `"ssl"`]     | `"tls"`          |
  | **`CP_ENABLE_2FA`**              | ?booleano               | `undefined`      |
  | **`CP_MEDIA_FILE_MANAGER`**      | ?stringa                | `undefined`      |
  | **`CP_MEDIA_S3_ENDPOINT`**       | ?stringa                | `undefined`      |
  | **`CP_MEDIA_S3_KEY`**            | ?stringa                | `undefined`      |
  | **`CP_MEDIA_S3_SECRET`**         | ?stringa                | `undefined`      |
  | **`CP_MEDIA_S3_REGION`**         | ?stringa                | `undefined`      |
  | **`CP_MEDIA_S3_BUCKET`**         | ?stringa                | `undefined`      |
  | **`CP_MEDIA_S3_PROTOCOL`**       | ?numero                 | `undefined`      |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`** | ?booleano         | `undefined`      |
  | **`CP_MEDIA_S3_KEY_PREFIX`**     | ?stringa                | `undefined`      |
  | **`CP_DISABLE_HTTPS`**           | ?[`0` o `1`]            | `undefined`      |
  | **`CP_MAX_BODY_SIZE`**           | ?numero (con suffisso)  | `512M`           |
  | **`CP_PHP_MEMORY_LIMIT`**        | ?numero (con suffisso)  | `512M`           |
  | **`CP_TIMEOUT`**                 | ?numero                 | `900`            |

- **castopod/web-server**

  | Nome variabile         | Tipo                  | Predefinito |
  | ---------------------- | --------------------- | ---------- |
  | **`CP_APP_HOSTNAME`**  | ?stringa              | `"app"`    |
  | **`CP_MAX_BODY_SIZE`** | ?numero (con suffisso) | `512M`     |
  | **`CP_TIMEOUT`**       | ?numero               | `900`      |