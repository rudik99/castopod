---
title: Sicherheit
---

# Sicherheitsfragen

Castopod wird auf [CodeIgniter4](https://codeigniter.com/) entwickelt, einem PHP-Framework, das zu "Best Practices" in Bezug auf Sicherheit ermutigt.

Um die Sicherheit Ihrer Instanz optimal zu gewährleisten und böswillige Angriffe zu verhindern, empfehlen wir Ihnen, die Dateiberechtigungen von Castopod nach der Installation und jedem Update zu aktualisieren (und Fehler im Dateizugriff zu vermeiden):

- Der Ordner `writable/` muss sowohl **lese- als auch schreibbar** sein.
- Der Ordner `public/media/` muss sowohl **lese- als auch schreibbar** sein.
- Alle anderen Dateien sollten nur **lesbar** sein.

Wenn Sie beispielsweise Apache oder NGINX mit Ubuntu verwenden, können Sie die folgenden Befehle ausführen:

```bash
sudo chown -R root:root /path/to/castopod
sudo chown -R www-data:www-data /path/to/castopod/writable
sudo chown -R www-data:www-data /path/to/castopod/public/media
```