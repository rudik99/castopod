---
title: Veiligheid
---

# Veiligheidsvragen

Castopod is ontwikkeld op [CodeIgniter4](https://codeigniter.com/), een PHP-framework dat
[goede veiligheidspraktijken](https://codeigniter.com/user_guide/concepts/security.html) aanmoedigt.

Om de veiligheid van uw instantie te waarborgen en kwaadwillige aanvallen te voorkomen, raden we u aan de bestandsmachtigingen van Castopod bij te werken na de installatie en elke update (en fouten in bestandstoegang te vermijden):

- De map `writable/` moet **leesbaar** en **schrijfbaar** zijn.
- De map `public/media/` moet **leesbaar** en **schrijfbaar** zijn.
- Alle andere bestanden moeten alleen **leesbaar** zijn.

Bijvoorbeeld, als u Apache of NGINX gebruikt met Ubuntu, kunt u de volgende commando's uitvoeren:

```bash
sudo chown -R root:root /path/to/castopod
sudo chown -R www-data:www-data /path/to/castopod/writable
sudo chown -R www-data:www-data /path/to/castopod/public/media
```