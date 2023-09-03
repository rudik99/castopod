---
title: Richtlijnen
---

# Bijdragen aan Castopod

Hou je van Castopod en wil je helpen? Bedankt, er is voor iedereen iets te doen!

Neem even de tijd om dit document door te nemen om het bijdrageproces makkelijk en effectief te maken voor alle betrokkenen.

Het volgen van deze richtlijnen laat zien dat je respect hebt voor de tijd van de ontwikkelaars die dit open source project beheren en ontwikkelen. Zij zouden dat respect moeten beantwoorden door zich bezig te houden met jouw probleem of het beoordelen van patches en functies.

::: info Opmerking

**Elke** bijdrage op een repository anders dan
[de oorspronkelijke repository](https://code.castopod.org/adaures/castopod) zal niet
geaccepteerd worden.

:::

## Gebruik van de issue tracker

Het [issue tracker](https://code.castopod.org/adaures/castopod/-/issues) is het
voorkeurskanaal voor [bugmeldingen](#bugmeldingen),
[verzoek om functies](#functieverzoeken) en
[het indienen van pull-aanvragen](#pull-aanvragen).

## ⚠️ Veiligheidsproblemen en kwetsbaarheden

Als je een veiligheidsprobleem of kwetsbaarheid tegenkomt in de Castopod broncode,
neem dan direct contact met ons op via e-mail op
[security@castopod.org](mailto:security@castopod.org)

## Bugmeldingen

Een bug is een _aantoonbaar probleem_ dat wordt veroorzaakt door de code in de repository.
Goede bugmeldingen zijn erg nuttig - bedankt!

Richtlijnen voor bugmeldingen:

1. **Gebruik de probleemzoeker** &mdash; controleer of het probleem al
   gemeld is.

2. **Controleer of het probleem is opgelost** &mdash; probeer het te reproduceren met behulp van de
   laatste versie van de `main` branch in de repository.

3. **Isoleer het probleem** &mdash; creëer idealiter een
   [gereduceerd testgeval](https://css-tricks.com/reduced-test-cases/) en een live
   voorbeeld.

Een goede bugmelding zou anderen niet moeten dwingen om je achterna te gaan voor meer
informatie. Probeer alsjeblieft zo gedetailleerd mogelijk te zijn in jouw rapport. Wat is
jouw omgeving? Welke stappen zullen het probleem reproduceren? Welke browser(s) en besturingssytemen
ondervinden het probleem? Wat zou je verwachten als resultaat? Al deze
details zullen mensen helpen om eventuele fouten op te lossen.

> [Issue sjablonen](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates)
> zijn gemaakt voor dit project. Je kunt ze gebruiken om je te helpen deze richtlijnen te volgen.

## Functieverzoeken

Functieverzoeken zijn welkom. Maar neem even de tijd om te controleren of jouw idee
past binnen de reikwijdte en doelstellingen van het project. Het is aan _jou_ om een sterke
zaak te maken om de ontwikkelaars van het project te overtuigen van de waarde van deze functie. Geef alsjeblieft
zoveel mogelijk details en context.

## Pull-aanvragen

Goede pull-aanvragen - patches, verbeteringen, nieuwe functies - zijn fantastisch. Ze moeten gericht blijven en geen ongerelateerde commits bevatten.

**Vraag alsjeblieft eerst om toestemming** voordat je aan een significante pull-aanvraag begint (bijvoorbeeld
het implementeren van functies, code refactoring, porteren naar een andere taal),
anders loop je het risico veel tijd te besteden aan iets dat de
ontwikkelaars van het project mogelijk niet willen samenvoegen.

Houd je alsjeblieft aan de coderingsconventies die door het project worden gebruikt (inspringing,
nauwkeurige opmerkingen, etc.) en aan andere vereisten (zoals testdekking).

Het volgen van het volgende proces is de beste manier om ervoor te zorgen dat jouw werk wordt opgenomen.
in het project:

1. [Fork](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) het
   project, kloon je fork en configureer de remotes:

```bash
# Kloon je repositoryfork naar de huidige map
git clone https://code.castopod.org/<jouw-gebruikersnaam>/castopod.git

# Navigeer naar de nieuw gekloonde map
cd castopod

# Koppel de originele repository aan een remote genaamd "upstream"
git remote add upstream https://code.castopod.org/adaures/castopod.git
```

2. Als je al een tijdje geleden hebt gekloond, haal je de nieuwste wijzigingen op van upstream:

```bash
git checkout main
git pull upstream main
```

3. Maak een nieuwe onderwerp-branch (van de `main` branch) om jouw functie,
   wijziging of oplossing in op te nemen:

```bash
git checkout -b <onderwerp-branch-naam>
```

4. Commit jouw wijzigingen in logische delen. Houd je alsjeblieft aan deze
   [richtlijnen voor git commits](https://conventionalcommits.org/) anders zal jouw
   code waarschijnlijk niet worden samengevoegd met het hoofdproject. Gebruik Git's
   [interactieve rebase](https://help.github.com/articles/about-git-rebase/)
   functie om jouw commits op te schonen voordat je ze openbaar maakt.

5. Combineer lokaal (met behulp van merge of rebase) de upstream-ontwikkelingsbranch met jouw onderwerp-branch:

```bash
git pull [--rebase] upstream main
```

6. Push jouw onderwerp-branch naar jouw fork:

```bash
git push origin <onderwerp-branch-naam>
```

7. [Open een pull-aanvraag](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html#new-merge-request-from-a-fork)
   met een duidelijke titel en beschrijving.

**BELANGRIJK**: Door een patch in te dienen, stem je ermee in dat de eigenaren van het project
jouw werk onder de voorwaarden van de
[GNU AGPLv3](https://code.castopod.org/adaures/castopod/-/blob/main/LICENSE) kunnen licenseren.

## Richtlijnen voor samenwerking

Er zijn een paar basisregels om de kwaliteit van het project te waarborgen:

- Voor het samenvoegen van een PR zijn ten minste twee goedkeuringen van de samenwerkers
  vereist, tenzij het om een architecturale wijziging, een grote functie, etc. gaat. In dat geval moet
  minstens 50% van het kernteam akkoord gaan met het samenvoegen, waarbij elk teamlid
  een volledig vetorecht heeft. (d.w.z. dat iedereen elke PR kan blokkeren)
- Een PR moet minstens twee dagen open blijven voordat het wordt samengevoegd (geldt niet
  voor triviale bijdragen zoals het corrigeren van een typefout). Op deze manier heeft iedereen voldoende
  tijd om ernaar te kijken.

Je bent altijd welkom om deze richtlijn te bespreken en verbeteringen voor te stellen.