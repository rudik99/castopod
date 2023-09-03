---
title: Aggiornamento
sidebarDepth: 3
---

# Come installare Castopod?

Dopo aver installato Castopod, puoi aggiornare la tua istanza all'ultima versione per usufruire delle ultime funzionalità ✨, dei bug fix 🐛 e delle miglioramenti delle prestazioni ⚡.

## Istruzioni per l'aggiornamento

0. ⚠️ Prima di effettuare un aggiornamento, ti consigliamo vivamente di fare un backup dei tuoi file Castopod e del tuo database.

   - vedi
     [Dovrei fare un backup prima di aggiornare?](#should-i-make-a-backup-before-updating)

1. Vai alla
   [pagina delle release](https://code.castopod.org/adaures/castopod/-/releases) e
   verifica se la tua istanza è aggiornata all'ultima versione di Castopod.

   - vedi
     [Dove posso trovare la versione di Castopod?](#where-can-i-find-my-castopod-version)

2. Scarica l'ultima versione denominata `Pacchetto di Castopod`, puoi scegliere tra gli archivi `zip` o `tar.gz`.

   - ⚠️ Assicurati di scaricare il Pacchetto di Castopod e **NON** il codice sorgente
   - Nota che puoi anche scaricare l'ultimo pacchetto da
     [castopod.org](https://castopod.org/)

3. Sul tuo server:

   - Elimina tutti i file tranne `.env` e `public/media`
   - Copia i nuovi file dal pacchetto scaricato sul tuo server

     ::: info Nota

     Potrebbe essere necessario reimpostare i permessi dei file come
     fatto durante il processo di installazione. Vedi
     [Security Concerns](./security.md).

     :::

4. Aggiorna lo schema del database dalla pagina `Castopod Admin` > `About` o eseguendo:

   ```bash
   php spark castopod:database-update
   ```

5. Cancella la cache dalla pagina `Castopod Admin` > `Settings` > `general` >
   `Housekeeping`
6. ✨ Goditi la tua nuova istanza, hai finito!

::: info Nota

Le versioni potrebbero essere accompagnate da istruzioni di aggiornamento
aggiuntive (vedi la
[page delle release notes](https://code.castopod.org/adaures/castopod/-/releases)).

- vedi
  [Non ho aggiornato la mia istanza per molto tempo... Cosa dovrei fare?](#je-nai-pas-mis-à-jour-mon-instance-depuis-longtemps-que-devrais-je-faire)

:::

## Aggiornamenti completamente automatizzati

> Prossimamente... 👀

## Domande frequenti (FAQ)

### Dove posso trovare la versione di Castopod?

Vai al pannello di amministrazione di Castopod, la versione viene visualizzata in
basso a sinistra.

Puoi anche trovare la versione nell'applicazione
`> Configuration > Constantes.php` cartella.

### Non ho aggiornato la mia istanza per molto tempo... Cosa dovrei fare?

Nessun problema! Basta ottenere l'ultima versione come descritto
sopra. Quando esegui le istruzioni per l'aggiornamento (4), eseguile
sequenzialmente, dalla versione più vecchia alla più recente.

> Dovresti fare un backup della tua istanza in base alla data dell'ultimo aggiornamento di Castopod.

Ad esempio, se sei alla versione `v1.0.0-alpha.42` e desideri aggiornare alla
`v1.0.0-beta.1`:

0. (fortemente consigliato) Esegui un backup dei tuoi file e del tuo database.

1. Scarica l'ultima versione, sovrascrivi i file mantenendo
   `.env` e `public/media`.

2. Esegui le istruzioni per l'aggiornamento uno dopo l'altro (dal più vecchio al più recente).

3. ✨ La tua nuova istanza è pronta!

### Devo fare un backup prima di aggiornare?

Ti consigliamo di farlo, per non perdere tutto in caso di problemi!

In generale, ti consigliamo di creare regolarmente un backup dei tuoi file Castopod e del tuo database per evitare di perdere tutto...