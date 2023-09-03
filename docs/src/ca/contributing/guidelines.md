---
title: Pautas
---

# Contribuir a Castopod

Estimes Castopod i vols ajudar? Moltes gràcies, hi ha moltes coses per fer per a tothom!

Si us plau, prende't un moment per revisar aquest document per fer que el procés de contribució sigui fàcil i efectiu per a totes les parts implicades.

Seguint aquestes pautas, ajudes a comunicar el teu respecte pel temps dels desenvolupadors que gestionen i desenvolupen aquest projecte de codi obert. A canvi, ells han de mostrar aquest respecte en atendre els teus problemes o avaluar les correccions i les noves funcionalitats.

::: info Nota

**Qualsevol** contribució realitzada en un repositori diferent al
[repositori original](https://code.castopod.org/adaures/castopod) no serà
acceptada.

:::

## Utilitzar el seguiment de problemes

El [seguiment de problemes](https://code.castopod.org/adaures/castopod/-/issues) és el canal preferit per a informar de
[informes de errors](#informes-de-errors),
[sol·licituds de funcionalitats](#sol·licituds-de-funcionalitats) i
[enviar sol·licituds de pull](#sol·licituds-de-pull).

## ⚠️ Problemes de seguretat i vulnerabilitats

Si et trobes amb algun problema de seguretat o vulnerabilitat en el codi font de Castopod, contacta'ns directament per correu electrònic a
[security@castopod.org](mailto:security@castopod.org).

## Informes de errors

Un error és un _problema demostrable_ causat pel codi del repositori. Els informes de errors bons són extremadament útils, gràcies!

Pautas per als informes de errors:

1. **Utilitza la cerca de problemes** &mdash; comprova si el problema ja ha estat
  reportat.

2. **Verifica si el problema ha estat resolt** &mdash; intenta reproduir-lo utilitzant
  l'últim `main` del repositori.

3. **Aïlla el problema** &mdash; idealment, crea un
  [cas de prova reduït](https://css-tricks.com/reduced-test-cases/) i un exemple en viu.

Un bon informe d'errors no hauria de deixar als altres necessitant preguntar-te més
informació. Intenta ser tan detallat com sigui possible en el teu informe. Quin és el teu entorn? Quins passos reproducirien el problema? Quin navegador(s) i sistema operatiu experimenten el problema? Què esperaries que fos el resultat? Tots aquests detalls ajudaran a les persones a solucionar qualsevol error potencial.

> Han estat creats [models d'incidències](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates)
> per aquest projecte. Pots utilitzar-los per ajudar-te a seguir aquestes pautes.

## Sol·licituds de funcionalitats

Les sol·licituds de funcionalitats són benvingudes. Però dedica un moment a comprovar si la teva idea encaixa amb l'abast i els objectius del projecte. Depèn de _tu_ de fer un cas sòlid per convèncer els desenvolupadors del projecte de les virtuts d'aquesta funcionalitat. Si us plau, proporciona tanta informació i context com sigui possible.

## Sol·licituds de pull

Les sol·licituds de pull bones: correccions, millores, noves funcionalitats, són una gran ajuda. Han de romandre centrades en l'abast i evitar contindre commits no relacionats.

**Si us plau, pregunta primer** abans d'emprendre qualsevol sol·licitud de pull important (per exemple, implementar funcionalitats, refactoritzar el codi, portar-lo a un llenguatge diferent), sinó et jugues de treballar molt temps en alguna cosa que els desenvolupadors del projecte poden no voler fusionar.

Si us plau, adhereix-te a les convencions de codificació utilitzades en tot el projecte (indentació, comentaris precisos, etc.) i a qualsevol altre requisit (com cobertura de proves).

Adherir-te al següent procés és la millor manera d'incloure la teva feina al projecte:

1. [Fork](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) del projecte,
   clona la teva forquilla i configura els remots:

```bash
# Clona la teva forquilla del repositori a l'actual directori
git clone https://code.castopod.org/<el_teunom_usuari>/castopod.git

# Navega fins al directori clonat més nou
cd castopod

# Assigna el repositori original a un remot anomenat "upstream"
git remote add upstream https://code.castopod.org/adaures/castopod.git
```

2. Si vas fer aquesta clonació fa temps, obtén els canvis més recents de l'origen:

```bash
git checkout main
git pull upstream main
```

3. Crea una nova branca de tema (d'una branca `main`) per contenir la teva funcionalitat,
  canvi o correcció:

```bash
git checkout -b <nom-branca-tema>
```

4. Fa els teus canvis en trossos lògics. Si us plau, segueix aquestes
  [pautes de missatge de confirmació de Git](https://conventionalcommits.org/), o el teu
  codi és poc probable que es fusioni amb el projecte principal. Utilitza la
  característica de
  [rebase interactiu de Git](https://help.github.com/articles/about-git-rebase/)
  per netejar les teves confirmacions abans de fer-les públiques.

5. Fusiona localment (o rebase) la branca de desenvolupament d'origen amb la teva branca de tema:

```bash
git pull [--rebase] upstream main
```

6. Puja la teva branca de tema a la teva forquilla:

```bash
git push origin <nom-branca-tema>
```

7. [Obre una sol·licitud de pull](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html#new-merge-request-from-a-fork)
   amb un títol clar i una descripció.

**IMPORTANT**: En enviar un patch, acceptes permetre als propietaris del projecte
llicenciar el teu treball sota els termes de
[GNU AGPLv3](https://code.castopod.org/adaures/castopod/-/blob/main/LICENSE).

## Pautas de col·laboració

Hi ha algunes regles bàsiques per assegurar una alta qualitat del projecte:

- Abans de fusionar, una sol·licitud de pull requereix com a mínim dues aprovacions dels col·laboradors
  a no ser que sigui un canvi arquitectònic, una funcionalitat important, etc. Si ho és, aleshores
  ha de ser aprovada per almenys el 50% de l'equip principal, amb dret a veto complet. (és a dir, cada membre pot bloquejar qualsevol PR)
- Una sol·licitud de pull ha de romandre oberta com a mínim dos dies abans de fusionar (no s'aplica
  per aportacions banals com arreglar una errada tipogràfica). D'aquesta manera, tothom té prou
  temps per revisar-la.

Sempre ets benvingut a discutir i proposar millores per aquestes pautes.