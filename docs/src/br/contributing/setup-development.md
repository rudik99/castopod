---
title: Prevez stummañ an hennezh

sidebarDepth: 3
---

# Prevez stummañ an envoriamant ober-tre

## Aozet

[[CodeIgniter 4]](https://codeigniter.com) eo Castopod, ul laezh web o kinnig
wordpress hag oberlec'hiañ podcasts.

Ober a ra neus un envoriamant [Docker](https://www.docker.com/) evit aozadur
alistri, un `docker-compose.yml` ha `Dockerfile` a zo en an droer gwask a-drugarez da vat-da-ober.

> Ket ret deoc'h bezañ evidoc'h memestra gant Docker evitañ ober pep stapenn
> an drapo. Ma fell deoc'h implijout ho kement darzhoù unan, tepelt er
> mod-se!

## Kohed ebet evit stummañ

### 1. Ar oc'h en em winikal

0. Staliañ an diazired [docker](https://docs.docker.com/get-docker).

1. Kloniañ ar Roll ar safarez gant ober:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Krouiñ ur restr `.env` gant kabell minorel ret evidoc'h stagañ ar roll gant
   an diazired hag ober implij an diazired redis a-drugarez da c'hoarienn ar
   roll.

   ```ini
   CI_ENVIRONMENT="development"
   # Ma vez roet evidoc'h development, ec'h eo ret deoc'h rañañ `npm run dev` evitañ startañ an diazired trummennañ statik

   vite.environment="development"

   # Dre verd e veze