---
title: Imagens Oficiais Docker
sidebarDepth: 3
---

# Imagens Oficiais Docker

O Castopod envia 3 imagens Docker para o Hub Docker como parte de seu processo de construção automatizada:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): uma imagem all in one do Castopod usando o nginx unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): o pacote de aplicação com todas as dependências do Castopod
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): uma configuração do Nginx para o Castopod

Além disso, o Castopod requer um banco de dados compatível com o MySQL. Um banco de dados Redis pode ser adicionado como gerenciador de cache.

## Tags Suportadas

- `develop` [unstable], a versão mais recente do branch de desenvolvimento
- `beta` [stable], última versão beta
- `1.x.x` [stable], versão específica (a partir da `1.0.0`)

## Exemplo de Uso

1. Instale o [docker](https://docs.docker.com/get-docker/) e o [docker-compose](https://docs.docker.com/compose/install/)
2. Crie um arquivo `docker-compose.yml` com o seguinte conteúdo:

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

   Você precisará ajustar algumas variáveis de acordo com suas necessidades (ex: `CP_BASEURL`, `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` e `CP_ANALYTICS_SALT`).

3. Configure um proxy reverso para TLS (SSL/HTTPS)

   O TLS é obrigatório para o ActivityPub funcionar. Essa tarefa pode ser facilmente resolvida com um proxy reverso, por exemplo usando o [Caddy](https://caddyserver.com/):

   ```
   #castopod
   castopod.example.com {
       reverse_proxy localhost:8000
   }
   ```

4. Execute `docker-compose up -d`, espere que esteja pronto em `https://castopod.example.com/cp-install` para finalizar a configuração do Castopod!

5. Está tudo pronto, comece a podcastar! 🎙️🚀

## Variáveis de Ambiente

- **castopod/castopod** e **castopod/app**

  | Nome da Variável                     | Tipo (`default`)        | Valor Padrão     |
  | ------------------------------------ | ----------------------- | ---------------- |
  | **`CP_BASEURL`**                     | string                  | `undefined`      |
  | **`CP_MEDIA_BASEURL`**               | ?string                 | `CP_BASEURL`     |
  | **`CP_ADMIN_GATEWAY`**               | ?string                 | `"cp-admin"`     |
  | **`CP_AUTH_GATEWAY`**                | ?string                 | `"cp-auth"`      |
  | **`CP_ANALYTICS_SALT`**              | string                  | `undefined`      |
  | **`CP_DATABASE_HOSTNAME`**           | ?string                 | `"mariadb"`      |
  | **`CP_DATABASE_NAME`**               | ?string                 | `MYSQL_DATABASE` |
  | **`CP_DATABASE_USERNAME`**           | ?string                 | `MYSQL_USER`     |
  | **`CP_DATABASE_PASSWORD`**           | ?string                 | `MYSQL_PASSWORD` |
  | **`CP_DATABASE_PREFIX`**             | ?string                 | `"cp_"`          |
  | **`CP_CACHE_HANDLER`**               | [`"file"` ou `"redis"`] | `"file"`         |
  | **`CP_REDIS_HOST`**                  | ?string                 | `"localhost"`    |
  | **`CP_REDIS_PASSWORD`**              | ?string                 | `null`           |
  | **`CP_REDIS_PORT`**                  | ?number                 | `6379`           |
  | **`CP_REDIS_DATABASE`**              | ?number                 | `0`              |
  | **`CP_EMAIL_SMTP_HOST`**             | ?string                 | `undefined`      |
  | **`CP_EMAIL_FROM`**                  | ?string                 | `undefined`      |
  | **`CP_EMAIL_SMTP_USERNAME`**         | ?string                 | `"localhost"`    |
  | **`CP_EMAIL_SMTP_PASSWORD`**         | ?string                 | `null`           |
  | **`CP_EMAIL_SMTP_PORT`**             | ?number                 | `25`             |
  | **`CP_EMAIL_SMTP_CRYPTO`**           | [`"tls"` ou `"ssl"`]    | `"tls"`          |
  | **`CP_ENABLE_2FA`**                  | ?boolean                | `undefined`      |
  | **`CP_MEDIA_FILE_MANAGER`**          | ?string                 | `undefined`      |
  | **`CP_MEDIA_S3_ENDPOINT`**           | ?string                 | `undefined`      |
  | **`CP_MEDIA_S3_KEY`**                | ?string                 | `undefined`      |
  | **`CP_MEDIA_S3_SECRET`**             | ?string                 | `undefined`      |
  | **`CP_MEDIA_S3_REGION`**             | ?string                 | `undefined`      |
  | **`CP_MEDIA_S3_BUCKET`**             | ?string                 | `undefined`      |
  | **`CP_MEDIA_S3_PROTOCOL`**           | ?number                 | `undefined`      |
  | **`CP_MEDIA_S3_PATH_STYLE_ENDPOINT`**| ?boolean                | `undefined`      |
  | **`CP_MEDIA_S3_KEY_PREFIX`**         | ?string                 | `undefined`      |
  | **`CP_DISABLE_HTTPS`**               | ?[`0` ou `1`]           | `undefined`      |
  | **`CP_MAX_BODY_SIZE`**               | ?number (with suffix)   | `512M`           |
  | **`CP_PHP_MEMORY_LIMIT`**            | ?number (with suffix)   | `512M`           |
  | **`CP_TIMEOUT`**                     | ?number                 | `900`            |

- **castopod/web-server**

  | Nome da Variável         | Tipo                  | Valor Padrão |
  | ------------------------ | --------------------- | ------------ |
  | **`CP_APP_HOSTNAME`**    | ?string               | `"app"`      |
  | **`CP_MAX_BODY_SIZE`**   | ?number (with suffix) | `512M`       |
  | **`CP_TIMEOUT`**         | ?number               | `900`        |