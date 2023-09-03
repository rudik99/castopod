---
title: Installatie
sidebarDepth: 3
---

# Hoe installeer ik Castopod?

Castopod is ontworpen om eenvoudig te installeren te zijn. Of je nu een
dedicated of shared hosting gebruikt, je kunt het installeren op de meeste
web servers die compatibel zijn met PHP-MySQL.

::: tip Opmerking

We hebben officiële Docker-afbeeldingen voor Castopod uitgebracht!

Als je Docker wilt gebruiken, kun je dit gedeelte overslaan en direct naar de [Docker-documentatie](./docker.md) voor Castopod gaan.

:::

## Vereisten

- PHP v8.1 only
- MySQL versie 5.7 of hoger of MariaDB versie 10.2 of hoger
- Ondersteuning voor HTTPS
- Een [ntp-gesynchroniseerde klok](https://wiki.debian.org/NTP) om binnenkomende verzoeken van de federatie te valideren

### PHP v8.1 only

PHP versie 8.1 is vereist, met de volgende geïnstalleerde extensies:

- [intl](https://www.php.net/manual/fr/intl.requirements.php)
- [libcurl](https://www.php.net/manual/fr/curl.requirements.php)
- [mbstring](https://www.php.net/manual/fr/mbstring.installation.php)
- [gd](https://www.php.net/manual/en/image.installation.php) met **JPEG**,
  **PNG** en **WEBP** bibliotheken.
- [exif](https://www.php.net/manual/fr/exif.installation.php)

Zorg er daarnaast voor dat de volgende extensies zijn ingeschakeld in je PHP:

- json (standaard ingeschakeld - niet uitschakelen)
- xml (standaard ingeschakeld - niet uitschakelen)
- [mysqlnd](https://www.php.net/manual/fr/mysqlnd.install.php)

### Compatibele MySQL-database

> We raden aan om [MariaDB](https://mariadb.org) te gebruiken.

::: warning Let op

Castopod werkt alleen met MySQL-databases van versie 5.7 of hoger. Versies 5.6 (waarvan de ondersteuning op 5 februari 2021 is gestopt) of ouder werken niet.

:::

Je hebt de hostnaam van de server, de naam van de database, de gebruikersnaam en het wachtwoord nodig om het installatieproces te voltooien. Als je deze informatie niet hebt, neem dan contact op met je beheerder.

#### Toegangsrechten

De gebruiker moet in ieder geval de volgende toegangsrechten hebben op de database om Castopod te laten werken: `CREATE`, `ALTER`, `DELETE`, `EXECUTE`,
`INDEX`,`INSERT`, `SELECT`, `UPDATE`,`REFERENCES`, `CREATE VIEW`.

### (Optioneel) FFmpeg v4.1.8 of hoger voor videoclips

[FFmpeg](https://www.ffmpeg.org/) versie 4.1.8 of hoger is vereist als je videoclips wilt genereren. De volgende extensies moeten zijn geïnstalleerd:

- **FreeType 2** bibliotheek voor [gd](https://www.php.net/manual/en/image.installation.php).

### (Optioneel) Andere aanbevelingen

- Redis voor betere cache-prestaties.
- CDN voor het cachen van statische bestanden en betere prestaties.
- E-mail gateway voor verloren wachtwoorden.

## Installatie-instructies

### Vereisten

0. Verkrijg een webserver met de geïnstalleerde [vereisten](#vereisten)
1. Maak een MySQL-database aan voor Castopod met een gebruiker met de juiste toegangsrechten en bewerkingsrechten (zie [compatibele MySQL-database](#comptible-mysql-database) voor meer informatie).
2. Zorg ervoor dat HTTPS is ingeschakeld op je domein met een _SSL-certificaat_.
3. Download en unzip het laatste [Castopod-pakket](https://castopod.org/) op de webserver als je dat nog niet hebt gedaan.
   - ⚠️ Zorg ervoor dat de rootmap van het webdocument verwijst naar de `public/` submap van de `castopod` map.
4. Voeg **cron-taken** toe aan je webserver voor verschillende achtergrondprocessen (vervang de paden dienovereenkomstig):

   ```bash
      * * * * * /pad/naar/php /pad/naar/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Opmerking** - Als je deze cron-taak niet toevoegt, werken de volgende Castopod-functies niet:

   - Het importeren van een podcast uit een bestaande RSS-feed
   - Het delen van sociale activiteiten met je volgers in het Fediverse
   - Het uitzenden van afleveringen naar open hubs met behulp van [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Het genereren van videoclips - [vereist FFmpeg](#optioneel-ffmpeg-v418-of-hoger-voor-videoclips)

### (Aanbevolen methode) Installatiewizard

1. Voer het Castopod-installatiescript uit door naar de installatiewizard-pagina (`https://your_domain_name.com/cp-install`) te gaan in je favoriete webbrowser.
2. Volg de weergegeven instructies.
3. Begin met podcasten!

:::info Opmerking

Het installatiescript maakt een `.env`-bestand aan in de hoofdmap van het pakket. Als je de installatiewizard niet kunt gebruiken, kun je het `.env`-bestand handmatig maken en bewerken op basis van het `.env.example`-bestand.

:::

### E-mail/SMTP-configuratie

E-mailconfiguratie is vereist voor sommige functies om correct te werken (bijv. het ophalen van je vergeten wachtwoord, het verzenden van instructies naar premium-abonnees, ...)

Je kunt je e-mailconfiguratie toevoegen aan het `.env`-bestand van je Castopod-instantie zoals hieronder weergegeven:

```ini
# [...]

email.fromEmail="your_email_address"
email.SMTPHost="your_smtp_host"
email.SM