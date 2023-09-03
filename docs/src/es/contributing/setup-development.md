---
title: Configuración de desarrollo
sidebarDepth: 3
---

# Configurar tu entorno de desarrollo

## Introducción

Castopod es una aplicación web basada en el framework `php`
[CodeIgniter 4](https://codeigniter.com).

Utilizamos [Docker](https://www.docker.com/) para configurar rápidamente un entorno de desarrollo. Se incluyen un archivo `docker-compose.yml` y `Dockerfile` en la carpeta raíz del proyecto para ayudarte a iniciar tu contribución.

> No necesitas ningún conocimiento previo de Docker para seguir los siguientes pasos. Sin embargo, si deseas utilizar tu propio entorno, siéntete libre de hacerlo.

## Instrucciones de configuración

### 1. Pre-requisitos

0. Instala [docker](https://docs.docker.com/get-docker).

1. Clona el proyecto de Castopod ejecutando:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Crea un archivo `.env` con la configuración mínima requerida para conectar la aplicación a la base de datos y usar redis como controlador de caché:

   ```ini
   CI_ENVIRONMENT="development"
   # Si se establece en development, debes ejecutar `npm run dev` para iniciar el servidor de activos estáticos
   vite.environment="development"

   # Por defecto, esto se establece en true en la configuración de la aplicación.
   # Para desarrollo, debe establecerse en false ya que está en un entorno local
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

   # Es posible que no desees utilizar redis como controlador de caché
   # Comenta/elimina las dos líneas anteriores y descomenta
   # la siguiente línea para el almacenamiento en caché de archivos.
   #cache.handler="file"
   ```

   > _NB._ Puedes ajustar tu entorno estableciendo más variables de entorno en tu archivo `.env` personalizado. Consulta el archivo `env` para ver ejemplos o la [Guía del usuario de CodeIgniter4](https://codeigniter.com/user_guide/index.html) para obtener más información.

3. (para Docker Desktop) Agrega el repositorio que has clonado a "Settings" > "Resources" > "File Sharing" de Docker Desktop.

### 2. (Recomendado) Desarrolla dentro del contenedor de la aplicación con VSCode

Si estás trabajando en VSCode, puedes aprovechar la carpeta `.devcontainer/`. Define un entorno de desarrollo (contenedor de desarrollo) con los requisitos preinstalados y las extensiones de VSCode para que no tengas que preocuparte por ellos. ¡Todos los servicios necesarios se cargarán automáticamente! 🪄

1. Instala la extensión de VSCode [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
2. `Ctrl/Cmd + Shift + P` > `Open in container`

   > La ventana de VSCode se recargará dentro del contenedor de desarrollo. Espera varios minutos durante la primera carga, ya que se están compilando todos los servicios necesarios.

   **Nota**: El contenedor de desarrollo se iniciará ejecutando el servidor php de Castopod. Durante el desarrollo, deberás iniciar el servidor de desarrollo de [Vite](https://vitejs.dev) para compilar el código typescript y los estilos:

   ```bash
   # ejecuta el servidor de desarrollo de Vite
   npm run dev
   ```

   Si hay algún problema con el servidor php que no se está ejecutando, puedes reiniciarlos utilizando los siguientes comandos:

   ```bash
   # ejecuta el servidor de Castopod
   php spark serve - 0.0.0.0
   ```

3. ¡Listo! 🎉

   Ahora estás **dentro del contenedor de desarrollo**. Puedes usar la consola de VSCode (`Terminal` > `New Terminal`) para ejecutar cualquier comando:

   ```bash
   # PHP está instalado
   php -v

   # Composer está instalado
   composer -V

   # npm está instalado
   npm -v

   # git está instalado
   git version
   ```

Para obtener más información, consulta la documentación de [VSCode Remote Containers](https://code.visualstudio.com/docs/remote/containers).

### 3. Comienza a programar

¡Todo está listo! ¡Comienza a trabajar en tus cambios en los archivos del proyecto! Siéntete libre de consultar la [Guía del usuario de CodeIgniter4](https://codeigniter.com/user_guide/index.html) para obtener más información.

Para ver tus cambios, ve a:

- `http://localhost:8080/` para la aplicación de Castopod
- `http://localhost:8888/` para la interfaz de phpMyAdmin:

  - nombre de usuario: **castopod**
  - contraseña: **castopod**

### 2-alternativa. Desarrolla fuera del contenedor de la aplicación

¿No deseas utilizar el contenedor de desarrollo de VSCode? ¡No hay problema!

1. Inicia los contenedores de Docker manualmente:

   Ve a la carpeta raíz del proyecto y ejecuta:

   ```bash
   # inicia todos los servicios declarados en el archivo docker-compose.yml
   # la opción -d inicia los contenedores en segundo plano
   docker-compose up -d

   # Ver todos los procesos en ejecución (deberías ver 3 procesos en ejecución)
   docker-compose ps

   # Alternativamente, puedes verificar todos los procesos de Docker
   docker ps -a
   ```

   > El comando `docker-compose up -d` iniciará 4 contenedores en segundo plano:
   >
   > - `castopod_app`: un contenedor basado en php con los requisitos de Castopod instalados
   > - `castopod_redis`: una base de datos [redis](https://redis.io/) para manejar consultas
   >   y almacenamiento en caché de páginas
   > - `cast