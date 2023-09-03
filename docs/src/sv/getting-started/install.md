---
title: Installation
sidebarDepth: 3
---

# Hur man installerar Castopod?

Castopod är utformat för att vara enkelt att installera. Oavsett om du
använder dedikerad eller delad hosting kan du installera det på de flesta
webbserverar som är kompatibla med PHP-MySQL.

::: tip Tips

Vi har släppt officiella Docker-bilder för Castopod!

Om du vill använda Docker kan du hoppa över den här delen och gå direkt
till [Docker-dokumentationen](./docker.md) för Castopod.

:::

## Förutsättningar

- PHP v8.1 endast
- MySQL version 5.7 eller senare eller MariaDB version 10.2 eller senare
- Stöd för HTTPS
- En [ntp-synkad klocka](https://wiki.debian.org/NTP) för att validera federationens inkommande förfrågningar

### PHP v8.1 endast

PHP-version 8.1 krävs, med följande installerade tillägg:

- [intl](https://www.php.net/manual/fr/intl.requirements.php)
- [libcurl](https://www.php.net/manual/fr/curl.requirements.php)
- [mbstring](https://www.php.net/manual/fr/mbstring.installation.php)
- [gd](https://www.php.net/manual/en/image.installation.php) med **JPEG**,
  **PNG** och **WEBP**-bibliotek.
- [exif](https://www.php.net/manual/fr/exif.installation.php)

Dessutom, se till att följande tillägg är aktiverade i din PHP:

- json (aktiverat som standard - inaktivera inte det)
- xml (aktiverat som standard - inaktivera inte det)
- [mysqlnd](https://www.php.net/manual/fr/mysqlnd.install.php)

### Kompatibel MySQL-databas

> Vi rekommenderar att du använder [MariaDB](https://mariadb.org).

::: warning Varning

Castopod fungerar bara med MySQL-databaser 5.7 eller senare. Versionerna 5.6 (vars support upphörde 5 februari 2021) eller tidigare av MySQL fungerar inte.

:::

Du behöver värdnamnet för servern, databasnamnet, användarnamnet och lösenordet för att slutföra installationsprocessen. Om du inte har denna information, kontakta din administratör.

#### Åtkomsträttigheter

Användaren måste ha åtminstone följande åtkomsträttigheter för databasen så att Castopod fungerar: `CREATE`, `ALTER`, `DELETE`, `EXECUTE`,
`INDEX`, `INSERT`, `SELECT`, `UPDATE`, `REFERENCES`, `CREATE VIEW`.

### (Valfritt) FFmpeg v4.1.8 eller senare för videoklipp

[FFmpeg](https://www.ffmpeg.org/) version 4.1.8 eller senare krävs om du vill generera videoklipp. Följande tillägg måste vara installerade:

- **FreeType 2**-bibliotek för [gd](https://www.php.net/manual/en/image.installation.php).

### (Valfritt) Andra rekommendationer

- Redis för bättre cacheprestanda.
- CDN för att cachera statiska filer och förbättra prestanda.
- E-postgateway för lösenord som har gått förlorade.

## Installationsinstruktioner

### Förberedelser

0. Skaffa en webbserver med [de förutsättningar](#forutsattningar) installerade.
1. Skapa en MySQL-databas för Castopod med en användare som har åtkomsträttigheter och redigeringsrättigheter (för mer information, se [Kompatibel MySQL-databas](#kompatibel-mysql-databas)).
2. Aktivera HTTPS på din domän med ett _SSL-certifikat_.
3. Ladda ner och packa upp den senaste [Castopod-paketet](https://castopod.org/) på webbservern om du inte redan har gjort det.
   - ⚠️ Låt roten till webbserverdokumentet peka till undermappen `public/` i `castopod`-mappen.
4. Lägg till **cron-uppgifter** på din webbserver för olika bakgrundsprocesser (ersätt sökvägarna enligt behov):

   ```bash
      * * * * * /path/to/php /path/to/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Obs** - Om du inte lägger till denna cron-uppgift kommer följande funktioner i Castopod inte att fungera:

   - Importera en podcast från en befintlig RSS-feed
   - Sända sociala aktiviteter till dina följare i fediversumet
   - Sända avsnitt till öppna nav via [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Generera videoklipp - [kräver FFmpeg](#valfritt-ffmpeg-v418-eller-senare-för-videoklipp)

### (Rekommenderat sätt) Installationsguiden

1. Kör Castopods installationsguide genom att gå till installationsguidens sida (`https://your_domain_name.com/cp-install`) i din favoritwebbläsare.
2. Följ de instruktioner som visas.
3. Börja sända podcasts!

:::info Notera

Installationsguidesskriptet skapar en `.env`-fil i roten av paketet. Om du inte kan använda installationsguiden kan du manuellt skapa och redigera `.env`-filen baserat på `.env.example`-filen.

:::

### E-post/SMTP-installation

Konfiguration av e-post krävs för att vissa funktioner ska fungera korrekt (t.ex. återhämtning av glömt lösenord, skicka anvisningar till premium-prenumeranter, ...)

Du kan lägga till e-postkonfiguration i din instans `.env` på följande sätt:

```ini
# [...]

email.fromEmail="din_e-postadress"
email.SMTPHost="