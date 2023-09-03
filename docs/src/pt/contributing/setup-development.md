---
title: Configuração do ambiente de desenvolvimento
sidebarDepth: 3
---

# Configurar o seu ambiente de desenvolvimento

## Introdução

O Castopod é um aplicativo da web baseado no framework `php` [CodeIgniter 4](https://codeigniter.com).

Usamos o [Docker](https://www.docker.com/) para configurar rapidamente um ambiente de desenvolvimento. Um arquivo `docker-compose.yml` e um `Dockerfile` estão incluídos na pasta raiz do projeto para ajudar você a iniciar sua contribuição.

> Você não precisa de nenhum conhecimento prévio sobre o Docker para seguir as próximas etapas. No entanto, se você preferir usar seu próprio ambiente, fique à vontade!

## Instruções para configuração

### 1. Pré-requisitos

0. Instale o [docker](https://docs.docker.com/get-docker).

1. Clone o projeto Castopod executando o seguinte comando:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Crie um arquivo `.env` com a configuração mínima necessária para conectar o aplicativo ao banco de dados e usar o Redis como manipulador de cache:

   ```ini
   CI_ENVIRONMENT="development"
   # Se definido como development, você deve executar `npm run dev` para iniciar o servidor de ativos estáticos
   vite.environment="development"

   # Por padrão, isso é definido como true no arquivo de configuração do aplicativo.
   # Para desenvolvimento, isso deve ser definido como false, pois é
   # em um ambiente local
   app.forceGlobalSecureRequests=false

   app.baseURL="http://localhost:8080/"
   media.baseURL="http://localhost:8080/"

   admin.gateway="cp-admin"
   auth.gateway="cp-auth"

   database.default.hostname="mariadb"
   database.default.database="castopod"
   database.default.username="castopod"
   database.default.password="castopod"

   cache.handler="redis"
   cache.redis.host = "redis"

   # Talvez você não queira usar o Redis como manipulador de cache.
   # Comente/remova as duas linhas acima e descomente
   # a próxima linha para cache de arquivo.
   # cache.handler="file"
   ```

   > _NB._ Você pode ajustar seu ambiente definindo mais variáveis de ambiente em seu arquivo `.env` personalizado. Consulte o arquivo `env` para exemplos ou o [Guia do Usuário do CodeIgniter4](https://codeigniter.com/user_guide/index.html) para obter mais informações.

3. (para desktop Docker) Adicione o repositório clonado a `Configurações` > `Recursos` > `Compartilhamento de Arquivos` do Docker Desktop

### 2. (recomendado) Desenvolver dentro do contêiner do aplicativo com o VSCode

Se você estiver trabalhando no VSCode, pode aproveitar a pasta `.devcontainer/`. Ela define um ambiente de desenvolvimento (contêiner de desenvolvimento) com requisitos e extensões pré-instalados do VSCode para que você não precise se preocupar com eles. Todos os serviços necessários serão carregados automaticamente! 🪄

1. Instale a extensão do VSCode [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. `Ctrl/Cmd + Shift + P` > `Open in container`

   > A janela do VSCode será recarregada dentro do contêiner de desenvolvimento. Aguarde vários minutos durante a primeira carga, pois todos os serviços necessários estão sendo construídos.

   **Observação**: O contêiner de desenvolvimento será iniciado executando o servidor php do Castopod. Durante o desenvolvimento, você precisará iniciar o servidor de desenvolvimento do [Vite](https://vitejs.dev) para compilar o código TypeScript e os estilos:

   ```bash
   # execute o servidor de desenvolvimento do Vite
   npm run dev
   ```

   Se houver algum problema com o servidor php não sendo executado, você pode reiniciá-lo usando os comandos a seguir:

   ```bash
   # execute o servidor Castopod
   php spark serve - 0.0.0.0
   ```

3. Está tudo pronto! 🎉

   Agora você está **dentro do contêiner de desenvolvimento** e pode usar o console do VSCode (`Terminal` > `Novo Terminal`) para executar qualquer comando:

   ```bash
   # O PHP está instalado
   php -v

   # O Composer está instalado
   composer -V

   # O npm está instalado
   npm -v

   # O git está instalado
   git version
   ```

Para mais informações, consulte [VSCode Remote Containers](https://code.visualstudio.com/docs/remote/containers)

### 3. Começando a desenvolver

Está tudo pronto! Comece a trabalhar atualizando os arquivos do projeto! Consulte o [Guia do Usuário do CodeIgniter4](https://codeigniter.com/user_guide/index.html) para obter mais informações.

Para ver suas alterações, acesse:

- `http://localhost:8080/` para o aplicativo Castopod
- `http://localhost:8888/` para a interface phpmyadmin:

  - nome de usuário: **castopod**
  - senha: **castopod**

### 2-alt. Desenvolver fora do contêiner do aplicativo

Você não deseja usar o contêiner de desenvolvimento do VSCode? Sem problemas!

1. Inicie manualmente os contêineres do Docker:

   Vá para a pasta raiz do projeto e execute o seguinte comando:

   ```bash
   # inicie todos os serviços declarados no arquivo docker-compose.yml
   # a opção -d inicia os contêineres em segundo plano
   docker-compose up -d

   # Veja todos os processos em execução (você deve ver 3 processos em execução)
   docker-compose ps

   # Alternativamente, você pode verificar todos os processos do Docker em execução
   docker ps -a

   ```

   > O comando `docker-compose up -d` inicializará os 4 contêineres em segundo plano:
   >
   > - `castopod_app`: um contêiner baseado em PHP com os requisitos do Castopod instalados
  