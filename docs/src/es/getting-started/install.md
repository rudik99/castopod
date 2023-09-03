---
title: Instalación
sidebarDepth: 3
---

# ¿Cómo instalar Castopod?

Castopod ha sido diseñado para ser fácil de instalar. Ya sea que estés utilizando un alojamiento dedicado o compartido, puedes instalarlo en la mayoría de los servidores web compatibles con PHP-MySQL.

::: tip Nota

¡Hemos publicado imágenes oficiales de Docker para Castopod!

Si prefieres utilizar Docker, puedes omitir esta parte e ir directamente a la [documentación de Docker](./docker.md) para Castopod.

:::

## Requisitos previos

- PHP v8.1 solamente
- Versión de MySQL 5.7 o superior o versión de MariaDB 10.2 o superior
- Soporte de HTTPS
- Un [reloj sincronizado con NTP](https://wiki.debian.org/NTP) para validar las solicitudes entrantes de federación

### PHP v8.1 solamente

Se requiere la versión 8.1 de PHP, con las siguientes extensiones instaladas:

- [intl](https://www.php.net/manual/fr/intl.requirements.php)
- [libcurl](https://www.php.net/manual/fr/curl.requirements.php)
- [mbstring](https://www.php.net/manual/fr/mbstring.installation.php)
- [gd](https://www.php.net/manual/en/image.installation.php) con bibliotecas **JPEG**, **PNG** y **WEBP**.
- [exif](https://www.php.net/manual/fr/exif.installation.php)

Además, asegúrate de que las siguientes extensiones estén activadas en tu PHP:

- json (activado por defecto - no lo desactives)
- xml (activado por defecto - no lo desactives)
- [mysqlnd](https://www.php.net/manual/fr/mysqlnd.install.php)

### Base de datos compatible con MySQL

> Recomendamos utilizar [MariaDB](https://mariadb.org).

::: warning Advertencia

Castopod solo funciona con bases de datos MySQL 5.7 o versiones más recientes. Las versiones 5.6 (cuyo soporte finalizó el 5 de febrero de 2021) o anteriores de MySQL no funcionarán.

:::

Necesitarás el nombre de host del servidor, el nombre de la base de datos, el nombre de usuario y la contraseña para completar el proceso de instalación. Si no tienes esta información, contacta a tu administrador.

#### Permisos de acceso

El usuario debe tener al menos los siguientes permisos de acceso a la base de datos para que Castopod funcione: `CREATE`, `ALTER`, `DELETE`, `EXECUTE`, `INDEX`,`INSERT`, `SELECT`, `UPDATE`,`REFERENCES`, `CREATE VIEW`.

### (Opcional) FFmpeg v4.1.8 o superior para clips de vídeo

Se requiere [FFmpeg](https://www.ffmpeg.org/) versión 4.1.8 o superior si deseas generar Clips de Vídeo. Deben estar instaladas las siguientes extensiones:

- Biblioteca **FreeType 2** para [gd](https://www.php.net/manual/en/image.installation.php).

### (Opcional) Otras recomendaciones

- Redis para un mejor rendimiento del caché.
- CDN para la caché de archivos estáticos y un mejor rendimiento.
- Pasarela de correo electrónico para contraseñas olvidadas.

## Instrucciones de instalación

### Requisitos previos

0. Obtén un servidor web con [los requisitos previos](#requisitos) instalados.
1. Crea una base de datos MySQL para Castopod con un usuario que tenga los permisos de acceso y modificación (para obtener más información, consulta [Base de datos compatible con MySQL](#base-de-datos-compatible-con-mysql)).
2. Activa HTTPS en tu dominio con un _certificado SSL_.
3. Descarga y descomprime el último [paquete de Castopod](https://castopod.org/) en el servidor web si aún no lo has hecho.
   - ⚠️ Haz que la raíz del documento del servidor web apunte a la subcarpeta `public/` de la carpeta `castopod`.
4. Agrega **tareas programadas** a tu servidor web para varios procesos en segundo plano (reemplaza las rutas según corresponda):

   ```bash
      * * * * * /ruta/hacia/php /ruta/hacia/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Nota** - Si no añades esta tarea programada, las siguientes características de Castopod no funcionarán:

   - Importar un podcast desde un feed RSS existente
   - Transmitir actividades sociales a tus seguidores en el federado
   - Transmitir episodios a hubs abiertos utilizando [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Generación de clips de vídeo - [requiere FFmpeg](#opcional-ffmpeg-v418-o-superior-para-clips-de-v%C3%ADdeo)

### (Método recomendado) Asistente de instalación

1. Ejecuta el script de instalación de Castopod visitando la página de Asistente de Instalación (`https://tu_nombre_de_dominio.com/cp-install`) en tu navegador web favorito.
2. Sigue las instrucciones que se muestran.
3. ¡Comienza a hacer podcast!

:::info Nota

El script de instalación crea un archivo `.env` en la raíz del paquete. Si no puedes usar el asistente de instalación, puedes crear y editar manualmente el archivo `.env` basándote en el archivo `.env.example`.

:::

### Configuración de correo electrónico/SMTP

La configuración de correo electrónico es necesaria para que algunas características funcionen correctamente (por ejemplo, recuperar tu contraseña olvidada, enviar instrucciones a suscriptores premium, ...)

Puedes agregar la configuración de correo electrónico en el archivo `.env` de tu instancia de la siguiente manera:

```ini
# […]

email.fromEmail="tu_dirección_de_correo_electrónico"
email.SMTPHost="tu_host_smtp"
email.SMTPUser="tu_usuario_smtp"
email.SMTPPass="tu_contraseña_smtp"
```


#### Opciones de configuración de correo electrónico

| Nombre de variable | Tipo                 | Valor por defecto |
| ----------------- | -------------------- | ----------------- |
| **`fromEmail`**   | string               | `undefined`       |
| **`fromName`**    | string               | `"Castopod"`      |
| **`SMTPHost