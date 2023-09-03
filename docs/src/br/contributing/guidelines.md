---
title: Tregerioù
---

# O rei davet da Castopod

Amoureux de Castopod et souhaitez aider ? Merci beaucoup, il y a quelque chose à faire pour tout le monde !

Prenez un moment pour parcourir ce document afin de rendre le processus de contribution facile et efficace pour tous les participants.

Le respect de ces directives contribue à communiquer que vous respectez le temps des développeurs qui gèrent et développent ce projet open source. En retour, ils devraient témoigner de ce respect en traitant votre problème ou en évaluant les correctifs et les fonctionnalités.

::: info Note

Toute contribution faite sur un dépôt autre que
[le dépôt original](https://code.castopod.org/adaures/castopod) ne sera pas acceptée.

:::

## Utilisation du suiveur d'incidents

Le [suiveur d'incidents](https://code.castopod.org/adaures/castopod/-/issues) est le canal privilégié pour [les rapports de bugs](#rapports-de-bugs), [les demandes de fonctionnalités](#demandes-de-fonctionnalités) et [la soumission de demandes d'intégration](#demandes-d'intégration).

## ⚠️ Problèmes de sécurité et vulnérabilités

Si vous rencontrez un problème de sécurité ou une vulnérabilité dans la source de Castopod, veuillez nous contacter directement par email à l'adresse [security@castopod.org](mailto:security@castopod.org).

## Rapports de bugs

Un bug est un problème _démontrable_ causé par le code du dépôt. Les bons rapports de bugs sont extrêmement utiles - merci !

Directives pour les rapports de bugs :

1. **Utilisez la recherche d'incidents** - vérifiez si le problème a déjà été rapporté.

2. **Vérifiez si le problème a été résolu** - essayez de le reproduire en utilisant la dernière branche `main` du dépôt.

3. **Isolez le problème** - idéalement, créez un
   [cas de test réduit](https://css-tricks.com/reduced-test-cases/) et un exemple en direct.

Un bon rapport de bug ne doit pas laisser les autres vous demander plus d'informations. Essayez d'être aussi détaillé que possible dans votre rapport. Quel est votre environnement ? Quelles sont les étapes pour reproduire le problème ? Quel(s) navigateur(s) et système(s) d'exploitation rencontrent le problème ? Qu'attendez-vous comme résultat ? Tous ces détails aideront les gens à corriger tout bug potentiel.

> Des [modèles d'incidents](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates) ont été créés pour ce projet. Vous pouvez les utiliser pour vous aider à suivre ces directives.

## Demandes de fonctionnalités

Les demandes de fonctionnalités sont les bienvenues. Mais prenez un moment pour savoir si votre idée correspond au cadre et aux objectifs du projet. C'est à vous de fournir suffisamment de détails et de contexte pour convaincre les développeurs du projet des mérites de cette fonctionnalité. Veuillez fournir autant de détails et de contexte que possible.

## Demandes d'intégration

Les bonnes demandes d'intégration - correctifs, améliorations, nouvelles fonctionnalités - sont d'une grande aide. Elles doivent rester centrées sur l'objectif et éviter de contenir des commits non liés.

**Veuillez demander d'abord** avant de vous lancer dans une demande d'intégration importante (par exemple, la mise en œuvre de fonctionnalités, la refonte du code, le portage vers un autre langage), sinon vous risquez de passer beaucoup de temps à travailler sur quelque chose que les développeurs du projet ne souhaitent peut-être pas fusionner dans celui-ci.

Veuillez respecter les conventions de codage utilisées dans tout projet (indentation, commentaires précis, etc.) ainsi que toutes les autres exigences (telles que la couverture des tests).

Le respect du processus suivant est le meilleur moyen d'intégrer votre travail dans le projet :

1. [Faites un Fork](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) du projet, clonez votre fork et configurez les remotes :

```bash
# Clonez votre fork du dépôt dans le répertoire courant
git clone https://code.castopod.org/<your-username>/castopod.git

# Allez dans le répertoire nouvellement cloné
cd castopod

# Attribuez le dépôt d'origine à un remote appelé "upstream"
git remote add upstream https://code.castopod.org/adaures/castopod.git
```

2. Si vous avez cloné il y a un certain temps, récupérez les derniers changements depuis l'amont :

```bash
git checkout main
git pull upstream main
```

3. Créez une nouvelle branche de sujet (à partir de la branche `main`) pour contenir votre fonctionnalité, votre modification ou votre correction :

```bash
git checkout -b <nom-de-branche-de-sujet>
```

4. Committez vos modifications en morceaux logiques. Veuillez respecter ces
   [directives de message de commit Git](https://conventionalcommits.org/) ou votre code risque de ne pas être fusionné dans le projet principal. Utilisez la
   fonction [rebase interactif de Git](https://help.github.com/articles/about-git-rebase/) pour nettoyer vos commits avant de les rendre publics.

5. Fusionnez localement (ou rebase) la branche de développement en amont dans votre branche de sujet :

```bash
git pull [--rebase] upstream main
```

6. Poussez votre branche de sujet vers votre fork :

```bash
git push origin <nom-de-branche-de-sujet>
```

7. [Ouvrez une demande d'intégration](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html#new-merge-request-from-a-fork) avec un titre et une description clairs.

**IMPORTANT** : En soumettant un correctif, vous acceptez de permettre aux propriétaires du projet de licencier votre travail selon les termes de la [GNU AGPLv3](https://code.castopod.org/adaures/castopod/-/blob/main/LICENSE).

## Directives de collaboration

Il y a quelques règles de base pour assurer une haute qualité du projet :

- Avant la fusion, une PR doit recevoir au moins deux approbations des collaborateurs, à moins qu'il ne s'agisse d'un changement architectural, d'une grande fonctionnalité, etc. Dans ces cas, au moins 50% de l'équipe de base doivent être d'accord pour la fusionner, chaque membre de l'équipe ayant un droit de veto complet. (c'est-à-dire que chacun peut bloquer n'importe quelle PR)
- Une PR doit rester ouverte pendant au moins deux jours avant d'être fusionnée (cela ne s'applique pas aux contributions triviales comme la correction d'une faute de frappe). De cette façon, chacun a suffisamment de temps pour l'examiner.

Vous êtes toujours les bienvenus pour discuter et proposer des améliorations à cette directive.