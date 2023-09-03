---
title: Configuració del desenvolupament
sidebarDepth: 3
---

# Configura l'entorn de desenvolupament

## Introducció

Castopod és una aplicació web basada en el marc de treball `php`
[CodeIgniter 4](https://codeigniter.com).

Utilitzem [Docker](https://www.docker.com/) per configurar ràpidament un entorn de desenvolupament. Un
`docker-compose.yml` i un `Dockerfile` s'inclouen a la carpeta arrel del projecte
per ajudar-vos a iniciar la vostra contribució.

> No és necessari tenir coneixements previs de Docker per seguir els següents passos.
> No obstant això, si voleu utilitzar el vostre propi entorn, podeu fer-ho!

## Instruccions de configuració

### 1. Prerequisits

0. Instal·la [docker](https://docs.docker.com/get-docker).

1. Clona el projecte Castopod executant:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Crea un fitxer `.env` amb la configuració mínima necessària per connectar l'aplicació a la base de dades i utilitzar Redis com a controlador de memòria cau:

   ```ini
   CI_ENVIRONMENT="development"
   # Si s'estableix a "development", cal executar `npm run dev` per iniciar el servidor d'actius estàtics
   vite.environment="development"

   # Per defecte, això està establert a true a la configuració de l'aplicació.
   # Per al desenvolupament, s'ha d'establir a false ja que està
   # en un entorn local
   app.forceGlobalSecureRequests=false

   app.baseURL="http://localhost:8080/"
   media.baseURL="http://localhost:8080/"

   admin.gateway="cp-admin"
   auth.gateway="cp-auth"

   database.default.hostname="mariadb"
   database.default.database="castopod"
   database.default.username="castopod"
   database.default.password="castopod"

   cache.handler="redis"
   cache.redis.host = "redis"

   # Potser no voleu utilitzar Redis com a controlador de memòria cau
   # Comenteu o elimineu les dues línies anteriors i descomenteu
   # la següent línia per utilitzar el controlador de fitxers en memòria cau.
   # cache.handler="file"
   ```

   > _NB._ Podeu ajustar el vostre entorn establint més variables d'entorn
   > en el fitxer `.env` personalitzat. Consulteu l'`env` per obtenir exemples o el
   > [Manual de l'usuari de CodeIgniter4](https://codeigniter.com/user_guide/index.html)
   > per obtenir més informació.

3. (per a l'escritori Docker) Afegiu el repositori que heu clonat a `Configuració` de l'escritori Docker > `Recursos` > `Compartició de fitxers`

### 2. (recomanat) Desenvolupeu dins del contenidor de l'aplicació amb VSCode

Si esteu treballant a VSCode, podeu aprofitar la carpeta `.devcontainer/`.
Defineix un entorn de desenvolupament (contenidor de desenvolupament) amb requeriments preinstal·lats
i extensions de VSCode perquè no hàgiu de preocupar-vos per aquests. Tots els serveis
necessaris es carregaran automàticament! 🪄

1. Instal·leu l'extensió de VSCode
   [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. `Ctrl/Cmd + Shift + P` > `Obrir a dins del contenidor`

   > La finestra de VSCode es recarregarà a l'interior del contenidor de desenvolupament. Espereu diversos
   > minuts durant la primera càrrega ja que està construint tots els serveis necessaris.

   **Nota**: El contenidor de desenvolupament s'iniciarà executant el servidor php de Castopod.
   Durant el desenvolupament, haureu d'iniciar el servidor de desenvolupament de [Vite](https://vitejs.dev)
   per compilar el codi typescript i els estils:

   ```bash
   # executa el servidor de desenvolupament de Vite
   npm run dev
   ```

   Si hi ha algun problema amb el servidor php no s'està executant, podeu reiniciar-lo
   utilitzant les següents comandes:

   ```bash
   # executa el servidor Castopod
   php spark serve - 0.0.0.0
   ```

3. Ja esteu llest! 🎉

   Ara esteu **al dins del contenidor de desenvolupament**, podeu utilitzar la consola de VSCode
   (`Terminal` > `Terminal nou`) per executar qualsevol comanda:

   ```bash
   # PHP està instal·lat
   php -v

   # Composer està instal·lat
   composer -V

   # npm està instal·lat
   npm -v

   # git està instal·lat
   git version
   ```

Per obtenir més informació, consulteu
[VSCode Remote Containers](https://code.visualstudio.com/docs/remote/containers)

### 3. Comença a treballar

Ja esteu llestos! Comenceu a fer màgia actualitzant els fitxers del projecte! Ajudeu-vos del
[Manual de l'usuari de CodeIgniter4](https://codeigniter.com/user_guide/index.html) per obtenir més informació.

Per veure els vostres canvis, aneu a:

- `http://localhost:8080/` per a l'aplicació Castopod
- `http://localhost:8888/` per a la interfície phpmyadmin:

  - nom d'usuari: **