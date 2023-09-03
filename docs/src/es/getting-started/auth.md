---
title: Autenticación y Autorización
sidebarDepth: 3
---

# Autenticación y Autorización

Castopod maneja la autenticación y autorización mediante
`codeigniter/shield` y reglas personalizadas. Los roles y permisos se definen en dos niveles:

1. [A nivel de instancia](#1-roles-y-permisos-en-toda-la-instancia)
2. [Por podcast](#2-roles-y-permisos-por-podcast)

## 1. Roles y permisos en toda la instancia

### Roles en la instancia

<!-- AUTH-INSTANCE-ROLES-LIST:START - No elimines ni modifiques esta sección -->

| rol            | descripción                              | permisos                                                                                  |
| -------------- | ---------------------------------------- | ----------------------------------------------------------------------------------------- |
| Super admin    | Tiene control total sobre Castopod.       | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks |
| Gestor         | Maneja el contenido de Castopod.          | podcasts.create, podcasts.import, persons.manage, pages.manage                             |
| Podcaster      | Usuarios generales de Castopod.          | admin.access                                                                               |

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Permisos en la instancia

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - No elimines ni modifiques esta sección -->

| permiso                | descripción                                                           |
| ---------------------- | --------------------------------------------------------------------- |
| admin.access           | Puede acceder al área de administración de Castopod.                  |
| admin.settings         | Puede acceder a la configuración de Castopod.                          |
| users.manage           | Puede gestionar usuarios de Castopod.                                  |
| persons.manage         | Puede gestionar personas.                                              |
| pages.manage           | Puede gestionar páginas.                                               |
| podcasts.view          | Puede ver todos los podcasts.                                          |
| podcasts.create        | Puede crear nuevos podcasts.                                           |
| podcasts.import        | Puede importar podcasts.                                               |
| fediverse.manage-blocks| Puede bloquear actores/dominios de fediverso de interactuar con Castopod. |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Roles y permisos por podcast

### Roles por podcast

<!-- AUTH-PODCAST-ROLES-LIST:START - No elimines ni modifiques esta sección -->

| rol        | descripción                                                   | permisos                                                                                                                                                                                                                       |
| -----------| ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Admin      | Tiene control total sobre el podcast #{id}.                   | \*                                                                                                                                                                                                                              |
| Editor     | Gestiona el contenido y las publicaciones del podcast #{id}.  | view, edit, manage-import, manage-persons, manage-platforms, manage-publications, manage-notifications, interact-as, episodes.view, episodes.create, episodes.edit, episodes.delete, episodes.manage-persons, episodes.manage-clips, episodes.manage-publications, episodes.manage-comments |
| Autor      | Gestiona el contenido del podcast #{id}, pero no puede publicar.| view, manage-persons, episodes.view, episodes.create, episodes.edit, episodes.manage-persons, episodes.manage-clips                                                                                                         |
| Invitado   | Contribuidor general del podcast #{id}.                       | view, episodes.view                                                                                                                                                                                                           |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Permisos por podcast

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - No elimines ni modifiques esta sección -->

| permiso                          | descripción                                                                               |
| -------------------------------- | ----------------------------------------------------------------------------------------- |
| ver                              | Visualizar el panel de control y análisis del podcast #{id}.                               |
| editar                           | Puede editar el podcast #{id}.                                                             |
| eliminar                         | Puede eliminar el podcast #{id}.                                                          |
| gestionar-importaciones          | Puede sincronizar el podcast importado #{id}.                                               |
| gestionar-personas               | Permite gestionar las suscripciones al podcast #{id}.                                      |
| gestionar-suscriptores           | Permite gestionar las suscripciones al podcast #{id}.                                      |
| gestionar-contribuidores         | Permite gestionar los contribuidores del podcast #{id}.                                    |
| gestionar-plataformas            | Puede configurar/eliminar los enlaces a plataformas del podcast #{id}.                    |
| gestionar-publicaciones          | Puede publicar el podcast #{id}.                                                           |
| gestionar-notificaciones         | Puede ver y marcar las notificaciones como leídas para el podcast #{id}.                   |
| interactuar-como                 | Puede interactuar como el podcast #{id} para agregar, compartir o responder mensajes.     |
| episodes.view                    | Puede ver el panel de control y análisis del podcast #{id}.                               |
| crear-episodios                  | Puede crear episodios para el podcast #{id}.                                               |
| editar-episodios                 | Puede editar el podcast #{id}.                                                             |
| eliminar-episodios               | Puede eliminar el podcast #{id}.                                                          |
| episodes.manage-persons          | Permite gestionar las suscripciones al podcast #{id}.                                      |
| episodes.manage-clips            | Permite gestionar clips de video o partes de audio del podcast #{id}.                      |
| episodes.manage-publications     | Puede publicar el podcast #{id}.                                                           |
| episodes.manage-comments         | Puede crear/eliminar comentarios de episodios del podcast #{id}.                          |

<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->