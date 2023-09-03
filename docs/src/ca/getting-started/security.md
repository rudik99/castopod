---
title: Seguretat
---

# Qüestions de seguretat

Castopod està desenvolupat amb [CodeIgniter4](https://codeigniter.com/), un
framework PHP que fomenta les
[bones pràctiques de seguretat](https://codeigniter.com/user_guide/concepts/security.html).

Per garantir la màxima seguretat de la teva instància i evitar atacs maliciosos,
et recomanem actualitzar els permisos dels fitxers de Castopod després de la
instal·lació i després de cada actualització (i evitar errors d'accés als fitxers):

- La carpeta `writable/` ha de ser accessible en **lectura** i en **escriptura**.
- La carpeta `public/media/` ha de ser accessible en **lectura** i en **escriptura**.
- qualsevol altre fitxer ha de ser accessible només en **lectura**.

Per exemple, si utilitzes Apache o NGINX amb Ubuntu, pots executar les següents
comandes:

```bash
sudo chown -R root:root /ruta/fins/a/castopod
sudo chown -R www-data:www-data /ruta/fins/a/castopod/writable
sudo chown -R www-data:www-data /ruta/fins/a/castopod/public/media
```