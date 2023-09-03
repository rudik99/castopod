---
title: Ρύθμιση ανάπτυξης
sidebarDepth: 3
---

# Ρύθμιση του περιβάλλοντος ανάπτυξής σας

## Εισαγωγή

Το Castopod είναι μια διαδικτυακή εφαρμογή βασισμένη στο πλαίσιο `php`
[CodeIgniter 4](https://codeigniter.com).

Χρησιμοποιούμε το [Docker](https://www.docker.com/) για γρήγορη δημιουργία περιβάλλοντος ανάπτυξης. Ένα
`docker-compose.yml` και ένα `Dockerfile` περιλαμβάνονται στον κατάλογο ρίζας του έργου
για να σας βοηθήσουν να ξεκινήσετε τη συνεισφορά σας.

> Δεν χρειάζεστε καμία προηγούμενη γνώση του Docker για να ακολουθήσετε τα επόμενα βήματα.
> Ωστόσο, αν επιθυμείτε να χρησιμοποιήσετε το δικό σας περιβάλλον, μπορείτε να το κάνετε ελεύθερα!

## Οδηγίες εγκατάστασης

### 1. Προαπαιτούμενα

0. Εγκαταστήστε [docker](https://docs.docker.com/get-docker).

1. Κλωνοποιήστε το έργο Castopod εκτελώντας:

   ```bash
   git clone https://code.castopod.org/adaures/castopod.git
   ```

2. Δημιουργήστε ένα αρχείο `.env` με τις ελάχιστες απαιτούμενες ρυθμίσεις για να συνδέσετε την εφαρμογή με τη
   βάση δεδομένων και να χρησιμοποιήσετε την Redis ως χειριστή κρυφής κρατήσεως:

   ```ini
   CI_ENVIRONMENT="development"
   # Αν οριστεί ως development, πρέπει να εκτελέσετε `npm run dev` για να ξεκινήσετε τον διακομιστή στατικών πόρων
   vite.environment="development"

   # Από προεπιλογή, αυτό ορίζεται σε true στις ρυθμίσεις της εφαρμογής.
   # Για ανάπτυξη, πρέπει να οριστεί σε false καθώς βρίσκεται
   # σε τοπικό περιβάλλον
   app.forceGlobalSecureRequests=false

   app.baseURL="http://localhost:8080/"
   media.baseURL="http://localhost:8080/"

   admin.gateway="cp-admin"
   auth.gateway="cp-auth"

   database.default.hostname="mariadb"
   database.default.database="castopod"
   database.default.username="castopod"
   database.default.password="castopod"

   cache.handler="redis"
   cache.redis.host = "redis"

   # Μπορεί να μην θέλετε να χρησιμοποιήσετε την Redis ως χειριστή κρυφής κρατήσεως
   # Σχολιάστε/αφαιρέστε τις δύο παραπάνω γραμμές και ξεχολιάστε
   # την επόμενη γραμμή για κρατήσεις σε αρχείο.
   #cache.handler="file"
   ```

   > _NB._ Μπορείτε να ρυθμίσετε περισσότερες μεταβλητές περιβάλλοντος προσαρμόζοντας το αρχείο `.env`. Δείτε το
   > παράδειγμα env ή τον
   > [Οδηγό Χρήστη CodeIgniter4](https://codeigniter.com/user_guide/index.html)
   > για περισσότερες πληροφορίες.

3. (για το docker