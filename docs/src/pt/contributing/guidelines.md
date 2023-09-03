---
title: Orientações
---

# Contribuir para o Castopod

Ama o Castopod e quer ajudar? Muito obrigado, há algo para fazer para todos!

Por favor, reserve um momento para ler este documento com o objetivo de tornar o processo de contribuição fácil e eficiente para todos os envolvidos.

Seguir essas orientações ajuda a comunicar que você respeita o tempo dos desenvolvedores que gerenciam e desenvolvem este projeto de código aberto. Em troca, eles devem retribuir esse respeito ao lidar com o seu problema ou avaliar correções e recursos.

::: info Nota

**Qualquer** contribuição feita em um repositório diferente do
[repositório original](https://code.castopod.org/adaures/castopod) não será aceita.

:::

## Utilizando o rastreador de problemas

O [rastreador de problemas](https://code.castopod.org/adaures/castopod/-/issues) é o canal preferido para [relatar bugs](#relatar-bugs), [solicitar recursos](#solicitar-recursos) e [enviar solicitações de mesclagem](#solicitações-de-mesclagem).

## ⚠️ Problemas de segurança e vulnerabilidades

Se encontrar algum problema de segurança ou vulnerabilidade no código-fonte do Castopod, entre em contato diretamente por e-mail em [security@castopod.org](mailto:security@castopod.org)

## Relatar bugs

Um bug é um _problema demonstrável_ causado pelo código no repositório. Relatórios de bugs detalhados são extremamente úteis - obrigado!

Orientações para relatórios de bugs:

1. **Utilize a busca de problemas** &mdash; verifique se o problema já foi relatado.

2. **Verifique se o problema foi corrigido** &mdash; tente reproduzi-lo usando o branch `main` mais recente no repositório.

3. **Isolar o problema** &mdash; idealmente, crie um [caso de teste reduzido](https://css-tricks.com/reduced-test-cases/) e um exemplo ao vivo.

Um bom relatório de bug não deve deixar que outros precisem pedir mais informações. Por favor, tente ser o mais detalhado possível em seu relatório. Qual é o seu ambiente? Quais etapas reproduzem o problema? Quais navegadores e sistemas operacionais apresentam o problema? O que você espera que seja o resultado final? Todos esses detalhes ajudarão as pessoas a corrigir eventuais bugs.

> [Modelos de problemas](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates) foram criados para este projeto. Você pode usá-los para ajudá-lo a seguir essas orientações.

## Solicitar recursos

Solicitações de recursos são bem-vindas. Mas tire um momento para descobrir se sua ideia se encaixa no escopo e nos objetivos do projeto. Cabe a **você** apresentar um forte argumento para convencer os desenvolvedores do projeto dos méritos deste recurso. Por favor, forneça o máximo de detalhes e contexto possível.

## Solicitações de mesclagem

Solicitações de mesclagem são de grande ajuda. Elas devem permanecer focadas no escopo e evitar a inclusão de commits não relacionados.

**Por favor, pergunte primeiro** antes de começar qualquer solicitação de mesclagem significativa (por exemplo, implementar recursos, refatorar código, portar para uma linguagem diferente), caso contrário, você corre o risco de gastar muito tempo trabalhando em algo que os desenvolvedores do projeto não queiram mesclar.

Por favor, adira às convenções de codificação utilizadas em todo o projeto (indentação, comentários precisos, etc.) e a quaisquer outros requisitos (como cobertura de testes).

Seguir o processo a seguir é a melhor maneira de incluir seu trabalho no projeto:

1. [Fork](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) o
   projeto, clone seu fork e configure os remotos:

```bash
# Clone o fork do repositório para o diretório atual
git clone https://code.castopod.org/<seu-nome-de-usuário>/castopod.git

# Navegue até o diretório recém-clonado
cd castopod

# Atribua o repositório original a um remoto chamado "upstream"
git remote add upstream https://code.castopod.org/adaures/castopod.git
```

2. Se você clonou há algum tempo, obtenha as alterações mais recentes do repositório original:

```bash
git checkout main
git pull upstream main
```

3. Crie um novo branch de tópico (a partir do branch `main`) para conter sua alteração, mudança ou correção:

```bash
git checkout -b <nome-do-branch-de-tópico>
```

4. Comite suas alterações em pedaços lógicos. Por favor, siga estas [orientações de mensagem de commit do Git](https://conventionalcommits.org/) ou seu código provavelmente não será mesclado no projeto principal. Use o recurso de [rebase interativo do Git](https://help.github.com/articles/about-git-rebase/) para organizar seus commits antes de torná-los públicos.

5. Una localmente (ou rebase) o branch de desenvolvimento original no seu branch de tópico:

```bash
git pull [--rebase] upstream main
```

6. Faça push do seu branch de tópico para o seu fork:

```bash
git push origin <nome-do-branch-de-tópico>
```

7. [Abra uma solicitação de mesclagem](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html#new-merge-request-from-a-fork)
   com um título e descrição claros.

**IMPORTANTE**: Ao enviar uma correção, você concorda em permitir que os proprietários do projeto licenciem seu trabalho nos termos da [GNU AGPLv3](https://code.castopod.org/adaures/castopod/-/blob/main/LICENSE).

## Orientações de colaboração

Existem algumas regras básicas para garantir a alta qualidade do projeto:

- Antes de efetuar a mesclagem, um PR requer pelo menos duas aprovações dos colaboradores, a menos que seja uma mudança arquitetônica, um recurso grande, etc. Se for, pelo menos 50% da equipe principal deve concordar em mesclá-la, com cada membro da equipe tendo direito a um veto completo. (ou seja, cada um pode bloquear qualquer PR)
- Um PR deve permanecer aberto por pelo menos dois dias antes de ser mesclado (não se aplica a contribuições triviais, como corrigir um erro de digitação). Dessa forma, todos têm tempo suficiente para examiná-lo.

Você é sempre bem-vindo para discutir e propor melhorias a estas orientações.