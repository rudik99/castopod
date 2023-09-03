---
title: Instalacja
sidebarDepth: 3
---

# Jak zainstalować Castopod?

Castopod został stworzony tak, aby instalacja była łatwa. Niezależnie od tego,
czy korzystasz z hostingu dedykowanego czy współdzielonego, możesz zainstalować
go na większości serwerów internetowych obsługujących PHP-MySQL.

::: tip Wskazówka

Opracowaliśmy oficjalne obrazy Docker dla Castopoda!

Jeśli wolisz używać Dockera, możesz pominąć ten krok i przejść bezpośrednio do [dokumentacji Dockera](./docker.md) dla Castopoda.

:::

## Wymagania wstępne

- PHP w wersji 8.1
- Wersja MySQL 5.7 lub nowsza lub wersja MariaDB 10.2 lub nowsza
- Wsparcie dla HTTPS
- [Zsynchronizowany zegar](https://wiki.debian.org/NTP) dla walidacji przychodzących żądań federacji

### PHP w wersji 8.1

Wymagana jest wersja 8.1 PHP z zainstalowanymi następującymi rozszerzeniami:

- [intl](https://www.php.net/manual/pl/intl.requirements.php)
- [libcurl](https://www.php.net/manual/pl/curl.requirements.php)
- [mbstring](https://www.php.net/manual/pl/mbstring.installation.php)
- [gd](https://www.php.net/manual/pl/image.installation.php) z **JPEG**,
  **PNG** i bibliotekami **WEBP**.
- [exif](https://www.php.net/manual/pl/exif.installation.php)

Upewnij się również, że następujące rozszerzenia są włączone w Twoim PHP:

- json (włączone domyślnie - nie wyłączaj go)
- xml (włączone domyślnie - nie wyłączaj go)
- [mysqlnd](https://www.php.net/manual/pl/mysqlnd.install.php)

### Kompatybilna baza danych MySQL

> Zalecamy korzystanie z [MariaDB](https://mariadb.org).

::: warning Uwaga

Castopod działa tylko z bazą danych MySQL w wersji 5.7 lub nowszej. Wersje
5.6 (które przestały być obsługiwane 5 lutego 2021 r.) lub wcześniejsze nie
będą działać.

:::

Aby zakończyć proces instalacji, będziesz potrzebować nazwy hosta serwera, nazwy
bazy danych, nazwy użytkownika i hasła. Jeśli nie posiadasz tych informacji,
skontaktuj się z administratorem.

#### Uprawnienia dostępu

Użytkownik musi mieć co najmniej następujące uprawnienia dostępu do bazy danych, aby Castopod działał: `CREATE`, `ALTER`, `DELETE`, `EXECUTE`,
`INDEX`,`INSERT`, `SELECT`, `UPDATE`,`REFERENCES`, `CREATE VIEW`.

### (Opcjonalnie) FFmpeg w wersji 4.1.8 lub nowszej do generowania klipów wideo

Jeśli chcesz generować klipy wideo, wymagana jest wersja FFmpeg 4.1.8 lub nowsza.
Następujące rozszerzenia muszą być zainstalowane:

- biblioteka **FreeType 2** dla [gd](https://www.php.net/manual/pl/image.installation.php).

### (Opcjonalnie) Inne zalecenia

- Redis dla lepszej wydajności pamięci podręcznej.
- CDN dla pamięci podręcznej statycznych plików i lepszej wydajności.
- Brama e-mail dla przypomnienia hasła.

## Instrukcje instalacji

### Przygotowanie

0. Ożywienie serwera WWW zainstalowanymi [wymaganiami](#wymagania-wstępne)
1. Utwórz bazę danych MySQL dla Castopoda z użytkownikiem mającym odpowiednie uprawnienia i uprawnienia do modyfikacji (więcej informacji znajdziesz w dziale [Kompatybilna baza danych MySQL](#kompatybilna-baza-danych-mysql))
2. Włącz obsługę protokołu HTTPS dla swojej domeny z wykorzystaniem _certyfikatu SSL_.
3. Pobierz i rozpakuj najnowszy [pakiet Castopod](https://castopod.org/) na serwerze WWW, jeśli tego jeszcze nie zrobiłeś.
   - ⚠️ Ustaw miejsce docelowe serwera WWW na podkatalog `public/` w katalogu `castopod`.
4. Dodaj **zadania cronowe** na swoim serwerze WWW dla różnych procesów w tle (dopasuj ścieżki odpowiednio):

   ```bash
      * * * * * /path/to/php /path/to/castopod/spark tasks:run >> /dev/null 2>&1
   ```

   **Uwaga** - Jeśli nie dodasz tego zadania cron, następujące funkcje Castopoda nie będą działać:

   - Importowanie podcastu z istniejącego kanału RSS
   - Nadawanie aktywności społecznościowych obserwującym w federacji
   - Rozgłaszanie odcinków do otwartych węzłów przy użyciu [WebSub](https://en.wikipedia.org/wiki/WebSub)
   - Generowanie klipów wideo - [wymagane jest FFmpeg](#opcjonalnie-ffmpeg-w-wersji-418-lub-wyższej-do-generacji-klipów-wideo)

### (Zalecana metoda) Kreator instalacji

1. Uruchom skrypt instalacyjny Castopoda, przechodząc do strony kreatora instalacji (`https://nazwa_twojej_domeny.com/cp-install`) w swojej ulubionej przeglądarce internetowej.
2. Postępuj zgod