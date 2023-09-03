---
title: Installering
sidebarDepth: 3
---

# Korleis installere Castopod?

Castopod er designa for å vere enkel å installere. Uansett om du bruker
dedikert eller delt hosting, kan du installere det på dei fleste
webserverar som støttar PHP-MySQL.

::: tip Merk

Vi har offisielle Docker-bilete for Castopod!

Hvis du vil bruke Docker, kan du hoppe over dette avsnittet og gå direkte
til [Docker-dokumentasjonen](./docker.md) for Castopod.

:::

## Førehandskrav

- PHP v8.1 eller nyare
- MySQL versjon 5.7 eller nyare eller MariaDB versjon 10.2 eller nyare
- Støtte for HTTPS
- Eit [ntp-synced clock](https://wiki.debian.org/NTP) for å validere innkomande forespørsler til føderasjonen

### PHP v8.1 eller nyare

PHP-versjon 8.1 er naudsynt, med følgjande utvidingar installert:

- [intl](https://www.php.net/manual/fr/intl.requirements.php)
- [libcurl](https://www.php.net/manual/fr/curl.requirements.php)
- [mbstring](https://www.php.net/manual/fr/mbstring.installation.php)
- [gd](https://www.php.net/manual/en/image.installation.php) med **JPEG**,
  **PNG** og **WEBP** bibliotek.
- [exif](https://www.php.net/manual/fr/exif.installation.php)

I tillegg bør du sjekke om følgjande utvidingar er aktivert i PHP:

- json (aktivert som standard - ikkje slå av)
- xml (aktivert som standard - ikkje slå av)
- [mysqlnd](https://www.php.net/manual/fr/mysqlnd.install.php)

### MySQL-kompatibel databaseserver

> Vi anbefalar å bruke [MariaDB](https://mariadb.org).

::: warning Merk

Castopod fungerer berre med MySQL-databaseserverar versjon 5.7 eller nyare.
Tidlegare versjonar av MySQL, som 5.6 (med støttetid som enda 5. februar 2021), vil ikkje fungere.

:::

Du vil trenge følgjande informasjon for å fullføre installasjonsprosessen:
vertsnamn for serveren, databasenamn, brukarnamn og passord. Hvis du
ikke har denne informasjonen, bør du kontakte administratoren din.

#### Tilgangsrettar

Brukaren må ha minst desse tilgangsrettane for databasen for at Castopod
skal fungere: `CREATE`, `ALTER`, `DELETE`, `EXECUTE`,
`INDEX`,`INSERT`, `SELECT`, `UPDATE`,`REFERENCES`, `CREATE VIEW`.

### (Fakultativt) FFmpeg v4.1.8 eller nyare for videoklipp

[FFmpeg](https://www.ffmpeg.org/) versjon 4.1.8 eller nyare er nødvendig
hvis du ønsker å generere videoklipp. Følgjande utvidingar må vere installert:

- biblioteket **FreeType 2** for
  [gd](https://www.php.net/manual/en/image.installation.php).

### (Fakultativt) Andre anbefalingar

- Redis for betre ytelse på cache.
- CDN for lagring av statiske filer og betre ytelse.
- E-postteneste for mista passord.

## Installasjonsinstruksjonar

### Førehandskrav

0. Skaff deg ein nettserver med [førehandskrava](#prerequisites) installert.
1. Opprett ein MySQL-databaseserver for Castopod, med ein brukar som har rettar
til å opprette og endre  (for meir informasjon, sjå [MySQL-kompatibel databaseserver](#mysql-kompatible-databaser)).
2. Aktiver HTTPS på domenet ditt med eit _SSL-sertifikat_.
3. Last ned og pakk ut den siste versjonen av [Castopod-pakken](https://castopod.org/)
   på nettserveren hvis du ikkje allereie har gjort det.
   - ⚠️ Sørg for at rotmappaen til nettserverdokumentet peiker på undermappa
     `public/` i `castopod`-mappa.
4. Legg til **cron-oppdrag** på nettserveren din for ulike bakgrunnsprosessar
   (bytt ut filstiane etter behov):

   ```bash
      * * * * * /path/to/php /path/to/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Merk** - Hvis du ikkje legg til dette cron-oppdraget, vil følgjande Castopod-funksjonar
   ikkje fungere:

   - Importere en podkast frå ein eksisterande RSS-feed
   - Kringkaste sosiale aktivitetar til følgjarane dine i fediverse
   - Sende episodar til open hubs ved å bruke
     [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Generere videoklipp -
     [krever FFmpeg](#optional-ffmpeg-v418-or-higher-for-video-clips)

### (Føreslått metode) Installasjonsveiviser

1. Kjør Castopod-installasjonsskriptet ved å gå til installasjonsveiviser-sida
   (`https://domain_name.com/cp-install`) i nettlesaren din.
2. Følg instruksjonane som blir vist.
3. Kom igang med podkasting!

:::info Merk

Installasjonsskriptet opprettar ei `.env`-fil i rotmappa til pakken. Hvis du
ikkje kan bruke installasjonsveiviseren, kan du opprette og redigere
`.env`-fila manuelt ved å bruke `.env.example`-fila som guide.

:::

### E-post/SMTP-oppsett

E-postoppsett er nødvendig for at nokre funksjonar skal fungere skikkeleg
(t.d.