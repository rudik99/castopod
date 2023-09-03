---
title: Bezpieczeństwo
---

# Pytania dotyczące bezpieczeństwa

Castopod jest rozwijany na podstawie [CodeIgniter4](https://codeigniter.com/), frameworka PHP, który promuje [dobre praktyki z zakresu bezpieczeństwa](https://codeigniter.com/user_guide/concepts/security.html).

Aby zapewnić jak najlepsze zabezpieczenia dla Twojej instancji i uniknąć złośliwych ataków, zalecamy aktualizowanie uprawnień plików Castopoda po każdej instalacji i aktualizacji (oraz unikanie błędów dotyczących dostępu do plików):

- Folder `writable/` powinien być dostępny w trybie **odczytu i zapisu**.
- Folder `public/media/` powinien być dostępny w trybie **odczytu i zapisu**.
- Wszystkie inne pliki powinny być dostępne w trybie **tylko do odczytu**.

Na przykład, jeśli korzystasz z Apache lub NGINX z systemem Ubuntu, możesz użyć następujących poleceń:

```bash
sudo chown -R root:root /path/to/castopod
sudo chown -R www-data:www-data /path/to/castopod/writable
sudo chown -R www-data:www-data /path/to/castopod/public/media
```
