---
title: Richtlinien
---

# Mitarbeit an Castopod

Liebst du Castopod und möchtest helfen? Vielen Dank, es gibt für jeden etwas zu tun!

Bitte nimm dir einen Moment Zeit, um dieses Dokument zu lesen, um den Beitragungsprozess einfach und effektiv für alle Beteiligten zu gestalten.

Die Befolgung dieser Richtlinien zeigt, dass du die Zeit der Entwickler respektierst, die dieses Open-Source-Projekt verwalten und entwickeln. Im Gegenzug sollten sie diesen Respekt erwidern, indem sie sich mit deinem Problem befassen oder Patches und Funktionen bewerten.

::: info Hinweis

**Jeder** Beitrag, der auf einem anderen Repository als dem
[Original-Repository](https://code.castopod.org/adaures/castopod) gemacht wird, wird nicht akzeptiert.

:::

## Verwendung des Issue-Trackers

Der [Issue-Tracker](https://code.castopod.org/adaures/castopod/-/issues) ist der bevorzugte Kanal für [Fehlerberichte](#bug-reports), [Funktionserweiterungen](#feature-requests) und [das Einreichen von Pull-Requests](#pull-requests).

## ⚠ Sicherheitsprobleme und Schwachstellen

Wenn du auf ein Sicherheitsproblem oder eine Schwachstelle in der Castopod-Quelle stößt, kontaktiere uns bitte direkt per E-Mail unter [security@castopod.org](mailto:security@castopod.org)

## Fehlerberichte

Ein Fehler ist ein _nachweisbares Problem_, das durch den Code im Repository verursacht wird. Gute Fehlerberichte sind äußerst hilfreich - vielen Dank!

Richtlinien für Fehlerberichte:

1. **Verwende die Issue-Suche** &mdash; überprüfe, ob der Fehler bereits gemeldet wurde.

2. **Überprüfe, ob der Fehler behoben wurde** &mdash; Versuche, ihn mit dem neuesten `main`-Zweig im Repository zu reproduzieren.

3. **Isoliere das Problem** &mdash; erstelle idealerweise eine
   [reduzierte Testfall](https://css-tricks.com/reduced-test-cases/) und ein Live-Beispiel.

Ein guter Fehlerbericht sollte keine weiteren Informationen von anderen benötigen. Bitte versuche, deinen Bericht so detailliert wie möglich zu gestalten. Was ist deine Umgebung? Welche Schritte reproduzieren den Fehler? Welchen Browser(s) und welches Betriebssystem hast du? Was würdest du als Ergebnis erwarten? Alle diese Details helfen dabei, potenzielle Fehler zu beheben.

> [Vorlagen für Fehlerberichte](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates)
> wurden für dieses Projekt erstellt. Du kannst sie nutzen, um den Richtlinien zu folgen.

## Funktionserweiterungen

Funktionserweiterungen sind willkommen. Informiere dich jedoch vorher, ob deine Idee in den Rahmen und das Ziel des Projekts passt. Es liegt an _dir_, diesen Feature-Vorschlag überzeugend zu begründen, um die Entwickler des Projekts von den Vorteilen dieser Funktion zu überzeugen. Bitte gib so viele Details und Kontext wie möglich an.

## Pull-Requests

Gute Pull-Requests - Patches, Verbesserungen, neue Funktionen - sind eine fantastische Hilfe. Sie sollten sich auf einen bestimmten Bereich konzentrieren und sollten keine nicht zusammenhängenden Commits enthalten.

**Bitte frage zuerst**, bevor du mit einem größeren Pull-Request (z. B. Implementierung von Funktionen, Refaktorisierung von Code, Portierung in eine andere Sprache) beginnst, da du sonst Gefahr läufst, viel Zeit mit etwas zu verbringen, das die Entwickler des Projekts möglicherweise nicht in das Projekt aufnehmen möchten.

Bitte halte dich an die Coding-Konventionen, die in einem Projekt verwendet werden (Einrückung, genaue Kommentare, etc.) und an alle anderen Anforderungen (wie Testabdeckung).

Das Befolgen des folgenden Prozesses ist der beste Weg, um deine Arbeit in das Projekt aufzunehmen:

1. [Fork](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) das Projekt, klone deinen Fork und konfiguriere die Remotes:

```bash
# Klone deinen Fork des Repos in das aktuelle Verzeichnis
git clone https://code.castopod.org/<dein-benutzername>/castopod.git

# Navigiere zum neu geklonten Verzeichnis
cd castopod

# Weise dem originalen Repo einen Remote namens "upstream" zu
git remote add upstream https://code.castopod.org/adaures/castopod.git
```

2. Wenn du vor einiger Zeit geklont hast, hole dir die neuesten Änderungen von upstream:

```bash
git checkout main
git pull upstream main
```

3. Erstelle einen neuen Topic-Branch (aus dem `main`-Zweig), um dein Feature, deine Änderung oder Behebung zu enthalten:

```bash
git checkout -b <topic-branch-name>
```

4. Commite deine Änderungen in logischen Teilen. Bitte halte dich an diese
   [Git Commit Message-Richtlinien](https://conventionalcommits.org/), da dein
   Code sonst wahrscheinlich nicht in das Hauptprojekt integriert wird. Verwende die
   [interaktive Rebase-Funktion von Git](https://help.github.com/articles/about-git-rebase/),
   um deine Commits vor ihrer Veröffentlichung aufzuräumen.

5. Führe (rebase) den Upstream-Entwicklungszweig lokal in deinen Topic-Branch zusammen:

```bash
git pull [--rebase] upstream main
```

6. Pushe deinen Topic-Branch in deinen Fork:

```bash
git push origin <topic-branch-name>
```

7. [Öffne einen Pull-Request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html#new-merge-request-from-a-fork)
   mit einem klaren Titel und einer Beschreibung.

**WICHTIG**: Durch das Einreichen eines Patches stimmst du zu, dass die Projektbesitzer dein Werk unter den Bedingungen der
[GNU AGPLv3](https://code.castopod.org/adaures/castopod/-/blob/main/LICENSE) lizenzieren.

## Richtlinien für die Zusammenarbeit

Es gibt ein paar grundlegende Regeln, um die hohe Qualität des Projekts sicherzustellen:

- Bevor ein PR gemerged wird, benötigt er mindestens zwei Zustimmungen von den Mitwirkenden, es sei denn, es handelt sich um eine architektonische Änderung, ein großes Feature usw. In diesem Fall müssen mindestens 50% des Kernteams zustimmen, es zu mergen, wobei jedes Teammitglied ein absolutes Vetorecht hat. (d.h. jeder einzelne kann jeden PR blockieren)
- Ein PR sollte mindestens zwei Tage lang geöffnet bleiben, bevor er gemerged wird (gilt nicht für triviale Beiträge wie das Beheben eines Tippfehlers). Auf diese Weise hat jeder ausreichend Zeit, ihn zu prüfen.

Es ist immer willkommen, über diese Richtlinie zu diskutieren und Verbesserungsvorschläge zu machen.