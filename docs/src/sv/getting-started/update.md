---
title: Uppdatering
sidebarDepth: 3
---

# Hur installerar jag Castopod?

Efter att ha installerat Castopod kan du uppdatera din instans till den senaste
versionen för att dra nytta av de senaste funktionerna ✨, buggkorrigeringarna 🐛
och prestandaförbättringarna ⚡.

## Instruktioner för uppdatering

0. ⚠️ Innan du gör någon uppdatering rekommenderar vi starkt att du säkerhetskopierar
   dina Castopod-filer och databasen .

   - Se
     [Borde jag säkerhetskopiera innan jag uppdaterar?](#should-i-make-a-backup-before-updating)

1. Gå till
   [releases-sidan](https://code.castopod.org/adaures/castopod/-/releases) och
   se om din instans är uppdaterad med den senaste Castopod-versionen

   - Se
     [Var hittar jag min Castopod-version?](#where-can-i-find-my-castopod-version)

2. Ladda ner det senaste releaspaketet med namnet `Castopod Package`, du kan välja
   mellan `zip` eller `tar.gz`-arkiv

   - ⚠️ Säkerställ att du laddar ner Castopod Package och **INTE** källkoden
   - Observera att du även kan ladda ner det senaste paketet från
     [castopod.org](https://castopod.org/)

3. På din server:

   - Ta bort alla filer förutom `.env` och `public/media`
   - Kopiera de nya filerna från det nedladdade paketet till din server

     ::: info Note

     Du kan behöva återställa filbehörigheterna som gjordes under installationsprocessen. Kontrollera
     [Security Concerns](./security.md).

     :::

4. Uppdatera databasschemat från din `Castopod Admin` > `About`-sida eller genom att
   köra:

   ```bash
   php spark castopod:database-update
   ```

5. Rensa cachen från din `Castopod Admin` > `Settings` > `general` >
   `Housekeeping`
6. ✨Njut av din nya instans, du är klar!

::: info Note

Releaserna kan innehålla ytterligare uppdateringsinstruktioner (se
[releases-anteckningssidan](https://code.castopod.org/adaures/castopod/-/releases)).

- Se
  [Jag har inte uppdaterat min instans på länge... Vad ska jag göra?](#je-nai-pas-mis-à-jour-mon-instance-depuis-longtemps-que-devrais-je-faire)

:::

## Helt automatiserade uppdateringar

> Kommer snart... 👀

## Vanliga frågor (FAQ)

### Var hittar jag min Castopod-version?

Gå till din Castopod-administrationspanel och versionen visas längst ned till vänster.

Du kan också hitta versionen i
applikationen `> Configuration > Constantes.php`-mappen.

### Jag har inte uppdaterat min instans på länge... Vad ska jag göra?

Inga problem! Du behöver bara få den senaste versionen enligt beskrivningen
ovan. När du kör uppdateringsinstruktionerna (4), kör dem sekventiellt, från äldst till nyast.

> Du bör säkerhetskopiera din instans beroende på datumet för din senaste Castopod-uppdatering.

Till exempel, om du är på `v1.0.0-alpha.42` och vill uppdatera till
`v1.0.0-beta.1`:

0. (starkt rekommenderat) Säkerhetskopiera dina filer och databas.

1. Ladda ner den senaste versionen, skriv över dina filer och behåll
   `.env` och `public/media`.

2. Kör uppdateringsinstruktionerna en efter en (från äldst till nyast).

3. ✨ Din nya instans är klar!

### Borde jag göra en säkerhetskopia innan jag uppdaterar?

Vi rekommenderar att du gör det för att inte förlora något om något går fel!

Generellt rekommenderar vi att du regelbundet gör säkerhetskopior av
dina Castopod-filer och din databas för att undvika att förlora allt...