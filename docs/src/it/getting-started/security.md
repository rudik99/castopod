---
title: Sicurezza
---

# Domande di sicurezza

Castopod è sviluppato su [CodeIgniter4](https://codeigniter.com/), un framework PHP che promuove [buone pratiche di sicurezza](https://codeigniter.com/user_guide/concepts/security.html).

Per garantire la massima sicurezza della tua applicazione e prevenire attacchi malevoli, ti consigliamo di aggiornare le autorizzazioni dei file di Castopod dopo l'installazione e ogni aggiornamento (evitando errori di accesso ai file):

- La cartella `writable/` deve essere accessibile in **lettura** e **scrittura**.
- La cartella `public/media/` deve essere accessibile in **lettura** e **scrittura**.
- Qualsiasi altro file deve essere accessibile in **sola lettura**.

Ad esempio, se stai utilizzando Apache o NGINX con Ubuntu, puoi eseguire i seguenti comandi:

```bash
sudo chown -R root:root /percorso/di/castopod
sudo chown -R www-data:www-data /percorso/di/castopod/writable
sudo chown -R www-data:www-data /percorso/di/castopod/public/media
```