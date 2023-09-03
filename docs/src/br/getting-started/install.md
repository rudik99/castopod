---
title: Lec'hiadur

sidebarDepth: 3

---

# Petra zo da ober evit staliañ Castopod?

Kaset eo bet Castopod da gas gant ma vo posupl. Mard oc'h o implijout un oberiant dedie pe-drosoc'h, posupl eo da staliañ war pep mañer ar servijer web a zegas PHP-MySQL.

::: tip Notenn

Kaset hon eus dastumenni Docker ofisiel evit Castopod!

Mard oc'h o soñj staliañ Docker, ur membris da daesmet Castopod, gellout a rit loñkañ kuit hemañ hag ober war lec'hienn [Docker Castopod](./docker.md).

:::

## Arventennoù

- PHP v8.1 nemetken
- MariaDB version 5.7 pe c'hoazh pe MySQL version 10.2 pe lusiañ
- Geriañs HTTPS
- Oroerenn horlozh ntp-synced evit gwiriañ displya daoliou Breizh.

### PHP v8.1 nemetken

Rez eo nemetken versadur 8.1 PHP, gant an estentiens War-lerc'h:

- [intl](https://www.php.net/manual/fr/intl.requirements.php)
- [libcurl](https://www.php.net/manual/fr/curl.requirements.php)
- [mbstring](https://www.php.net/manual/fr/mbstring.installation.php)
- [gd](https://www.php.net/manual/en/image.installation.php) gant **JPEG**,
  **PNG** ha **WebP** levrioù.
- [exif](https://www.php.net/manual/fr/exif.installation.php)

Gwell vat e fellout a reoc'h sellet ma vo an estentiens-se fardet en ho PHP :

- json (gweredekaet dre ziouar - ne lakaat ket da weredekaat)
- xml (gweredekaet dre ziouar - ne lakaat ket da weredekaat)
- [mysqlnd](https://www.php.net/manual/fr/mysqlnd.install.php)

### Diazez geriañs MySQL-penurzh

> Gwerzhet ho peus stumm [MariaDB](https://mariadb.org).

::: warning Explicoù

Ne lakaer ket g Acastopod da van a-barzh a-dreuz MySQL 5.7 pe kenstroll diwezhañ 5.6 (e-korf ar skoazell dindan d'an 5 a viz C'hwevrer 2021) pe kelenn.

:::

Deoc'h eo ret gouzout stummañ an divyezhegezh servijer, anv an diaz, anv ar
geriadur ha ar ger-tremen da gemer perzh er stolidiñ. Mard oc'h ket ganto e usin,
galvit soudard ar wirinidigezh.

#### Skoazell alc'hwez

Ret eo eta reiñ a-stegal zo ar c'hlask reizhiad en ounskridoù stolidiñ da groc'hañ lakaet Castopod da gichenah da : `CREATE`, `ALTER`, `DILET`, `DETEXEKI`,
`GWENOLOU`, `ENASKI', `DIBAB`, `KENASKI`,`KEMMESK`, `KREUZAÑ GWENDEL`.

### (Profetek) FFmpeg v4.1.8 pe lusiañ evit kuzhioù video

Ret eo FFmpeg divyezhezh 4.1.8 pe lusiañ evit kaout kuzhioù video. Setu ar c' estentiens monet :

- levrioù **FreeType 2** evit ar [gd](https://www.php.net/manual/en/image.installation.php).

### (Profetek) Itratelioù all

- Redis evit gwirioù gwellañ kuzhioù traoù
- CDN evit diflokañ dafar staoteriek ha gwirioù gwellañ kuzhioù traoù
- Dorrestell postel evit ar gerioù-pas goulennet.

## Lec'hienn staliañ

### Arventennennoù

0. Pell eo bet ho serfer web gant ar [arventennoù](#arventennoù) a staliañ.
1. Krouiñ un diaz MySQL evit Castopod gant un implijer en deus ar geriañs gwellañ hag ar geriañs hizivaet-bev (evit muien etre, sellit war [diaz gesket MySQL-penurzh](#diazez-geriañs-mysql-penurzh)).
2. Diazeont HTTPS war ho domani gant ur _savadur SSL_ war-raok.
3. Prenit ha dezarputit al lazhet [pakad diabarzh] (https://castopod.org/)
   war ar stolidiñ web m'ho peus ket graet dirak.
   - ⚠️ Lakaat ar c'horn zellet ar stolidiñ web d'ober da voud eo _dont davet_
     degasvez `public/` horvez e kasfe dantoñ hor genstrivad.

4. Ouzhañ **daskoù cron** war ho serfer web evit merañ.

   ```bash
      * * * * * /path/to/php /path/to/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Notenn** - Mard oc'h ket o skrivañ an dask paour-mañ, ne vo ket ober a-barzh
   Acastopod ne vo lakaet emgevreulek ar pezh a c'hoarvez:

   - Enporzhiañ boucleier podkast gant feed RSS diagaset dijaouel
   - Skignaat evitañ ho c'hemerian e-barzh an aod-delveg gant ar fediverse
   - Skignaat epizoedou da kehentiñ en e avidoù digunghevus en ur ober servij.
     [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Krouiñ kaout filmoù-v [requires FFmpeg]
     (#optional-ffmpeg-v418-or-higher-for-video-clips