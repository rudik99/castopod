---
title: Linee guida
---

# Contribuire a Castopod

Ami Castopod e vuoi aiutare? Grazie mille, c'è qualcosa da fare per tutti!

Si prega di prendere un momento per leggere questo documento al fine di rendere il processo di contribuzione facile ed efficace per tutti coloro coinvolti.

Seguire queste linee guida aiuta a comunicare il rispetto del tempo dei sviluppatori che gestiscono e sviluppano questo progetto open source. In cambio, dovrebbero ricambiare questo rispetto affrontando i tuoi problemi o valutando le patch e le funzionalità.

::: info Nota

**Qualsiasi** contributo effettuato su un repository diverso dal
[repository originale](https://code.castopod.org/adaures/castopod) non verrà
accettato.

:::

## Utilizzare lo strumento di tracciamento problemi

Lo [strumento di tracciamento problemi](https://code.castopod.org/adaures/castopod/-/issues) è il
canale preferito per [segnalare bug](#segnalare-bug),
[richieste di funzionalità](#richieste-di-funzionalit) e
[inviare richieste pull](#richieste-pull).

## ⚠️ Problemi di sicurezza e vulnerabilità

Se incontri qualsiasi problema di sicurezza o vulnerabilità nel codice sorgente di Castopod,
per favore contattaci direttamente via email a
[security@castopod.org](mailto:security@castopod.org)

## Segnalazione di bug

Un bug è un _problema dimostrabile_ causato dal codice nel repository. Le segnalazioni di bug ben fatte sono estremamente utili: grazie!

Linee guida per le segnalazioni di bug:

1. **Utilizza la ricerca delle issue** – controlla se il problema è già stato segnalato.

2. **Controlla se il problema è stato risolto** – prova a riprodurlo utilizzando il branch `main` più recente nel repository.

3. **Isola il problema** – idealmente crea un
[ridotto caso di test](https://css-tricks.com/reduced-test-cases/) ed un esempio pratico.

Una buona segnalazione di bug non dovrebbe lasciare agli altri la necessità di cercarti ulteriori informazioni. Cerca di essere il più dettagliato possibile nella tua segnalazione. Quali sono le tue impostazioni? Quali passaggi riprodurranno il problema? Quali browser e sistemi operativi riscontrano il problema? Quale sarebbe l'esito atteso? Tutti questi dettagli aiuteranno le persone a risolvere eventuali bug potenziali.

> Sono stati creati dei [modelli di issue](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates) per questo progetto. Puoi utilizzarli per aiutarti a seguire queste linee guida.

## Richieste di funzionalità

Le richieste di funzionalità sono benvenute. Tuttavia, prenditi un attimo per scoprire se la tua idea si adatta allo scopo e agli obiettivi del progetto. È tuo compito convincere gli sviluppatori del progetto dei meriti di questa funzionalità. Fornisci il maggior numero di dettagli e contesto possibile.

## Richieste pull

Le richieste pull (pull request) ben fatte - patch, miglioramenti, nuove funzionalità - sono di grande aiuto. Devono rimanere focalizzate nell'ambito e evitare commit non correlati.

**Per favore chiedi prima** di intraprendere una richiesta pull significativa (ad esempio implementare funzionalità, ristrutturare il codice, portare in un'altra lingua), altrimenti rischi di dedicare molto tempo a qualcosa che gli sviluppatori del progetto potrebbero non voler integrare nel progetto.

Si prega di attenersi alle convenzioni di codifica utilizzate in tutto un progetto (indentazione, commenti precisi, ecc.) e ad ogni altro requisito (come la copertura dei test).

Attenersi al seguente processo è il modo migliore per far includere il proprio lavoro nel progetto:

1. [Forka](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) il
   progetto, clona il tuo fork e configura i remoti:

```bash
# Clona il tuo fork del repository nella directory corrente
git clone https://code.castopod.org/<your-username>/castopod.git

# Sposta nella directory appena clonata
cd castopod

# Assegna al repository originale un remoto chiamato "upstream"
git remote add upstream https://code.castopod.org/adaures/castopod.git
```

2. Se hai clonato tempo fa, ottieni gli ultimi cambiamenti dal repository upstream:

```bash
git checkout main
git pull upstream main
```

3. Crea un nuovo branch di argomento (dal ramo `main`) per contenere la tua funzionalità, modifica o correzione:

```bash
git checkout -b <nome-branch-argomento>
```

4. Fai il commit delle tue modifiche in blocchi logici. Segui queste
   [linee guida per i messaggi di commit di Git](https://conventionalcommits.org/) o il tuo
   codice difficilmente verrà integrato nel progetto principale. Utilizza la
   funzionalità di [ribase interattivo di Git](https://help.github.com/articles/about-git-rebase/) per sistemare i tuoi commit prima di renderli pubblici.

5. Esegui la fusione locale (o il rebase) del ramo dev upstream nel tuo ramo di argomento:

```bash
git pull [--rebase] upstream main
```

6. Fai push del tuo ramo di argomento nel tuo fork:

```bash
git push origin <nome-branch-argomento>
```

7. [Apri una richiesta pull](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html#new-merge-request-from-a-fork)
   con un titolo e una descrizione chiari.

**IMPORTANTE**: Inviando una patch, accetti di concedere ai proprietari del progetto il
diritto di licenziare il tuo lavoro secondo i termini della
[GNU AGPLv3](https://code.castopod.org/adaures/castopod/-/blob/main/LICENSE).

## Linee guida per la collaborazione

Ci sono poche regole di base per garantire un'alta qualità del progetto:

- Prima di effettuare la fusione, una pull request richiede almeno due approvazioni dai collaboratori a meno che non si tratti di un cambiamento architettonico, di una grande funzionalità, ecc. In tal caso, almeno il 50% del team principale deve essere d'accordo per unirlo, mentre ogni membro del team ha un pieno diritto di veto (cioè ognuno può bloccare qualsiasi pull request).
- Una pull request dovrebbe rimanere aperta per almeno due giorni prima della fusione (non si applica a contributi banali come correggere un errore di battitura). In questo modo tutti avranno abbastanza tempo per esaminarla.

Sei sempre il benvenuto per discutere e proporre miglioramenti a questa guida.