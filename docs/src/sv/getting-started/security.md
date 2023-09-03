---
title: Säkerhet
---

# Säkerhetsfrågor

Castopod utvecklas med [CodeIgniter4](https://codeigniter.com/), ett PHP-ramverk som främjar
[goda säkerhetspraxis](https://codeigniter.com/user_guide/concepts/security.html).

För att säkerställa bästa möjliga säkerhet för din instans och för att undvika skadliga attacker, rekommenderar vi att du uppdaterar filbehörigheterna för Castopod efter installationen och varje uppdatering (och undviker felaktiga åtkomsträttigheter till filer):

- Mappen `writable/` bör vara åtkomlig för **läsning** och **skrivning**.
- Mappen `public/media/` bör vara åtkomlig för **läsning** och **skrivning**.
- Alla andra filer bör vara åtkomliga endast för **läsning**.

Till exempel, om du använder Apache eller NGINX med Ubuntu, kan du köra följande kommandon:

```bash
sudo chown -R root:root /path/to/castopod
sudo chown -R www-data:www-data /path/to/castopod/writable
sudo chown -R www-data:www-data /path/to/castopod/public/media
```