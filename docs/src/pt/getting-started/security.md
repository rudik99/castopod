---
title: Segurança
---

# Perguntas de segurança

O Castopod é desenvolvido no [CodeIgniter4](https://codeigniter.com/), um framework PHP que incentiva as
[boas práticas de segurança](https://codeigniter.com/user_guide/concepts/security.html).

Para garantir a melhor segurança possível para sua instância e evitar ataques maliciosos, recomendamos que você atualize as permissões dos arquivos do Castopod após a instalação e cada atualização (e evite erros de acesso aos arquivos):

- A pasta `writable/` deve ter permissão de **leitura** e **escrita**.
- A pasta `public/media/` deve ter permissão de **leitura** e **escrita**.
- Todos os outros arquivos devem ter permissão de **leitura apenas**.

Por exemplo, se você estiver usando o Apache ou o NGINX com o Ubuntu, você pode executar os seguintes comandos:

```bash
sudo chown -R root:root /caminho/para/castopod
sudo chown -R www-data:www-data /caminho/para/castopod/writable
sudo chown -R www-data:www-data /caminho/para/castopod/public/media
```