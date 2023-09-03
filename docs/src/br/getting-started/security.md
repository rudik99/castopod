---
title: Gwiriadiad
---

# Gwestiynau diogelwch

Mae Castopod wedi'i ddatblygu ar [CodeIgniter4](https://codeigniter.com/), fframwaith PHP sy'n annog
[arddulliau diogelwch da](https://codeigniter.com/user_guide/concepts/security.html).

Er mwyn sicrhau diogelwch eich copi ac osgoi ymosodiadau drwg, rydym yn argymell i chi ddiweddaru hawliau'r ffeiliau yn Castopod ar ôl y gosod a phob diweddariad (ac osgoi unrhyw gamgymeriadau mynediad i'r ffeiliau) :

- Rhaid i'r ffolder `writable/` fod ar gael i **darllen** ac i **ysgrifennu**.
- Rhaid i'r ffolder `public/media/` fod ar gael i **darllen** ac i
  **ysgrifennu**.
- Rhaid i unrhyw ffeil arall fod ar gael i **darllen yn unig**.

Er enghraifft, os ydych chi'n defnyddio Apache neu NGINX gyda Ubuntu, gallwch gychwyn y gorchmynion canlynol:

```bash
sudo chown -R root:root /path/to/castopod
sudo chown -R www-data:www-data /path/to/castopod/writable
sudo chown -R www-data:www-data /path/to/castopod/public/media
```