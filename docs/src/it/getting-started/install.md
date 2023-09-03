---
title: Installazione
sidebarDepth: 3
---

# Come installare Castopod ?

Castopod è progettato per essere facile da installare. Che tu stia usando un
hosting dedicato o condiviso, puoi installarlo sulla maggior parte dei
server web compatibili con PHP-MySQL.

::: tip Nota

Abbiamo rilasciato immagini Docker ufficiali per Castopod!

Se preferisci utilizzare Docker, puoi saltare questa parte e andare
direttamente alla [documentazione Docker](./docker.md) per Castopod.

:::

## Prerequisiti

- PHP v8.1 solo
- Versione MySQL 5.7 o superiore o MariaDB version 10.2 o superiore
- Supporto HTTPS
- Un [orologio sincronizzato con NTP](https://wiki.debian.org/NTP) per convalidare le richieste in arrivo di federtazione

### PHP v8.1 solo

È richiesta la versione 8.1 di PHP, con le seguenti estensioni installate:

- [intl](https://www.php.net/manual/fr/intl.requirements.php)
- [libcurl](https://www.php.net/manual/fr/curl.requirements.php)
- [mbstring](https://www.php.net/manual/fr/mbstring.installation.php)
- [gd](https://www.php.net/manual/en/image.installation.php) con **JPEG**,
  **PNG** e le librerie **WEBP**.
- [exif](https://www.php.net/manual/fr/exif.installation.php)

Inoltre, assicurati che le seguenti estensioni siano abilitate nel tuo PHP:

- json (abilitato per impostazione predefinita: non disabilitarlo)
- xml (abilitato per impostazione predefinita: non disabilitarlo)
- [mysqlnd](https://www.php.net/manual/fr/mysqlnd.install.php)

### Database compatibile con MySQL

> Ti consigliamo di utilizzare [MariaDB](https://mariadb.org).

::: warning Attento

Castopod funziona solo con database MySQL versione 5.7 o successiva.
Le versioni 5.6 (che hanno smesso di ricevere supporto il 5 febbraio 2021) o precedenti di
MySQL non funzioneranno.

:::

Avrai bisogno del nome host del server, del nome del database, del nome
utente e della password per completare il processo di installazione. Se non
hai queste informazioni, ti preghiamo di contattare l'amministratore.

#### Permessi di accesso

L'utente deve avere almeno questi permessi di accesso al database per far
funzionare Castopod: `CREATE`, `ALTER`, `DELETE`, `EXECUTE`,
`INDEX`,`INSERT`, `SELECT`, `UPDATE`,`REFERENCES`, `CREATE VIEW`.

### (Facoltativo) FFmpeg v4.1.8 o superiore per i video clip

[FFmpeg](https://www.ffmpeg.org/) versione 4.1.8 o superiore è richiesto se si
desidera generare video clip. L'estensione seguente deve essere installata:

- la libreria **FreeType 2** per
  [gd](https://www.php.net/manual/en/image.installation.php).

### (Facoltativo) Altri consigli

- Redis per una migliore performance nella cache.
- CDN per la cache dei file statici e una migliore performance.
- Gateway di posta per le password dimenticate.

## Istruzioni di installazione

### Prerequisiti

0. Prendi un server web con i [prerequisiti](#prerequisites) installati
1. Crea un database MySQL per Castopod con un utente che abbia i
   permessi di accesso e modifica (per ulteriori informazioni, vedi
   [Database compatibile con MySQL](#mysql-compatible-database)).
2. Abilita HTTPS sul tuo dominio con un _certificato SSL_.
3. Scarica e decomprimi l'ultimo [pacchetto di Castopod](https://castopod.org/)
   sul server web se non l'hai già fatto.
   - ⚠️ Assicurati di puntare la radice dei documenti del server web alla sotto-cartella
     `public/` della cartella `castopod`.
4. Aggiungi **attività cron** al tuo server web per vari processi in background
   (sostituisci i percorsi di conseguenza):

   ```bash
      * * * * * /percorso/all/php /percorso/di/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Nota** - Se non aggiungi questo task cron, le seguenti funzionalità di Castopod
   non funzioneranno:

   - Importazione di un podcast da un feed RSS esistente
   - Diffusione delle attività sociali ai tuoi seguaci nel fediverso
   - Diffusione di episodi ad hub aperti usando
     [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Generazione di video clip -
     [richiede FFmpeg](#optional-ffmpeg-v418-or-higher-for-video-clips)

### (Metodo consigliato) Installatore

1. Esegui lo script di installazione di Castopod andando alla pagina
   dell'installatore (`https://il_tuo_nome_di_dominio.com/cp-install`) nel tuo
   browser web preferito.
2. Segui le istruzioni visualizzate.
3. Inizia a podcastare !

:::info Nota

Lo script di installazione crea un file `.env` nella root del pacchetto. Se non
puoi utilizzare l'installatore, puoi creare ed editare manualmente il file `.env` basandoti
sul file `.env.example`.

:::

### Configurazione email/SMTP

La configurazione dell'email è necessaria affinché alcune funzionalità funzionino correttamente (ad es.
recuperare la password dimenticata, inviare istruzioni agli abbonati premium, ...)

Puoi aggiungere la configurazione dell'email nel file `.env` della tua istanza come segue:

```ini
# […]

email.fromEmail="tuo_indirizzo_email"
email.SMTPHost="il_tuo_host_smtp"
email.SMTPUser="il_tuo_utente_smtp"
email.SMTPPass="la_tua_password_smtp"
```

#### Opzioni di configurazione