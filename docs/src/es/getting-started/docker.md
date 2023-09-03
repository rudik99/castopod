---
title: Imágenes oficiales de Docker
sidebarDepth: 3
---

# Imágenes oficiales de Docker

Castopod envía 3 imágenes de Docker al Hub de Docker durante su proceso de construcción automatizada:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): una imagen de Castopod todo en uno que utiliza nginx unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): el paquete de la aplicación con todas las dependencias de Castopod
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): una configuración de Nginx para Castopod

Además, Castopod requiere una base de datos compatible con MySQL. Se puede añadir una base de datos Redis como administrador de caché.

## Etiquetas admitidas

- `dev` [inestable], la última versión de la rama de desarrollo
- `beta` [estable], última versión beta
- `1.x.x` [estable], versión específica (desde `1.0.0`)

## Ejemplo de uso

1. Instala [docker](https://docs.docker.com/get-docker/) y [docker-compose](https://docs.docker.com/compose/install/)
2. Crea un archivo `docker-compose.yml` con los siguientes elementos:

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

    Debes adaptar algunas variables según tus necesidades (por ejemplo, `CP_BASEURL`, `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` y `CP_ANALYTICS_SALT`).

3. Configura un proxy inverso para TLS (SSL/HTTPS)

    TLS es obligatorio para que funcione ActivityPub. Este trabajo se puede manejar fácilmente mediante un proxy inverso, por ejemplo con [Caddy](https://caddyserver.com/):

    ```
    #castopod
    castopod.example.com {
        reverse_proxy localhost:8000
    }
    ```

4. Ejecuta `docker-compose up -d`, espera a que se inicialice en `https://castopod.example.com/cp-install` para completar la configuración de Castopod.

5. ¡Estás listo, comienza a hacer podcasts! 🎙️🚀

## Variables de entorno

- **castopod/castopod** y **castopod/app**

  | Nombre de la variable               | Tipo (`default`)       | Valor predeterminado |
  | ---------------------------------- | ---------------------- | -------------------- |
  | **`CP_BASEURL`**                    | string                 | `undefined`          |
  | **`CP_MEDIA_BASEURL`**              | ?string                | `CP_BASEURL`         |
  | **`CP_ADMIN_GATEWAY`**              | ?string                | `"cp-admin"`         |
  | **`CP_AUTH_GATEWAY`**               | ?string                | `"cp-auth"`          |
  | **`CP_ANALYTICS_SALT`**             | string                 | `undefined`          |
  | **`CP_DATABASE_HOSTNAME`**          | ?string                | `"mariadb"`          |
  | **`CP_DATABASE_NAME`**              | ?string                | `MYSQL_DATABASE`     |
  | **`CP_DATABASE_USERNAME`**          | ?string                | `MYSQL_USER`         |
  | **`CP_DATABASE_PASSWORD`**          | ?string                | `MYSQL_PASSWORD`     |
  | **`CP_DATABASE_PREFIX`**            | ?string                | `"cp_"`              |
  | **`CP_CACHE_HANDLER`**              | [`"file"` o `"redis"`] | `"file"`             |
  | **`CP_REDIS_HOST`**                 | ?string                | `"localhost"`        |
  | **`CP_REDIS_PASSWORD`**             | ?string                | `null`               |
  | **`CP_REDIS_PORT`**                 | ?number                | `6379`               |
  | **`CP_REDIS_DATABASE`**             | ?number                | `0`                  |
  | **`CP_EMAIL_SMTP_HOST`**            | ?string                | `undefined`          |
  | **`CP_EMAIL_FROM`**                 | ?string                | `undefined`          |
  | **`CP_EMAIL_SMTP_USERNAME`**        | ?string                | `"localhost"`        |
  | **`CP_EMAIL_SMTP_PASSWORD`**        | ?string                | `null`               |
  | **`CP_EMAIL_SMTP_PORT`**            | ?number                | `25`                 |
  | **`CP_EMAIL_SMTP_CRYPTO`**          | [`"tls"` or `"ssl"`]   | `"tls"`              |
  | **`CP_ENABLE_2FA`**                 | ?boolean               | `undefined`          |
  | **`CP_MEDIA_FILE_MANAGER`**         | ?string                | `undefined`          |
  | **`CP_MEDIA_S3_ENDPOINT`**          | ?string                | `undefined`          |
  | **`CP_MEDIA_S3_KEY`**               | ?string                | `undefined`          |
  | **`CP_MEDIA_S3_SECRET`**            | ?string                | `undefined`          |
  | **`CP_MEDIA_S3_REGION`**            | ?string                | `undefined`          |
  | **`CP_MEDIA_S3_BUCKET`**            | ?string                | `undefined`          |
  | **`CP_MEDIA_S3_PROTOCOL`**          | ?number                | `undefined`          |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`** | ?boolean             | `undefined`          |
  | **`CP_MEDIA_S3_KEY_PREFIX`**        | ?string                | `undefined`          |
  | **`CP_DISABLE_HTTPS`**              | ?[`0` o `1`]           | `undefined`          |
  | **`CP_MAX_BODY_SIZE`**              | ?number (con sufijo)   | `512M`               |
  | **`CP_PHP_MEMORY_LIMIT`**           | ?number (con sufijo)   | `512M`               |
  | **`CP_TIMEOUT`**                    | ?number                | `900`                |

- **castopod/web-server**

  | Nombre de la variable | Tipo                  | Valor predeterminado |
  | --------------------- | --------------------- | -------------------- |
  | **`CP_APP_HOSTNAME`** | ?string               | `"app"`              |
  | **`CP_MAX_BODY_SIZE`** | ?number (con sufijo) | `512M`               |
  | **`CP_TIMEOUT`**      | ?number               | `900`                |