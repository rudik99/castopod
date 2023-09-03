---
title: Oppdatering
sidebarDepth: 3
---

# Hvordan installere Castopod?

Etter at du har installert Castopod, kan du oppdatere instansen din til den
nyeste versjonen for å dra nytte av de siste funksjonene ✨, feilrettinger 🐛, og ytelsesforbedringer ⚡.

## Oppdateringsinstruksjoner

0. ⚠️ Før du oppdaterer, anbefaler vi sterkt at du sikkerhetskopierer
   Castopod-filene dine og databasen din.

   - se
     [Skal jeg ta en sikkerhetskopi før oppdatering?](#skal-jeg-ta-en-sikkerhetskopi-før-oppdatering)

1. Gå til
   [utgivelser-siden](https://code.castopod.org/adaures/castopod/-/releases) og
   sjekk om instansen din er oppdatert med den nyeste versjonen av Castopod

   - se
     [Hvor finner jeg min Castopod-versjon?](#hvor-finner-jeg-min-castopod-versjon)

2. Last ned den nyeste utgaven av `Castopod-pakken`, du kan velge mellom `zip` eller `tar.gz`-arkiver

   - ⚠️ Pass på at du laster ned Castopod-pakken og **IKKE** kildekoden
   - Merk at du også kan laste ned den nyeste pakken fra
     [castopod.org](https://castopod.org/)

3. På serveren din:

   - Slett alle filer unntatt `.env` og `public/media`
   - Kopier de nye filene fra nedlastingspakken til serveren din

     ::: info Tips

     Du må kanskje sette filrettigheter på nytt som gjort under installasjonsprosessen. Sjekk
     [Sikkerhetstiltak](./security.md).

     :::

4. Oppdater databasens skjema fra din `Castopod-admin`> `About`-side eller ved å kjøre:

   ```bash
   php spark castopod:database-update
   ```

5. Tøm bufferen fra din `Castopod-admin`> `Innstillinger`> `Generelt` > `Rydd opp`.
6. ✨Nå kan du nyte den nye instansen din, du er ferdig!

::: info Tips

Versjonene kan komme med ytterligere oppdateringsinstruksjoner (se
[utgivelsesmerknadene](https://code.castopod.org/adaures/castopod/-/releases)).

- se
  [Jeg har ikke oppdatert instansen min på lenge... Hva bør jeg gjøre?](#jeg-har-ikke-oppdatert-instansen-min-på-lenge-hva-bør-jeg-gjøre)

:::

## Fullstendig automatiserte oppdateringer

> Kommer snart... 👀

## Ofte Stilte Spørsmål (FAQ)

### Hvor finner jeg min Castopod-versjon?

Gå til adminpanelet i Castopod, versjonen vises nederst til venstre.

Du kan også finne versjonen i applikasjonen
`> Konfigurasjon > Constantes.php`-mappen.

### Jeg har ikke oppdatert instansen min på lenge... Hva bør jeg gjøre?

Ingen problem! Du trenger bare å få den nyeste versjonen som beskrevet
ovenfor. Når du kjører oppdateringsinstruksjonene (steg 4), kjør dem
sekvensielt fra den eldste til den nyeste.

> Du bør sikkerhetskopiere instansen din basert på datoen for din siste Castopod-oppdatering.

For eksempel, hvis du er på `v1.0.0-alpha.42` og ønsker å oppdatere til
`v1.0.0-beta.1`:

0. (sterkt anbefalt) Ta en sikkerhetskopi av filene dine og databasen din.

1. Last ned den nyeste versjonen, overskriv filene dine mens du beholder
   `.env` og `public/media`.

2. Kjør oppdateringsinstruksjonene en etter en (fra eldste til nyeste).

3. ✨Din nye instans er klar!

### Må jeg ta sikkerhetskopi før jeg oppdaterer?

Vi anbefaler at du gjør det, slik at du ikke mister noe hvis noe går galt!

Generelt sett anbefaler vi å ta regelmessige sikkerhetskopier av
Castopod-filene og databasen din for å unngå å miste noe...