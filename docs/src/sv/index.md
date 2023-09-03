# Välkommen 👋

[![release-badge]][release]&nbsp;[![license-badge]][license]&nbsp;[![contributions-badge]][contributions]&nbsp;[![semantic-release-badge]][semantic-release]&nbsp;[![crowdin-badge]][crowdin]&nbsp;[![discord-badge]][discord]&nbsp;[![stars-badge]][stars]

Castopod är en gratis och öppen plattform för podcastvärd som är avsedd för podcastvärdarna som vill utbyta och interagera med sin publik.

Castopod är lätt att installera och har utformats med hjälp av  [CodeIgniter4](https://codeigniter.com/), en kraftfull PHP-ram i mycket liten skala.

<div class="flex items-center">
  <a href="/fr/getting-started/install" class="inline-flex items-center px-4 py-2 mx-auto font-semibold text-center text-white rounded-full shadow gap-x-1 bg-pine-500 hover:no-underline hover:bg-pine-600">Installera  <svg viewBox="0 0 24 24" width="1em" height="1em" class="text-xl text-pine-200"><path fill="currentColor" d="m16.172 11-5.364-5.364 1.414-1.414L20 12l-7.778 7.778-1.414-1.414L16.172 13H4v-2z"></path></svg></a>
</div>

## Funktioner

- 🌱 &nbsp;Fri, gratis och öppen källkod (licens AGPL v3)
- 🔐 &nbsp;Fokuserar på data suveränitet: ditt innehåll, din publik och dina statistik är din och din ensam
- 🪄&nbsp;Podcasting 2.0-funktioner: GUID, låsning, transkriptioner, finansiering, kapitel, geolokalisering, deltagare, ljudklipp...
- 💬 &nbsp;Inbyggt socialt nätverk:
  - 🚀 &nbsp;Castopod ingår i Fédivers, ett decentraliserat socialt nätverk
  - ❤️ &nbsp;Skapa och dela inlägg, favoritmarkera avsnitt och lägg kommentarer till dem
- 📈 &nbsp;Inbyggda statistik:
  - ⚖️ &nbsp;Conform GDPR / CCPA / LGPD
  - 🪙&nbsp;Mätning av IABv2 publik
  - 🏡 &nbsp;Inbyggda upprättelser, inga medlingstjänster
- 📢 &nbsp;Inbyggda marknadsföringsverktyg:
  - ✅ &nbsp;Klart för SEO (open-graph-metataggar, JSON-LD...)
  - 📱 &nbsp;PWA: Install som fristående app
  - 🎨 &nbsp;Anpassningsbara temafärger
  - 🎬 &nbsp;Skapa videoklipp som är klara för att delas från avsnitten
  - 🔉 &nbsp;Skapa ljudklipp
  - ▶️ &nbsp;Bädda in dina avsnitt på alla webbplatser
- 💸 &nbsp;Monetisering:
  - 🔗 &nbsp;Finansieringslänkar
  - 📲 &nbsp;Annons “lyssna-till-klick”
  - 🤝 &nbsp;value4value / WebMonetization
  - 💎 &nbsp;Premium-poddar
- 📡&nbsp;Publicera dina avsnitt överallt med RSS:
  - 📱 &nbsp;På alla indexer och appar: Podcast Index, Podcasts Apple, Spotify, Google Podcasts, Deezer, Podcast Addict, Podfriend...
  - ⚡ så publicerade dina avsnitt med WebSub
- 📥 &nbsp;Importera podd: flytta din befintliga podcast till Castopod
- 📤 &nbsp;Flytta din podcast till en annan värd
- 🔀 &nbsp;Multi-Mandant: Värd så många poddar du vill
- 👥 &nbsp;Multi-Användare: Lägg till redaktörer och definiera deras befogenheter
- 🌎 &nbsp;i18n-stöd: Översatt till engelska, franska, polska, tyska, portugisiska, brasilianska, spanska... och
  [mer i framtiden](https://translate.castopod.org)!

## Varför Castopod?

Podcasting ekosystemet är av naturen decentraliserat: du kan skapa din podcast som en RSS-fil, publicera den på webben och få den delad överallt online.

Det är faktiskt en av de få medier som har stannat på detta sätt under lång tid.

I takt med att användningen utvecklas blir det fler och fler människor som engagerar sig i poddar: antingen är det skapare som hittar nya sätt att dela sina idéer, eller lyssnare som letar efter bättre innehåll.

Med podcasting som används alltmer försöker vissa företag att flytta den mot ett mer kontrollerat och centraliserat medium.

Castopod skapades för att erbjuda ett öppet och hållbart alternativ för att vara värd för dina poddar, och främjar decentralisering för att säkerställa att podcasters kreativitet kan uttryckas.

Detta projekt drivs av open source-gruppen, och specifikt av volontärerna inom [Fediverse](https://fediverse.party/en/fediverse/) och [Podcasting 2.0](https://podcastindex.org/).

## Jämförelse med andra lösningar

Vi tror att ingen lösning är rätt för alla, det beror mycket på dina behov. Så här är jämförelser med andra verktyg för att hjälpa dig att avgöra om Castopod är rätt för dig.

### Castopod vs Wordpress

Castopod kallas ofta "Wordpress för podcasts" på grund av likheterna mellan de två. På vissa sätt är detta sant. Faktum är att Castopod har fått mycket inspiration av WordPress-ekosystemet, sett enkelheten att anamma det från samhället och antal webbplatser som kör&nbsp;det.

Precis som Wordpress är Castopod gratis och open source, byggt med PHP med en MySQL-databas och paketerat på ett sätt som gör att du enkelt kan installera det på de flesta webbservrar.

Wordpress är ett bra sätt att skapa din webbplats och utöka den med plugins för att få det du vill ha. Det är ett fullfjädrat CMS som hjälper dig att få vilken typ av webbplats som helst online.

Å andra sidan är Castopod avsett att hantera specifikt podcastvärdbehovet, genom att fokusera på podcasting och inget annat. Du behöver inga plugins för att komma igång med din podcast&nbsp;journey.

Detta gör det möjligt att optimera processerna som är specifika för podcasting: från skapandet av dina poddar och publiceringen av nya avsnitt ända till sändning, marknadsföring och analys.

Beroende på dina behov kan Wordpress och Castopod till och med leva sida vid sida, eftersom de delar samma krav!

### Castopod vs Funkwhale

Funkwhale är en självhostad, modern fri och öppen musikserver. Precis som Castopod, är Funkwhale på fediverse, ett decentraliserat socialt nätverk som tillåter interoperabilitet mellan de två.

Funkwhale byggdes ursprungligen runt musik. Och senare, när projektet utvecklades, introducerades möjligheten att vara värd för poddar.

Till skillnad från Funkwhale har Castopod utformats och byggts runt podcasting uteslutande. Detta gör att det är enklare att implementera funktioner som är relaterade till podcasting-ekosystemet, såsom podcasting 2.0-funktioner (transkriptioner, kapitel, platser, personer,...).

Så du bör förmodligen använda Funkwhale om du vill hålla din musik, och använda Castopod om du vill hålla dina poddar.

### Castopod vs Andra podcastvärdar

Det finns många lösningar för dig att vara värd för dina poddar, varav några är riktigt bra och [många](https://podcastindex.org/apps) hoppar på podcasting 2.0 spårvagnen precis som Castopod!

Var och en av dessa lösningar skiljer sig från varandra, och du kan jämföra med [listan över funktioner](#features).

Det sagt så finns det två huvudsakliga skillnader jämfört med andra podcastlösningar:

- Castopod kan vara självhostat och är den enda lösningen som låter dig behålla full kontroll över vad du producerar. Å andra sidan, eftersom det är öppen källkod, har du möjligheten att modifiera det fritt.

- Castopod är den enda lösningen som idag integrerar både ett decentraliserat socialt nätverk med ActivityPub och "Podcasting 2.0"-funktioner, vilket minskar klyftan mellan de två.

## Bidra

Älskar du Castopod och vill hjälpa till? Ta en titt på följande dokumentation för att komma igång. .

### Uppförandekod

Castopod har antagit en uppförandekod som vi förväntar oss att projektets deltagare följer. Läs 
[Uppförandekoden](https://code.castopod.org/adaures/castopod/-/blob/beta/CODE_OF_CONDUCT.md)
så att du kan förstå vilka handlingar som kommer att tolereras och inte.

### Bidragsguide

Läs vår [bidragsguide](./contributing/guidelines.md) för att lära dig om vår utvecklingsprocess, hur du föreslår buggfixar och förbättringar, och hur du bygger och testar dina ändringar till Castopod.

## Bidragsgivare ✨

En stor tack går till dessa underbara personer
([emoji-teckenförklaring](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/yassinedoghri"><img src="https://code.castopod.org/uploads/-/system/user/avatar/3/avatar.png?s=100" width="100px;" alt="Yassine Doghri"/><br /><sub><b>Yassine Doghri</b></sub></a><br /><a href="https://code.castopod.org/adaures/castopod/commits/master" title="Code">💻</a> <a href="https://code.castopod.org/adaures/castopod/issues?author_username=yassinedoghri" title="Bug reports">🐛</a> <a href="https://code.castopod.org/adaures/castopod/commits/master" title="Documentation">📖</a> <a href="https://code.castopod.org/adaures/castopod/merge_requests?scope=all&state=all&approver_usernames[]=yassinedoghri" title="Reviewed Pull Requests">👀</a> <a href="#maintenance-yassinedoghri" title="Maintenance">🚧</a> <a href="#content-yassinedoghri" title="Content">🖋</a> <a href="#design-yassinedoghri" title="Design">🎨</a> <a href="#a11y-yassinedoghri" title="Accessibility">️️️️♿️</a> <a href="https://translate.castopod.org" title="Translation">🌍</a> <a href="#question-yassinedoghri" title="Answering Questions">💬</a> <a href="#mentoring-yassinedoghri" title="Mentoring">🧑‍🏫</a> <a href="#infra-yassinedoghri" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="#ideas-yassinedoghri" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-yassinedoghri" title="Project Management">📆</a> <a href="https://blog.castopod.org/author/yassinedoghri/" title="Blogposts">📝</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://code.castopod.org/benjamin"><img src="https://code.castopod.org/uploads/-/system/user/avatar/2/avatar.png?s=100" width="100px;" alt="Benjamin Bellamy"/><br /><sub><b>Benjamin Bellamy</b></sub></a><br /><a href="https://code.castopod.org/adaures/castopod/commits/master" title="Code">💻</a> <a href="https://code.castopod.org/adaures/castopod/issues?author_username=benjamin" title="Bug reports">🐛</a> <a href="https://code.castopod.org/adaures/castopod/merge_requests?scope=all&state=all&approver_usernames[]=benjamin" title="Reviewed Pull Requests">👀</a> <a href="#content-benjamin" title="Content">🖋</a> <a href="https://translate.castopod.org" title="Translation">🌍</a> <a href="#question-benjamin" title="Answering Questions">💬</a> <a href="#infra-benjamin" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="#ideas-benjamin" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://blog.castopod.org/author/benjamin-bellamy/" title="Blogposts">📝</a> <a href="#projectManagement-benjamin" title="Project Management">📆</a> <a href="#talk-benjamin" title="Talks">📢</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/ola-hn"><img src="https://castopod.org/assets/images/castopod-avatar.jpg?s=100" width="100px;" alt="Ola Hneini"/><br /><sub><b>Ola Hneini</b></sub></a><br /><a href="https://code.castopod.org/adaures/castopod/commits/master" title="Code">💻</a> <a href="https://code.castopod.org/adaures/castopod/merge_requests?scope=all&state=all&approver_usernames[]=ola" title="Reviewed Pull Requests">👀</a> <a href="https://code.castopod.org/adaures/castopod/commits/master" title="Documentation">📖</a> <a href="#maintenance-ola" title="Maintenance">🚧</a> <a href="#question-ola" title="Answering Questions">💬</a> <a href="#ideas-ola" title="Ideas, Planning, & Feedback">🤔</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/ubermuda"><img src="https://castopod.org/assets/images/castopod-avatar.jpg?s=100" width="100px;" alt="Jérôme Jutteau"/><br /><sub><b>Jérôme Jutteau</b></sub></a><br /><a href="https://code.castopod.org/adaures/castopod/commits/master" title="Code">💻</a> <a href="#infra-ubermuda" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="https://code.castopod.org/adaures/castopod/commits/master" title="Documentation">📖</a> <a href="https://translate.castopod.org" title="Translation">🌍</a> <a href="#ideas-ubermuda" title="Ideas, Planning, & Feedback">🤔</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/luca-wlodarz"><img src="https://castopod.org/assets/images/castopod-avatar.jpg?s=100" width="100px;" alt="Luca Wlodarz"/><br /><sub><b>Luca Wlodarz</b></sub></a><br /><a href="https://translate.castopod.org" title="Translation">🌍</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://code.castopod.org/jmjurado"><img src="https://castopod.org/assets/images/castopod-avatar.jpg?s=100" width="100px;" alt="Javier M. Jurado"/><br /><sub><b>Javier M. Jurado</b></sub></a><br /><a href="https://code.castopod.org/adaures/castopod/issues?author_username=jmjurado" title="Bug reports">🐛</a> <a href="#ideas-jmjurado" title="Ideas, Planning, & Feedback">🤔</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://code.castopod.org/ajh992"><img src="https://castopod.org/assets/images/castopod-avatar.jpg?s=100" width="100px;" alt="AJ Hereford"/><br /><sub><b>AJ Hereford</b></sub></a><br /><a href="https://code.castopod.org/adaures/castopod/issues?author_username=ajh992" title="Bug reports">🐛</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

Detta projekt följer [all-contributors](https://github.com/all-contributors/all-contributors) specifikationen. Bidrag av alla slag välkomnas!

## Kontakta oss

Du kan nå oss för hjälp eller om du har några frågor på:

- [Discord](https://castopod.org/discord) (för att prata direkt med utvecklarna och gemenskapen)
- [Ärendehantering](https://code.castopod.org/adaures/castopod/-/issues) (för begäran om ny funktion eller felrapporter)

Alternativt kan du följa oss på sociala medieplattformar för att få nyheter om Castopod:

- [podlibre.social](https://podlibre.social/@Castopod) (Mastodon-instans)
- [Twitter](https://twitter.com/castopod)
- [LinkedIn](https://linkedin.com/company/castopod)
- [Facebook](https://www.facebook.com/castopod)

## Sponsorer

Den pågående utvecklingen av Castopod görs möjlig tack vare våra sponsorer. Om du vill hjälpa till, överväg att [stödja Castopods utveckling](https://opencollective.com/castopod/contribute).

<div class="flex flex-wrap gap-x-16 gap-y-8">
  <a href="https://adaures.com/" target="_blank" rel="noopener noreferrer"><img src="/images/sponsors/adaures.svg" alt="Ad Aures Logo" class="h-16" /></a>
  <a href="https://nlnet.nl/project/Castopod/" target="_blank" rel="noopener noreferrer"><img src="/images/sponsors/nlnet.svg" alt="NLnet Logo" class="h-16" /></a>
</div>

## Licens

[GNU Affero General Public License v3.0](https://choosealicense.com/licenses/agpl-3.0/)

Copyright © 2020-present, [Ad Aures](https://adaures.com/).
https://img.shields.io/gitlab/v/release/2?color=brightgreen&gitlab_url=https%3A%2F%2Fcode.castopod.org%2F&include_prereleases&label=release
https://img.shields.io/github/license/ad-aures/castopod?color=blue
https://img.shields.io/badge/contributions-welcome-brightgreen.svg
https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
https://img.shields.io/github/stars/ad-aures/castopod?style=social

[release]: https://code.castopod.org/adaures/castopod/-/releases
[license]: https://code.castopod.org/adaures/castopod/-/blob/beta/LICENSE.md
[contributions]: https://code.castopod.org/adaures/castopod/-/issues
[semantic-release]: https://github.com/semantic-release/semantic-release
[discord]: https://castopod.org/discord
[stars]: https://github.com/ad-aures/castopod/stargazers
[crowdin]: https://translate.castopod.org/project/castopod