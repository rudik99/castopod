---
title: Tryggleik
---

# Tryggleiksspørsmål

Castopod er utvikla på [CodeIgniter4](https://codeigniter.com/), eit PHP-rammeverk
som oppfordrar til [gode tryggleikspraksisar](https://codeigniter.com/user_guide/concepts/security.html).

For å sikre installasjonen og unngå skadelege angrep, tilråder vi at du oppdaterer
tilgangsretten til Castopod-filene etter installasjon og kvar oppdatering (og unngår
rettighetsproblem med filer):

- Mappa `writable/` skal vere tilgjengeleg for **lesing** og **skriving**.
- Mappa `public/media/` skal vere tilgjengeleg for **lesing** og **skriving**.
- Alle andre filer skal vere tilgjengelege for **berre lesing**.

Til dømes, om du brukar Apache eller NGINX med Ubuntu, kan du køyre følgande kommandoar:

```bash
sudo chown -R root:root /path/to/castopod
sudo chown -R www-data:www-data /path/to/castopod/writable
sudo chown -R www-data:www-data /path/to/castopod/public/media
```