---
title: Seguridad
---

# Preguntas de seguridad

Castopod está desarrollado en [CodeIgniter4](https://codeigniter.com/), un
framework PHP que fomenta
[buenas prácticas de seguridad](https://codeigniter.com/user_guide/concepts/security.html).

Para garantizar la máxima seguridad de tu instancia y evitar ataques maliciosos,
recomendamos actualizar los permisos de los archivos de Castopod después de la
instalación y cada actualización (y evitar cualquier error de acceso incorrecto a los archivos):

- La carpeta `writable/` debe ser accesible en **lectura** y **escritura**.
- La carpeta `public/media/` debe ser accesible en **lectura** y **escritura**.
- cualquier otro archivo debe ser accesible solo en **lectura**.

Por ejemplo, si estás utilizando Apache o NGINX con Ubuntu, puedes ejecutar los siguientes comandos:

```bash
sudo chown -R root:root /ruta/a/castopod
sudo chown -R www-data:www-data /ruta/a/castopod/writable
sudo chown -R www-data:www-data /ruta/a/castopod/public/media
```