---
title: Επίσημες εικόνες Docker
sidebarDepth: 3
---

# Επίσημες εικόνες του Docker

Το Castopod αποστέλλει 3 εικόνες Docker στο Docker Hub κατά τη διάρκεια της αυτοματοποιημένης διαδικασίας κατασκευής:

- [**`castopod/castopod`**](https://hub.docker.com/r/castopod/castopod): μια εικόνα για το Castopod που περιλαμβάνει όλα τα απαιτούμενα στοιχεία, χρησιμοποιώντας το nginx unit
- [**`castopod/app`**](https://hub.docker.com/r/castopod/app): το πακέτο εφαρμογής με όλες τις εξαρτήσεις του Castopod
- [**`castopod/web-server`**](https://hub.docker.com/r/castopod/web-server): μια διαμόρφωση του Nginx για το Castopod

Επιπλέον, το Castopod απαιτεί μια βάση δεδομένων που είναι συμβατή με το MySQL. Μια βάση δεδομένων Redis μπορεί επίσης να προστεθεί ως διαχειριστής προσωρινής αποθήκευσης.

## Υποστηριζόμενες ετικέτες

- `develop` [ασταθής], η τελευταία έκδοση του κλαδιού ανάπτυξης
- `beta` [σταθερή], η πιο πρόσφατη έκδοση βήτα
- `1.x.x` [σταθερή], συγκεκριμένη έκδοση (από το `1.0.0` και μετά)

## Παράδειγμα χρήσης

1. Εγκαταστήστε το [docker](https://docs.docker.com/get-docker/) και το
[docker-compose](https://docs.docker.com/compose/install/)
2. Δημιουργήστε ένα αρχείο `docker-compose.yml` με τα παρακάτω στοιχεία:

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

    Θα πρέπει να προσαρμόσετε ορισμένες μεταβλητές στις ανάγκες σας (π.χ. `CP_BASEURL`, `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD` και `CP_ANALYTICS_SALT`).

3. Ρυθμίστε ένα αντίστροφο πρόξενο για το TLS (SSL/HTTPS)

    Το TLS είναι υποχρεωτικό για να λειτουργήσει το ActivityPub. Αυτή η λειτουργία μπορεί να διαχειριστεί εύκολα από ένα αντίστροφο πρόξενο, για παράδειγμα το [Caddy](https://caddyserver.com/):

    ```
    #castopod
    castopod.example.com {
        reverse_proxy localhost:8000
    }
    ```

4. Εκτελέστε `docker-compose up -d`, περιμένετε να ολοκληρωθεί η αρχικοποίηση στο
    `https://castopod.example.com/cp-install` για να ολοκληρώσετε τη διαμόρφωση του Castopod!

5. Είστε έτοιμοι, αρχίστε να δημιουργείτε περιεχόμενο podcast! 🎙️🚀

## Μεταβλητές περιβάλλοντος

- **castopod/castopod** και **castopod/app**

  | Όνομα μεταβλητής             | Τύπος (`default`)        | Προεπιλογή          |
  | ----------------------------- | -------------------------- | ---------------- |
  | **`CP_BASEURL`**              | string                     | `undefined`      |
  | **`CP_MEDIA_BASEURL`**        | ?string                    | `CP_BASEURL`     |
  | **`CP_ADMIN_GATEWAY`**        | ?string                    | `"cp-admin"`     |
  | **`CP_AUTH_GATEWAY`**         | ?string                    | `"cp-auth"`      |
  | **`CP_ANALYTICS_SALT`**       | string                     | `undefined`      |
  | **`CP_DATABASE_HOSTNAME`**    | ?string                    | `"mariadb"`      |
  | **`CP_DATABASE_NAME`**        | ?string                    | `MYSQL_DATABASE` |
  | **`CP_DATABASE_USERNAME`**    | ?string                    | `MYSQL_USER`     |
  | **`CP_DATABASE_PASSWORD`**    | ?string                    | `MYSQL_PASSWORD` |
  | **`CP_DATABASE_PREFIX`**      | ?string                    | `"cp_"`          |
  | **`CP_CACHE_HANDLER`**        | [`"file"` ή `"redis"`]     | `"file"`         |
  | **`CP_REDIS_HOST`**           | ?string                    | `"localhost"`    |
  | **`CP_REDIS_PASSWORD`**       | ?string                    | `null`           |
  | **`CP_REDIS_PORT`**           | ?number                    | `6379`           |
  | **`CP_REDIS_DATABASE`**       | ?number                    | `0`              |
  | **`CP_EMAIL_SMTP_HOST`**      | ?string                    | `undefined`      |
  | **`CP_EMAIL_FROM`**           | ?string                    | `undefined`      |
  | **`CP_EMAIL_SMTP_USERNAME`**  | ?string                    | `"localhost"`    |
  | **`CP_EMAIL_SMTP_PASSWORD`**  | ?string                    | `null`           |
  | **`CP_EMAIL_SMTP_PORT`**      | ?number                    | `25`             |
  | **`CP_EMAIL_SMTP_CRYPTO`**    | [`"tls"` ή `"ssl"`]        | `"tls"`          |
  | **`CP_ENABLE_2FA`**           | ?boolean                   | `undefined`      |
  | **`CP_MEDIA_FILE_MANAGER`**   | ?string                    | `undefined`      |
  | **`CP_MEDIA_S3_ENDPOINT`**    | ?string                    | `undefined`      |
  | **`CP_MEDIA_S3_KEY`**         | ?string                    | `undefined`      |
  | **`CP_MEDIA_S3_SECRET`**      | ?string                    | `undefined`      |
  | **`CP_MEDIA_S3_REGION`**      | ?string                    | `undefined