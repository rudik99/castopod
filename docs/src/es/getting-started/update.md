---
title: Actualización
sidebarDepth: 3
---

# ¿Cómo instalar Castopod?

Después de instalar Castopod, puedes actualizar tu instancia a la última versión para disfrutar de las últimas funcionalidades ✨, correcciones de errores 🐛 y mejoras de rendimiento ⚡.

## Instrucciones de actualización

0. ⚠️ Antes de actualizar, te recomendamos encarecidamente que hagas una copia de seguridad de tus archivos de Castopod y de la base de datos.

   - ver
     [¿Debo hacer una copia de seguridad antes de actualizar?](#¿debo-hacer-una-copia-de-seguridad-antes-de-actualizar)

1. Ve a la
   [página de lanzamientos](https://code.castopod.org/adaures/castopod/-/releases) y
   verifica si tu instancia está actualizada con la última versión de Castopod.

   - ver
     [¿Dónde puedo encontrar la versión de Castopod?](#¿dónde-puedo-encontrar-la-versión-de-castopod)

2. Descarga el paquete de la última versión llamado `Paquete de Castopod`, puedes elegir entre los archivos `zip` o `tar.gz`

   - ⚠️ Asegúrate de descargar el Paquete de Castopod y **NO** el Código Fuente
   - Ten en cuenta que también puedes descargar el último paquete desde
     [castopod.org](https://castopod.org/)

3. En tu servidor:

   - Elimina todos los archivos excepto `.env` y `public/media`
   - Copia los nuevos archivos del paquete descargado en tu servidor

     ::: info Nota

     Es posible que debas restablecer los permisos de archivo, como se hizo durante el proceso de instalación. Consulta
     [Consideraciones de seguridad](./security.md).

     :::

4. Actualiza el esquema de tu base de datos desde la página `Castopod Admin` > `About` o ejecutando:

   ```bash
   php spark castopod:database-update
   ```

5. Borra la caché desde la página `Castopod Admin` > `Settings` > `general` >
   `Housekeeping`
6. ✨¡Disfruta de tu nueva instancia, ¡has terminado!

::: info Nota

Es posible que las versiones vengan con instrucciones de actualización adicionales (ver
  [página de notas de versión](https://code.castopod.org/adaures/castopod/-/releases)).

- ver
  [No he actualizado mi instancia en mucho tiempo... ¿Qué debo hacer?](#no-he-actualizado-mi-instancia-en-mucho-tiempo-qué-debo-hacer)

:::

## Actualizaciones completamente automatizadas

> Próximamente... 👀

## Preguntas frecuentes (FAQ)

### ¿Dónde puedo encontrar la versión de Castopod?

Ve a tu panel de administración de Castopod, la versión se muestra en la parte inferior izquierda.

También puedes encontrar la versión en la aplicación
`> Configuración > Constantes.php` carpeta.

### No he actualizado mi instancia en mucho tiempo... ¿Qué debo hacer?

¡No hay problema! Simplemente obtén la última versión según se describe
arriba. Cuando ejecutes las instrucciones de actualización (paso 4), ejecútalas
secuencialmente, desde la más antigua hasta la más reciente.

> Deberías hacer una copia de seguridad de tu instancia según la fecha de tu última actualización de Castopod.

Por ejemplo, si estás en `v1.0.0-alpha.42` y deseas actualizar a
 `v1.0.0-beta.1`:

0. (altamente recomendado) Haz una copia de seguridad de tus archivos y base de datos.

1. Descarga la última versión, sobrescribe tus archivos y conserva `.env` y `public/media`.

2. Realiza las instrucciones de actualización una por una (desde la más antigua hasta la más reciente).

3. ✨¡Tu nueva instancia está lista!

### ¿Debo hacer una copia de seguridad antes de actualizar?

Te recomendamos hacerlo, ¡para no perder nada en caso de que algo salga mal!

En general, te recomendamos hacer copias de seguridad regularmente de tus archivos de Castopod y de tu base de datos para evitar perderlo todo...