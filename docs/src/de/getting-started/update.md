---
title: Update
sidebarDepth: 3
---

# Wie installiere ich Castopod?

Nach der Installation von Castopod können Sie Ihre Instanz auf die neueste Version aktualisieren, um von den neuesten Funktionen ✨, Bugfixes 🐛 und Leistungsverbesserungen ⚡ zu profitieren.

## Update-Anweisungen

0. ⚠️ Bevor Sie ein Update durchführen, empfehlen wir Ihnen dringend, Ihre Castopod-Dateien und die Datenbank zu sichern.

   - siehe
     [Should I make a backup before updating?](#should-i-make-a-backup-before-updating)

1. Gehen Sie zur
   [Releases-Seite](https://code.castopod.org/adaures/castopod/-/releases) und
   prüfen Sie, ob Ihre Instanz mit der neuesten Castopod-Version aktuell ist.

   - siehe
     [Where can I find my Castopod version?](#where-can-i-find-my-castopod-version)

2. Laden Sie das neueste Release-Paket mit dem Namen "Castopod Package" herunter. Sie können zwischen den Archiven `zip` oder `tar.gz` wählen.

   - ⚠️ Stellen Sie sicher, dass Sie das Castopod Package herunterladen und **NICHT** den Source Code.
   - Beachten Sie, dass Sie das neueste Paket auch von
     [castopod.org](https://castopod.org/) herunterladen können.

3. Auf Ihrem Server:

   - Löschen Sie alle Dateien außer `.env` und `public/media`.
   - Kopieren Sie die neuen Dateien aus dem heruntergeladenen Paket auf Ihren Server.

     ::: info Hinweis

     Möglicherweise müssen Sie die Dateiberechtigungen neu festlegen, wie beim Installationsprozess bereits durchgeführt. Siehe
     [Sicherheitshinweise](./security.md).

     :::

4. Aktualisieren Sie das Datenbankschema über die Seite `Castopod Admin` > `About` oder führen Sie folgenden Befehl aus:

   ```bash
   php spark castopod:database-update
   ```

5. Leeren Sie Ihren Cache über `Castopod Admin` > `Settings` > `general` >
   `Housekeeping`.
6. ✨ Genießen Sie Ihre neue Instanz, Sie sind fertig!

::: info Hinweis

Es kann sein, dass den Versionen zusätzliche Update-Anweisungen beigefügt werden (siehe
[Releases-Seite](https://code.castopod.org/adaures/castopod/-/releases)).

- siehe
  [Ich habe meine Instanz seit langer Zeit nicht mehr aktualisiert ... Was sollte ich tun?](#je-nai-pas-mis-à-jour-mon-instance-depuis-longtemps-que-devrais-je-faire)

:::

## Vollständig automatisierte Updates

> Kommt bald... 👀

## Häufig gestellte Fragen (FAQ)

### Wo finde ich meine Castopod-Version?

Gehen Sie zu Ihrem Castopod-Administrationspanel. Die Version wird unten links angezeigt.

Sie können die Version auch in der Anwendung unter
`> Configuration > Constantes.php`-Ordner finden.

### Ich habe meine Instanz seit langer Zeit nicht mehr aktualisiert ... Was sollte ich tun?

Kein Problem! Holen Sie sich einfach die neueste Version wie oben beschrieben. Wenn Sie die Update-Anweisungen (Punkt 4) ausführen, starten Sie sie der Reihe nach von der ältesten zur neuesten Version.

> Sie sollten Ihre Instanz entsprechend dem Datum Ihres letzten Castopod-Updates sichern.

Zum Beispiel, wenn Sie auf `v1.0.0-alpha.42` sind und auf `v1.0.0-beta.1` aktualisieren möchten:

0. (stark empfohlen) Sichern Sie Ihre Dateien und Datenbank.

1. Laden Sie die neueste Version herunter und ersetzen Sie Ihre Dateien, wobei Sie `.env` und `public/media` beibehalten.

2. Führen Sie die Update-Anweisungen einzeln aus (von der ältesten zur neuesten Version).

3. ✨ Ihre neue Instanz ist bereit!

### Sollte ich vor dem Update eine Sicherungskopie erstellen?

Wir empfehlen Ihnen, dies zu tun, um möglichen Datenverlust zu vermeiden!

Im Allgemeinen empfehlen wir Ihnen, regelmäßig Sicherungen Ihrer Castopod-Dateien und Ihrer Datenbank zu erstellen, um keine Daten zu verlieren...