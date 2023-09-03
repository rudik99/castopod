---
title: Pautas
---

# Contribuir a Castopod

¿Te encanta Castopod y quieres ayudar? ¡Muchas gracias, hay algo para hacer para todos!

Por favor, dedica un momento a revisar este documento para que el proceso de contribución sea fácil y efectivo para todos los involucrados.

Seguir estas pautas ayuda a comunicar que respetas el tiempo de los desarrolladores que gestionan y desarrollan este proyecto de código abierto. A cambio, ellos deberían demostrar ese mismo respeto al abordar tu problema o evaluar parches y mejoras.

::: info Nota

Cualquier contribución realizada en un repositorio que no sea [el repositorio original](https://code.castopod.org/adaures/castopod) no será aceptada.

:::

## Uso del rastreador de problemas

El [rastreador de problemas](https://code.castopod.org/adaures/castopod/-/issues) es el canal preferido para [informes de errores](#informes-de-errores), [solicitudes de funciones](#solicitudes-de-funciones) y [envío de solicitudes de extracción](#solicitudes-de-extracción).

## ⚠️ Problemas de seguridad y vulnerabilidades

Si encuentras algún problema de seguridad o vulnerabilidad en el código fuente de Castopod, contáctanos directamente por correo electrónico a [security@castopod.org](mailto:security@castopod.org).

## Informes de errores

Un error es un _problema demostrable_ que es causado por el código en el repositorio. Los buenos informes de errores son extremadamente útiles, ¡gracias!

Pautas para los informes de errores:

1. **Utiliza la búsqueda de problemas** &mdash; comprueba si el problema ya ha sido notificado.

2. **Verifica si el problema ha sido solucionado** &mdash; intenta reproducirlo utilizando la última versión de la rama `main` en el repositorio.

3. **Aisla el problema** &mdash; idealmente, crea un [caso de prueba reducido](https://css-tricks.com/reduced-test-cases/) y un ejemplo en vivo.

Un buen informe de error no debería dejar a los demás buscándote para obtener más información. Por favor, intenta ser lo más detallado posible en tu informe. ¿Cuál es tu entorno? ¿Qué pasos reproducirían el problema? ¿Qué navegador(es) y sistema(s) operativo(s) experimentan el problema? ¿Cuál sería el resultado esperado? Todos estos detalles ayudarán a las personas a solucionar posibles errores.

> Se han creado [plantillas de problemas](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates) para este proyecto. Puedes utilizarlas para ayudarte a seguir estas pautas.

## Solicitudes de funciones

Las solicitudes de funciones son bienvenidas. Pero tómate un momento para averiguar si tu idea encaja con el alcance y los objetivos del proyecto. Depende de _ti_ presentar un sólido argumento para convencer a los desarrolladores del proyecto de los méritos de esta función. Por favor, proporciona la mayor cantidad de detalles y contexto posible.

## Solicitudes de extracción

Las solicitudes de extracción buenas - correcciones de errores, mejoras, nuevas funciones - son de gran ayuda. Deben mantenerse enfocadas en su alcance y evitar contener confirmaciones no relacionadas.

**Por favor, pregunta primero** antes de embarcarte en cualquier solicitud de extracción importante (por ejemplo, implementar funciones, refactorizar código, portar a un lenguaje diferente), de lo contrario corres el riesgo de pasar mucho tiempo trabajando en algo que los desarrolladores del proyecto pueden no querer fusionar en el proyecto.

Por favor, sigue las convenciones de codificación utilizadas en todo el proyecto (sangría, comentarios precisos, etc.) y cualquier otro requisito (como la cobertura de pruebas).

Seguir el siguiente proceso es la mejor manera de que tu trabajo se incluya en el proyecto:

1. [Haz una bifurcación](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) del proyecto, clona tu bifurcación y configura los remotos:

```bash
# Clona tu bifurcación del repositorio en el directorio actual
git clone https://code.castopod.org/<tu-nombre-de-usuario>/castopod.git

# Navega al directorio recién clonado
cd castopod

# Asigna el repositorio original a un remoto llamado "upstream"
git remote add upstream https://code.castopod.org/adaures/castopod.git
```

2. Si clonaste hace un tiempo, obtén los últimos cambios de `upstream`:

```bash
git checkout main
git pull upstream main
```

3. Crea una nueva rama temática (desde la rama `main`) para contener tu función, cambio o corrección:

```bash
git checkout -b <nombre-de-la-rama-temática>
```

4. Realiza tus cambios en fragmentos lógicos. Por favor, sigue estas [pautas de mensajes de confirmación de Git](https://conventionalcommits.org/) o es posible que tu código no se fusione en el proyecto principal. Utiliza la función de [rebase interactivo de Git](https://help.github.com/articles/about-git-rebase/) para organizar tus confirmaciones antes de hacerlas públicas.

5. Fusiona (o rebasea) localmente la rama de desarrollo de `upstream` en tu rama temática:

```bash
git pull [--rebase] upstream main
```

6. Sube tu rama temática a tu bifurcación:

```bash
git push origin <nombre-de-la-rama-temática>
```

7. [Abre una solicitud de extracción](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html#new-merge-request-from-a-fork) con un título y una descripción claros.

**IMPORTANTE**: Al enviar un parche, aceptas permitir a los propietarios del proyecto otorgar una licencia a tu trabajo bajo los términos de la [GNU AGPLv3](https://code.castopod.org/adaures/castopod/-/blob/main/LICENSE).

## Pautas de colaboración

Existen algunas reglas básicas para garantizar la alta calidad del proyecto:

- Antes de fusionar, una solicitud de extracción requiere al menos dos aprobaciones de los colaboradores, a menos que sea un cambio arquitectónico, una función grande, etc. Si es así, al menos el 50% del equipo principal debe estar de acuerdo en fusionarlo, y cada miembro del equipo tiene pleno derecho de veto. (es decir, cada uno puede bloquear cualquier solicitud de extracción)
- Una solicitud de extracción debe permanecer abierta al menos dos días antes de fusionarse (no se aplica a contribuciones triviales como corregir un error tipográfico). De esta manera, todos tienen suficiente tiempo para revisarla.

Siempre eres bienvenido a discutir y proponer mejoras a estas pautas.