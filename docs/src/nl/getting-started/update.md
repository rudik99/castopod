---
title: Update
sidebarDepth: 3
---

# Hoe Castopod te installeren?

Nadat je Castopod hebt geïnstalleerd, kun je je instantie updaten naar de nieuwste versie om te profiteren van de nieuwste functies ✨, bugfixes 🐛 en prestatieverbeteringen ⚡.

## Update-instructies

0. ⚠️ Voordat je een update uitvoert, raden we je ten zeerste aan om een back-up te maken van je Castopod-bestanden en database.

   - Zie
     [Moet ik een back-up maken voordat ik update?](#should-i-make-a-backup-before-updating)

1. Ga naar de
   [releases-pagina](https://code.castopod.org/adaures/castopod/-/releases) en
   controleer of je instantie up-to-date is met de nieuwste Castopod-versie.

   - Zie
     [Waar kan ik mijn Castopod-versie vinden?](#where-can-i-find-my-castopod-version)

2. Download het meest recente release-pakket genaamd `Castopod Package`, je kunt kiezen tussen de `zip` of `tar.gz` archieven.

   - ⚠️ Zorg ervoor dat je het Castopod Package downloadt en **NIET** de broncode.
   - Let op dat je het nieuwste pakket ook kunt downloaden vanaf
     [castopod.org](https://castopod.org/).

3. Op je server:

   - Verwijder alle bestanden behalve `.env` en `public/media`.
   - Kopieer de nieuwe bestanden van het gedownloade pakket naar je server.

     ::: info Opmerking

     Mogelijk moet je de bestandsrechten opnieuw instellen, zoals je deed tijdens het installatieproces. Zie
     [Beveiligingsproblemen](./security.md).

     :::

4. Werk je databaseschema bij vanuit je `Castopod Admin` > `About` pagina of door het volgende uit te voeren:

   ```bash
   php spark castopod:database-update
   ```

5. Wis je cache vanuit je `Castopod Admin` > `Settings` > `general` >
   `Housekeeping`.
6. ✨Geniet van je nieuwe instantie, je bent klaar!

::: info Opmerking

Versies kunnen aanvullende update-instructies bevatten (zie
[Releases-pagina](https://code.castopod.org/adaures/castopod/-/releases)).

- Zie
  [Wat moet ik doen als ik mijn instantie lange tijd niet heb bijgewerkt?](#je-nai-pas-mis-à-jour-mon-instance-depuis-longtemps-que-devrais-je-faire)

:::

## Volledig geautomatiseerde updates

> Binnenkort beschikbaar... 👀

## Veelgestelde vragen (FAQ)

### Waar kan ik mijn Castopod-versie vinden?

Ga naar je Castopod-beheerderspaneel, de versie wordt weergegeven linksonder.

Je kunt de versie ook vinden in de applicatie
`> Configuration > Constantes.php` map.

### Wat moet ik doen als ik mijn instantie lange tijd niet heb bijgewerkt?

Geen probleem! Haal gewoon de nieuwste versie op zoals hierboven beschreven. Bij het uitvoeren van de update-instructies (4), voer ze sequentieel uit, van oudste naar nieuwste.

> Je moet je instance back-uppen op basis van de datum van je laatste Castopod-update.

Bijvoorbeeld, als je op `v1.0.0-alpha.42` zit en je wilt updaten naar `v1.0.0-beta.1`:

0. (sterk aanbevolen) Maak een back-up van je bestanden en database.

1. Download de nieuwste versie, overschrijf je bestanden terwijl je `.env` en `public/media` behoudt.

2. Voer de update-instructies één voor één uit (van oudste naar nieuwste).

3. ✨Je nieuwe instantie is klaar!

### Moet ik een back-up maken voordat ik update?

We raden je aan dit te doen, zodat je niets verliest als er iets misgaat!

Over het algemeen raden we je aan regelmatig back-ups te maken van je Castopod-bestanden en database om te voorkomen dat je alles kwijtraakt...