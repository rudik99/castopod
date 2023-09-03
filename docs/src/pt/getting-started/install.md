---
title: Instalação
sidebarDepth: 3
---

# Como instalar o Castopod

O Castopod foi projetado para ser fácil de instalar. Se você estiver usando um
hospedagem dedicada ou compartilhada, você pode instalá-lo na maioria dos
servidores web compatíveis com PHP-MySQL.

::: tip Nota

Publicamos imagens oficiais do Docker para o Castopod!

Se você preferir usar o Docker, você pode pular esta parte e ir diretamente para a [documentação Docker](./docker.md) para o Castopod.

:::

## Pré-requisitos

- PHP v8.1
- MySQL versão 5.7 ou superior ou MariaDB versão 10.2 ou superior
- Suporte HTTPS
- Um [ntp-synced clock](https://wiki.debian.org/NTP) para validar as solicitações de federação

### PHP v8.1

A versão 8.1 do PHP é necessária, com as seguintes extensões instaladas:

- [intl](https://www.php.net/manual/fr/intl.requirements.php)
- [libcurl](https://www.php.net/manual/fr/curl.requirements.php)
- [mbstring](https://www.php.net/manual/fr/mbstring.installation.php)
- [gd](https://www.php.net/manual/en/image.installation.php) com bibliotecas **JPEG**, **PNG** e **WEBP**.
- [exif](https://www.php.net/manual/fr/exif.installation.php)

Além disso, verifique se as seguintes extensões estão habilitadas no seu PHP:

- json (habilitado por padrão - não desabilite)
- xml (habilitado por padrão - não desabilite)
- [mysqlnd](https://www.php.net/manual/fr/mysqlnd.install.php)

### Banco de dados compatível com o MySQL

> Recomendamos o uso do [MariaDB](https://mariadb.org).

::: warning Atenção

O Castopod só funciona com bancos de dados do MySQL versão 5.7 ou superior. As versões 5.6 (que tiveram suporte encerrado em 5 de fevereiro de 2021) ou anteriores do MySQL não funcionarão.

:::

Você precisará do nome do host do servidor, nome do banco de dados, nome de usuário e senha para concluir o processo de instalação. Se você não tiver essas informações, entre em contato com seu administrador.

### (Opcional) FFmpeg v4.1.8 ou superior para clipes de vídeo

O [FFmpeg](https://www.ffmpeg.org/) versão 4.1.8 ou superior é necessário se você deseja gerar clipes de vídeo. As seguintes extensões devem estar instaladas:

- biblioteca **FreeType 2** para [gd](https://www.php.net/manual/en/image.installation.php).

### (Opcional) Outras recomendações

- Redis para melhor desempenho em cache.
- CDN para cache de arquivos estáticos e melhor desempenho.
- Gateway de e-mail para senhas perdidas.

## Instruções de instalação

### Pré-requisitos

0. Obtenha um servidor web com [os pré-requisitos](#pré-requisitos) instalados.
1. Crie um banco de dados MySQL para o Castopod com um usuário com as permissões necessárias (para mais informações, consulte [Banco de dados compatível com o MySQL](#banco-de-dados-compatível-com-o-mysql)).
2. Ative o HTTPS em seu domínio com um _certificado SSL_.
3. Baixe e descompacte o pacote mais recente do [Castopod](https://castopod.org/) no servidor web, se ainda não o tiver feito.
   - ⚠️ Certifique-se de apontar a raiz do documento do servidor da web para a subpasta `public/` da pasta `castopod`.
4. Adicione **tarefas cron** no seu servidor web para vários processos em segundo plano (substitua os caminhos conforme necessário):

   ```bash
      * * * * * /caminho/para/php /caminho/para/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Observação** - Se você não adicionar essa tarefa cron, os seguintes recursos do Castopod não funcionarão:

   - Importar um podcast de um feed RSS existente
   - Transmitir atividades sociais para seus seguidores no Fediverso
   - Transmitir episódios para hubs abertos usando o [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Gerar clipes de vídeo - [requer FFmpeg](#opcional-ffmpeg-v418-ou-superior-para-clipes-de-vídeo)

### (Método recomendado) Assistente de instalação

1. Execute o script de instalação do Castopod acessando a página do assistente de instalação (`https://seu_nome_de_domínio.com/cp-install`) em seu navegador da web favorito.
2. Siga as instruções exibidas.
3. Comece a podcastar!

:::info Nota

O script de instalação criará um arquivo `.env` na raiz do pacote. Se você não conseguir usar o assistente de instalação, poderá criar e editar o arquivo `.env` manualmente, com base no arquivo `.env.example`.

:::

### Configuração de e-mail/SMTP

A configuração de e-mail é necessária para que alguns recursos funcionem corretamente (por exemplo, recuperar sua senha esquecida, enviar instruções para assinantes premium, ...)

Você pode adicionar a configuração de e-mail no arquivo `.env` de sua instância da seguinte maneira:

```ini
# [...]

email.fromEmail="seu_endereço_de_email"
email.SMTPHost="seu_host_smtp"
email.SMTPUser="seu_usuario_smtp"
email.SMTPPass="sua_senha_smtp"
```

#### Opções de configuração de e-mail

| Nome da variável | Tipo                 | Valor padrão   |
| ---------------- | -------------------- | -------------- |
| **`fromEmail`**  | string               | `undefined`    |
| **`fromName`**   | string               | `"Castopod"`   |
| **`SMTPHost`**   | string               | `undefined`    |
| **`SMTPUser`**   | string               | `undefined`