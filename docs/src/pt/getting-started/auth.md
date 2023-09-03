---
title: Autenticação e Autorização
sidebarDepth: 3
---

# Autenticação e Autorização

O Castopod gerencia autenticação e autorização usando o `codeigniter/shield` em conjunto com regras personalizadas. As funções e permissões são definidas em dois níveis:

1. [Em nível de instância](#1-funções-e-permissões-em-nível-de-instância)
2. [Por podcast](#2-funções-e-permissões-por-podcast)

## 1. Funções e permissões em nível de instância

### Funções na instância

<!-- AUTH-INSTANCE-ROLES-LIST:START - Do not remove or modify this section -->

| função        | descrição                                 | permissões                                                                                                                                    |
| ------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Super admin   | Tem controle total sobre o Castopod.       | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks                                                   |
| Gerente       | Gerencia o conteúdo do Castopod.           | podcasts.create, podcasts.import, persons.manage, pages.manage                                                                               |
| Podcaster     | Usuários gerais do Castopod.               | admin.access                                                                                                                                 |
                                                                                      

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Permissões na instância

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| permissão                | descrição                                                                       |
| ----------------------- | ------------------------------------------------------------------------------- |
| admin.access            | Pode acessar a área administrativa do Castopod.                                |
| admin.settings          | Pode acessar as configurações do Castopod.                                      |
| users.manage            | Pode gerenciar os usuários do Castopod.                                         |
| persons.manage          | Pode gerenciar pessoas.                                                         |
| pages.manage            | Pode gerenciar páginas.                                                          |
| podcasts.view           | Pode visualizar todos os podcasts.                                               |
| podcasts.create         | Pode criar novos podcasts.                                                       |
| podcasts.import         | Pode importar podcasts.                                                          |
| fediverse.manage-blocks | Pode bloquear atores/domínios fediverse de interagir com o Castopod.             |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Funções e permissões por podcast

### Funções por podcast

<!-- AUTH-PODCAST-ROLES-LIST:START - Do not remove or modify this section -->

| função    | descrição                                           | permissões                                                                                                                                                                                                                                                  |
| --------- | --------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Admin     | Tem controle total sobre o podcast #{id}.           | \*                                                                                                                                                                                                                                                          |
| Editor    | Gerencia o conteúdo e publicações do podcast #{id}. | view, edit, manage-import, manage-persons, manage-platforms, manage-publications, manage-notifications, interact-as, episodes.view, episodes.create, episodes.edit, episodes.delete, episodes.manage-persons, episodes.manage-clips, episodes.manage-publications, episodes.manage-comments |
| Autor     | Gerencia o conteúdo do podcast #{id}, sem publicar. | view, manage-persons, episodes.view, episodes.create, episodes.edit, episodes.manage-persons, episodes.manage-clips                                                                                                                                       |
| Convidado | Contribuidor geral do podcast #{id}.                | view, episodes.view                                                                                                                                                                                                                                        |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Permissões por podcast

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - Do not remove or modify this section -->

| permissão                      | descrição                                                                                                                     |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- |
| view                           | Pode visualizar o painel e análise do podcast #{id}.                                                                         |
| edit                           | Pode editar o podcast #{id}.                                                                                                  |
| delete                         | Pode excluir o podcast #{id}.                                                                                                 |
| manage-imports                 | Pode sincronizar o podcast importado #{id}.                                                                                  |
| manage-persons                 | Pode gerenciar inscritos no podcast #{id}.                                                                                   |
| manage-subscriptions           | Pode gerenciar inscrições no podcast #{id}.                                                                                  |
| manage-contributors            | Pode gerenciar os contribuidores do podcast #{id}.                                                                           |
| manage-platforms               | Pode configurar/remover links para plataformas no podcast #{id}.                                                             |
| manage-publications            | Pode publicar o podcast #{id}.                                                                                                |
| manage-notifications           | Pode visualizar e marcar notificações como lidas para o podcast #{id}.                                                       |
| interact-as                    | Pode interagir como o podcast #{id} para adicionar, compartilhar ou responder mensagens.                                    |
| episodes.view                  | Pode visualizar o painel e análise do podcast #{id}.                                                                         |
| episodes.create                | Pode criar episódios para o podcast #{id}.                                                                                    |
| episodes.edit                  | Pode editar o podcast #{id}.                                                                                                  |
| episodes.delete                | Pode excluir o podcast #{id}.                                                                                                 |
| episodes.manage-persons        | Pode gerenciar inscritos no podcast #{id}.                                                                                   |
| episodes.manage-clips          | Pode gerenciar clipes de vídeo ou trechos de áudio no podcast #{id}.                                                         |
| episodes.manage-publications   | Pode publicar o podcast #{id}.                                                                                                |
| episodes.manage-comments       | Pode criar/excluir comentários no episódio do podcast #{id}.                                                                 |

<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->