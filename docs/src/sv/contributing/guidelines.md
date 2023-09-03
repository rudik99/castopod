---
title: Riktlinjer
---

# Bidra till Castopod

Älskar du Castopod och vill hjälpa till? Tack så mycket, det finns något att göra för alla!

Ta en stund och gå igenom detta dokument för att göra bidragsprocessen enkel och effektiv för alla inblandade.

Att följa dessa riktlinjer hjälper till att kommunicera att du respekterar utvecklarnas tid som hanterar och utvecklar detta öppna källkodsprojekt. Som ett gensvar bör de också visa dig respekt genom att hantera ditt problem eller bedöma dina patchar och funktioner.

::: info Anteckning

**Alla** bidrag som görs till en annan källkodswebbplats än
[den ursprungliga webbplatsen](https://code.castopod.org/adaures/castopod) kommer inte att accepteras.

:::

## Använda felhanteraren

[Felhanteraren](https://code.castopod.org/adaures/castopod/-/issues) är det föredragna sättet att rapportera [fel](#felrapporter), [begäran om funktioner](#funktionsbegäran) och [föreslå ändringar](#pull-begäran).

## ⚠️ Säkerhetsproblem och sårbarheter

Om du stöter på något säkerhetsproblem eller sårbarhet i Castopod-koden, kontakta oss direkt via e-post på [security@castopod.org](mailto:security@castopod.org).

## Felrapporter

Ett fel är ett _påvisbart problem_ som orsakas av koden i källkoden. Bra felrapporter är oerhört hjälpsamma - tack!

Riktlinjer för felrapporter:

1. **Använd felkontrollen** &mdash; kontrollera om felen redan har rapporterats.

2. **Kontrollera om felet har åtgärdats** &mdash; försök att återskapa felet med den senaste versionen av `main`-grenen i källkoden.

3. **Isoler problemet** &mdash; skapa idealiskt sett en [minskad testfall](https://css-tricks.com/reduced-test-cases/) och ett levande exempel.

En bra felrapport borde inte få andra att jaga dig för mer information. Försök att vara så detaljerad som möjligt i din rapport. Vilken är din miljö? Vilka steg kommer att återskapa felet? Vilka webbläsare och operativsystem upplever problemet? Vad förväntar du dig att få för resultat? Alla dessa detaljer hjälper människor att fixa eventuella buggar.

> [Mallar för felrapporter](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates) har skapats för detta projekt. Du kan använda dem för att hjälpa dig att följa dessa riktlinjer.

## Funktionsbegäran

Funktionsbegäran välkomnas. Men ta en stund och ta reda på om din idé passar in i projektets omfattning och mål. Det är upp till _dig_ att argumentera starkt för att övertyga projektets utvecklare om fördelarna med denna funktion. Var vänlig och ange så mycket detaljer och sammanhang som möjligt.

## Pull-begäran

Bra pull-begäran - patchar, förbättringar, nya funktioner - är en fantastisk hjälp. De bör förbli fokuserade och undvika att innehålla orelaterade ändringar.

**Be gärna först** innan du börjar arbeta på en betydande pull-begäran (t.ex. implementera funktioner, refaktorera kod, portera till ett annat språk), annars riskerar du att spendera mycket tid på något som projektets utvecklare kanske inte vill slå samman i projektet.

Var snäll och följ kodningskonventionerna som används i hela projektet (indentering, noggranna kommentarer, etc.) och eventuella andra krav (som testtäckning).

Att följa följande process är det bästa sättet att få ditt arbete inkluderat i projektet:

1. [Gaffla](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) projektet, klona din gaffel och konfigurera fjärranslutningarna:

```bash
# Klon din gaffel av källkoden till aktuell katalog
git clone https://code.castopod.org/<ditt-användarnamn>/castopod.git

# Navigera till den nyligen klonade mappen
cd castopod

# Ange den ursprungliga källkoden som en fjärranslutning med namnet "upstream"
git remote add upstre