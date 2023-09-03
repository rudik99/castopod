---
title: Retningslinjer
---

# Bidra til Castopod

Elsker du Castopod og ønsker å hjelpe til? Takk så mye, det er noe å gjøre for alle!

Vennligst ta deg et øyeblikk til å gjennomgå dette dokumentet for å gjøre bidragsprosessen enkel og effektiv for alle involverte.

Å følge disse retningslinjene bidrar til å kommunisere at du respekterer utviklernes tid i forvaltningen og utviklingen av dette åpne prosjektet. Som takk bør de gjengjelde denne respekten ved å håndtere problemene dine eller vurdere lappene og funksjonene dine.

::: info Merk

**Enhver** bidrag gjort på et annet depot enn [det originale depotet](https://code.castopod.org/adaures/castopod) vil ikke bli akseptert.

:::

## Bruk av oppgavesystemet

[Oppgavesystemet](https://code.castopod.org/adaures/castopod/-/issues) er den foretrukne kanalen for [feilrapporter](#feilrapporter), [forespørsler om funksjoner](#funksjonsforespørsler) og [sending av trekkforespørsler](#trekkforespørsler).

## ⚠️ Sikkerhetsproblemer og sårbarheter

Hvis du oppdager noen sikkerhetsproblemer eller sårbarheter i Castopod-koden, vennligst kontakt oss direkte på e-post til [security@castopod.org](mailto:security@castopod.org).

## Feilrapporter

En feil er et _påvisbart problem_ som skyldes koden i depotet. Gode feilrapporter er svært nyttige - takk!

Retningslinjer for feilrapporter:

1. **Bruk søkefunksjonen for problemer** &mdash; sjekk om problemet allerede er rapportert.

2. **Sjekk om problemet er løst** &mdash; prøv å gjenskape det ved å bruke den nyeste `main`-grenen i depotet.

3. **Isoler problemet** &mdash; ideelt sett, opprett en [reduksjonstest](https://css-tricks.com/reduced-test-cases/) og et levende eksempel.

En god feilrapport bør ikke etterlate andre behov for å be om mer informasjon. Vennligst forsøk å være så detaljert som mulig i din rapport. Hva er miljøet ditt? Hvilke trinn vil gjenskape problemet? Hvilke nettlesere og operativsystemer opplever problemet? Hva forventer du som utfallet? Alle disse detaljene vil hjelpe folk med å fikse eventuelle potensielle feil.

> [Malene for oppgaver](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates) har blitt opprettet for dette prosjektet. Du kan bruke dem til å hjelpe deg å følge disse retningslinjene.

## Funksjonsforespørsler

Funksjonsforespørsler er velkomne. Men ta deg et øyeblikk til å finne ut om ideen din passer innenfor prosjektets omfang og mål. Det er opp til _deg_ å argumentere godt for å overbevise prosjektets utviklere om fordelene med denne funksjonen. Vennligst gi så mye detaljer og sammenheng som mulig.

## Trekkforespørsler

Gode trekkforespørsler - lapper, forbedringer, nye funksjoner - er en fantastisk hjelp. De bør være fokusert på et bestemt område og unngå å inneholde irrelevante lapper.

**Spør først** før du begynner på en betydelig trekkforespørsel (f.eks. implementering av funksjoner, omstrukturering av kode, overføring til et annet språk), ellers risikerer du å bruke mye tid på noe som prosjektets utviklere kanskje ikke ønsker å fusjonere inn i prosjektet.

Vennligst følg kodestandardene som brukes gjennom hele prosjektet (innrykk, korrekte kommentarer, osv.) og eventuelle andre krav (som testdekning).

Å følge følgende prosess er den beste måten å få arbeidet ditt inkludert i prosjektet:

1. [Gaffel](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) prosjektet, klone gaflen din og konfigurere fjernkontrollene:

```bash
# Klone gaflen av depotet til gjeldende mappe
git clone https://code.castopod.org/<ditt-brukernavn>/castopod.git

# Naviger til den nyklonede mappen
cd castopod

# Tilordne originaldepotet til en fjernkontroll som kalles "upstream"
git remote add upstream https://code.castopod.org/adaures/castopod.git
```

2. Hvis du klonet for en stund siden, få de nyeste endringene fra upstream:

```bash
git checkout main
git pull upstream main
```

3. Opprett en ny emnegren (fra `main`-grenen) for å inneholde funksjonen, endringen eller reparasjonen:

```bash
git checkout -b <emne-gren-navn>
```

4. Commit endringene dine i logiske deler. Vennligst følg disse [git commit-meldingsretningslinjene](https://conventionalcommits.org/), ellers kan koden din være usannsynlig å fusjoneres inn i hovedprosjektet. Bruk Gits [interaktive omgjøring](https://help.github.com/articles/about-git-rebase/) -funksjon til å rydde opp i commitene dine før du publiserer dem.

5. Flet dine lokale endringer (eller omgjør) fra oppstrømsgrenen til ditt emnet gren:

```bash
git pull [--omgjør] oppstrøm main
```

6. Trykk emnet gren opp til gaflen din:

```bash
git push origin <emne-gren-navn>
```

7. [Åpne en trekkforespørsel](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html#new-merge-request-from-a-fork) med en tydelig tittel og beskrivelse.

**VIKTIG**: Ved å sende en lapp samtykker du i at prosjekteierne kan lisensiere arbeidet ditt under vilkårene for [GNU AGPLv3](https://code.castopod.org/adaures/castopod/-/blob/main/LICENSE).

## Samarbeidsretningslinjer

Det er noen grunnleggende regler for å sikre høy kvalitet på prosjektet:

- Før en fusjon krever en trekkforespørsel minst to godkjennelser fra samarbeiderne, med mindre det er en arkitektonisk endring, en stor funksjon, osv. I så fall må minst 50% av kjerne-teamet være enige om å fusjonere det, der hver teammedlem har full rett til å legge ned veto. (dvs. alle kan blokkere alle trekkforespørsler)
- En trekkforespørsel skal være åpen i minst to dager før fusjonering (gjelder ikke trivielle bidrag som å rette en skrivefeil). Slik har alle nok tid til å se på det.

Du er alltid velkommen til å diskutere og foreslå forbedringer til disse retningslinjene.