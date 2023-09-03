---
title: Instal·lació
sidebarDepth: 3
---

# Com instal·lar Castopod?

Castopod ha estat dissenyat per ser fàcil d'instal·lar. Ja sigui que utilitzis
un allotjament dedicat o compartit, pots instal·lar-ho en la majoria de servidors
web compatibles amb PHP-MySQL.

::: tip Nota

Hem publicat imatges oficials de Docker per a Castopod!

Si prefereixes utilitzar Docker, pots saltar aquesta part i anar directament a la
[documentació sobre Docker](./docker.md) per a Castopod.

:::

## Requisits

- PHP v8.1 només
- MySQL versió 5.7 o superior o MariaDB versió 10.2 o superior
- Suport per a HTTPS
- Un [rellotge sincronitzat amb ntp](https://wiki.debian.org/NTP) per validar les
  sol·licituds entrants de la federació

### PHP v8.1 només

Es requereix la versió 8.1 de PHP, amb les següents extensions instal·lades:

- [intl](https://www.php.net/manual/fr/intl.requirements.php)
- [libcurl](https://www.php.net/manual/fr/curl.requirements.php)
- [mbstring](https://www.php.net/manual/fr/mbstring.installation.php)
- [gd](https://www.php.net/manual/en/image.installation.php) amb **JPEG**,
  **PNG** i biblioteques **WEBP**.
- [exif](https://www.php.net/manual/fr/exif.installation.php)

A més, assegura't que les següents extensions estiguin activades en el teu PHP:

- json (activat de forma predeterminada - no el desactivis)
- xml (activat de forma predeterminada - no el desactivis)
- [mysqlnd](https://www.php.net/manual/fr/mysqlnd.install.php)

### Base de dades compatible amb MySQL

> Recomanem utilitzar [MariaDB](https://mariadb.org).

::: warning Atenció

Castopod només funciona amb bases de dades MySQL 5.7 o versions més recents.
Les versions 5.6 (que han deixat de rebre suport el 5 de febrer de 2021) o anteriors
de MySQL no funcionaran.

:::

Necessitaràs el nom de l'amfitrió del servidor, el nom de la base de dades, el nom
d'usuari i la contrasenya per completar el procés d'instal·lació. Si no tens aquesta
informació, posa't en contacte amb l'administrador.

#### Drets d'accés

L'usuari ha de tenir com a mínim aquests drets d'accés a la base de dades perquè
Castopod funcioni: `CREATE`, `ALTER`, `DELETE`, `EXECUTE`,
`INDEX`,`INSERT`, `SELECT`, `UPDATE`,`REFERENCES`, `CREATE VIEW`.

### (Opcional) FFmpeg v4.1.8 o superior per a clips de vídeo

Es requereix la versió 4.1.8 o superior de [FFmpeg](https://www.ffmpeg.org/) si
vols generar clips de vídeo. Les següents extensions han d'estar instal·lades:

- biblioteca **FreeType 2** per a
  [gd](https://www.php.net/manual/en/image.installation.php).

### (Opcional) Altres recomanacions

- Redis per a un millor rendiment del memòria cau (cache).
- CDN per a la cache de fitxers estàtics i un millor rendiment.
- Passarel·la de correu electrònic per als contrasenyes perdudes.

## Instruccions d'instal·lació

### Preparatius

0. Obtén un servidor web amb [els requisits](#requisits) instal·lats.
1. Crea una base de dades MySQL per a Castopod amb un usuari amb els permisos d'accés i
   modificació (per a més informació, consulta la secció
   [Base de dades compatible amb MySQL](#base-de-dades-compatible-amb-mysql)).
2. Activa HTTPS al teu domini amb un _certificat SSL_.
3. Descarrega i descomprimeix el paquet més recent de [Castopod](https://castopod.org/)
   al servidor web si encara no ho has fet.
   - ⚠️ Assegura't que la carpeta arrel del document del servidor web apunti a la subcarpeta
     `public/` de la carpeta `castopod`.
4. Afegiu **tasques cron** al teu servidor web per als diversos processos en segon pla
   (substitueix les rutes segons corresponguin):

   ```bash
      * * * * * /ruta/fins/a/php /ruta/fins/a/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Nota** - Si no afegeixes aquesta tasca cron, les funcionalitats següents de Castopod
   no funcionaran:

   - Importar un podcast des d'un aliment RSS existent
   - Difondre activitats socials als teus seguidors a la federació
   - Difondre episodis a hubs oberts utilitzant
     [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Generació de clips de vídeo -
     [requereix FFmpeg](#optional-ffmpeg-v418-or-higher-for-video-clips)

### (Mètode recomanat) Assistent d'instal·lació

1. Executa l'script d'instal·lació de Castopod accedint a la pàgina de l'assistent
   d'instal·lació (`https://el-teu-nom-de-domini.com/cp-install`) des del teu navegador
   web preferit.
2. Segueix les instruccions que s'hi mostren.
3. Comença a emetre el teu podcast!

:::info Nota

L'script d'instal·lació crea un fitxer `.env` a la carpeta arrel del paquet. Si no pots
utilitzar l'assistent d'