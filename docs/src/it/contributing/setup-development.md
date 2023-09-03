---
title: Configurazione per lo sviluppo
sidebarDepth: 3
---

# Configurazione dell'ambiente di sviluppo

## Introduzione

Castopod è un'app web basata sul framework `php` [CodeIgniter 4](https://codeigniter.com).

Utilizziamo [Docker](https://www.docker.com/) per configurare rapidamente un ambiente di sviluppo. Un file `docker-compose.yml` e `Dockerfile` sono inclusi nella cartella radice del progetto per aiutarti ad avviare il tuo contributo.

> Non è necessaria alcuna conoscenza precedente di Docker per seguire i passaggi successivi. Tuttavia, se desideri utilizzare il tuo ambiente, sentiti libero di farlo!

## Istruzioni di configurazione

### 1. Pre-requisiti

0. Installa [docker](https://docs.docker.com/get-docker).

1. Clona il progetto Castopod eseguendo:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Crea un file `.env` con la configurazione minima richiesta per connettere l'app al database e utilizzare redis come gestore della cache:

   ```ini
   CI_ENVIRONMENT="development"
   # Se impostato su development, è necessario eseguire `npm run dev` per avviare il server degli asset statici
   vite.environment="development"

   # Di default, questo è impostato su true nella configurazione dell'app.
   # Per lo sviluppo, deve essere impostato su false in quanto è
   # in un ambiente locale
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

   # Potresti non voler utilizzare redis come gestore della cache
   # Commenta/rimuovi le due righe sopra e decommenta
   # la riga successiva per utilizzare la memorizzazione nella cache dei file.
   #cache.handler="file"
   ```

   > _NB._ Puoi personalizzare il tuo ambiente impostando ulteriori variabili d'ambiente nel tuo file `.env` personalizzato. Consulta il file `env` per esempi o la [Guida dell'utente di CodeIgniter4](https://codeigniter.com/user_guide/index.html) per ulteriori informazioni.

3. (per Docker Desktop) Aggiungi il repository che hai clonato a "File Sharing" in "Impostazioni" di Docker Desktop

### 2. (raccomandato) Sviluppa all'interno del contenitore dell'app con VSCode

Se stai lavorando in VSCode, puoi approfittare della cartella `.devcontainer/`. Definisce un ambiente di sviluppo (contenitore di sviluppo) con requisiti e estensioni preinstallati di VSCode in modo da non doverti preoccupare di loro. Tutti i servizi necessari verranno caricati automaticamente! 🪄

1. Installa l'estensione di VSCode [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. `Ctrl/Cmd + Maiusc + P` > `Apri nel contenitore`

   > La finestra di VSCode verrà ricaricata all'interno del contenitore di sviluppo. Prevedi alcuni minuti durante il primo caricamento, poiché verranno creati tutti i servizi necessari.

   **Nota**: Il contenitore di sviluppo verrà avviato eseguendo il server php di Castopod. Durante lo sviluppo, dovrai avviare il server di [Vite](https://vitejs.dev) per compilare il codice typescript e gli stili:

   ```bash
   # avvia il server Vite dev
   npm run dev
   ```

   Se si riscontrano problemi con il server php che non si avvia, è possibile riavviarlo utilizzando i seguenti comandi:

   ```bash
   # avvia il server Castopod
   php spark serve - 0.0.0.0
   ```

3. Sei pronto! 🎉

   Ora sei **all'interno del contenitore di sviluppo**, puoi utilizzare la console di VSCode (`Terminale` > `Nuovo terminale`) per eseguire qualsiasi comando:

   ```bash
   # PHP è installato
   php -v

   # Composer è installato
   composer -V

   # npm è installato
   npm -v

   # git è installato
   git version
   ```

Per ulteriori informazioni, consulta il sito [Remote Containers di VSCode](https://code.visualstudio.com/docs/remote/containers)

### 3. Inizia a programmare

Sei pronto! Inizia il tuo lavoro aggiornando i file del progetto! Ti consigliamo di consultare la [Guida dell'utente di CodeIgniter4](https://codeigniter.com/user_guide/index.html) per ulteriori informazioni.

Per visualizzare le tue modifiche, visita:

- `http://localhost:8080/` per l'app Castopod
- `http://localhost:8888/` per l'interfaccia di phpmyadmin:

  - nome utente: **castopod**
  - password: **castopod**

### 2-alt. Sviluppa al di fuori del contenitore dell'app

Non desideri utilizzare il contenitore di sviluppo di VSCode? Nessun problema!

1. Avvia manualmente i contenitori Docker:

   Vai nella cartella radice del progetto e esegui:

   ```bash
   # avvia tutti i servizi dichiarati nel file docker-compose.yml
   # l'opzione -d avvia i contenitori in background
   docker-compose up -d

   # Vedi tutti i processi in esecuzione (dovresti vedere 3 processi in esecuzione)
   docker-compose ps

   # In alternativa, puoi controllare tutti i processi Docker
   docker ps -a

   ```

  