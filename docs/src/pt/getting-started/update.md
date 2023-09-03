---
title: Atualização
sidebarDepth: 3
---

# Como instalar o Castopod?

Depois de instalar o Castopod, você pode atualizar sua instância para a versão mais recente e aproveitar os recursos mais recentes ✨, correções de bugs 🐛 e melhorias de desempenho ⚡.

## Instruções de atualização

0. ⚠️ Antes de atualizar, recomendamos fortemente que você faça backup de seus arquivos Castopod e do banco de dados.

   - cf.
     [Devo fazer backup antes de atualizar?](#devo-fazer-backup-antes-de-atualizar)

1. Vá para a
   [página de versões](https://code.castopod.org/adaures/castopod/-/releases) e
   veja se sua instância está atualizada com a versão mais recente do Castopod

   - cf.
     [Onde posso encontrar a versão do meu Castopod?](#onde-posso-encontrar-a-versão-do-meu-castopod)

2. Baixe o pacote de atualização mais recente chamado `Pacote Castopod`, você pode escolher entre os arquivos `zip` ou `tar.gz`

   - ⚠️ Certifique-se de baixar o Pacote Castopod e **NÃO** o Código Fonte
   - Observe que você também pode baixar o pacote mais recente em
     [castopod.org](https://castopod.org/)

3. Em seu servidor:

   - Apague todos os arquivos, exceto `.env` e `public/media`
   - Copie os novos arquivos do pacote baixado para o seu servidor

     ::: info Nota

     Você pode precisar redefinir as permissões de arquivo, como no processo de instalação. Consulte
     [Preocupações de segurança](./security.md).

     :::

4. Atualize o esquema do banco de dados a partir da página `Castopod Admin` > `Sobre` ou executando:

   ```bash
   php spark castopod:database-update
   ```

5. Limpe seu cache a partir da página `Castopod Admin` > `Configurações` > `geral` >
   `Manutenção`
6. ✨ Aproveite sua nova instância, você terminou!

::: info Nota

Versões podem ter instruções de atualização adicionais (consulte a
[página de notas de versão](https://code.castopod.org/adaures/castopod/-/releases)).

- cf.
  [Eu não atualizei minha instância por um longo tempo... O que devo fazer?](#eu-não-atualizei-minha-instância-por-um-longo-tempo-o-que-devo-fazer)

:::

## Atualizações totalmente automatizadas

> Em breve... 👀

## Perguntas Frequentes (FAQ)

### Onde posso encontrar a versão do Castopod?

Vá para o painel de administração do Castopod, a versão será exibida no canto inferior esquerdo.

Você também pode encontrar a versão no aplicativo
`> Configuração > Constantes.php` pasta.

### Eu não atualizei minha instância por um longo tempo... O que devo fazer?

Sem problemas! Basta obter a versão mais recente como descrito acima. Quando você executar as instruções de atualização (4), execute-as sequencialmente, da mais antiga para a mais recente.

> Você deve fazer backup de sua instância de acordo com a data da sua última atualização do Castopod.

Por exemplo, se você está na versão `v1.0.0-alpha.42` e deseja atualizar para
a versão `v1.0.0-beta.1` :

0. (altamente recomendado) Faça backup de seus arquivos e banco de dados.

1. Baixe a versão mais recente, substitua seus arquivos mantendo
   `.env` e `public/media`.

2. Execute as instruções de atualização uma a uma (das mais antigas para as mais recentes).

3. ✨ Sua nova instância está pronta!

### Devo fazer backup antes de atualizar?

Recomendamos que você faça isso para não perder nada se algo der errado!

Em geral, recomendamos fazer backups regulares de seus arquivos Castopod e banco de dados para evitar qualquer perda...