---
title: Aktualizacja
sidebarDepth: 3
---

# Jak zaktualizować Castopod?
Po zainstalowaniu Castopod, możesz zaktualizować swoją instancję do najnowszej wersji, aby skorzystać z najnowszych funkcji ✨, poprawek błędów 🐛 i usprawnień wydajności ⚡.

## Instrukcje aktualizacji

0. ⚠️ Przed przeprowadzeniem aktualizacji zalecamy wykonanie kopii zapasowej plików Castopod oraz bazy danych.

   - patrz
     [Czy powinienem wykonać kopię zapasową przed aktualizacją?](#czy-powinienem-wykonać-kopię-zapasową-przed-aktualizacją)

1. Przejdź do strony
   [releases page](https://code.castopod.org/adaures/castopod/-/releases) i
   sprawdź, czy twoja instancja jest zgodna z najnowszą wersją Castopod.

   - patrz
     [Gdzie mogę znaleźć wersję Castopod?](#gdzie-mogę-znaleźć-wersję-castopod)

2. Pobierz najnowszy pakiet wydania o nazwie `Castopod Package`, możesz wybrać
   między archiwami `zip` lub `tar.gz`.

   - ⚠️ Upewnij się, że pobierasz Pakiet Castopod, a **NIE** Kod źródłowy.
   - Zauważ, że najnowszy pakiet możesz również pobrać z
     [castopod.org](https://castopod.org/).

3. Na swoim serwerze:

   - Usuń wszystkie pliki, oprócz `.env` i `public/media`.
   - Skopiuj nowe pliki z pobranego pakietu na swój serwer.

     ::: info Note

     Być może będziesz musiał ponownie ustawić uprawnienia plików tak, jak to
     zrobiłeś podczas procesu instalacji. Sprawdź
     [Security Concerns](./security.md).

     :::

4. Zaktualizuj schemat bazy danych ze strony `Castopod Admin` > `About` lub
   wykonaj polecenie:

   ```bash
   php spark castopod:database-update
   ```

5. Wyczyść pamięć podręczną ze strony `Castopod Admin` > `Settings` > `general` >
   `Housekeeping`.
6. ✨Ciesz się swoją nową instancją, skończyłeś!

::: info Note

Wersje mogą być dostarczane z dodatkowymi instrukcjami aktualizacji (patrz
[releases notes page](https://code.castopod.org/adaures/castopod/-/releases)).

- patrz
  [Nie aktualizowałem mojej instancji od dłuższego czasu... Co powinienem zrobić?](#nie-aktualizowałem-mojej-instancji-od-dłuższego-czasu-co-powinienem-zrobić)

:::

## Całkowicie zautomatyzowane aktualizacje

> Coming soon... 👀

## Najczęściej Zadawane Pytania (FAQ)

### Gdzie mogę znaleźć wersję Castopod?

Przejdź do panelu administracyjnego Castopod, wersja wyświetli się na dole po lewej stronie.

Możesz również znaleźć wersję w aplikacji
`> Konfiguracja > Constantes.php` folderu.

### Nie aktualizowałem mojej instancji od dłuższego czasu... Co powinienem zrobić?

Nie ma problemu! Po prostu uzyskaj najnowszą wersję, opisaną powyżej. Podczas wykonywania instrukcji aktualizacji (4) wykonuj je sekwencyjnie, od najstarszej do najnowszej.

> Powinieneś wykonać kopię zapasową instancji zgodnie z datą Twojej ostatniej aktualizacji Castopod.

Na przykład, jeśli posiadasz wersję `v1.0.0-alpha.42` i chcesz zaktualizować do `v1.0.0-beta.1`:

0. (silnie zalecane) Zrób kopię zapasową swoich plików i bazy danych.

1. Pobierz najnowszą wersję, zastępując swoje pliki, ale zachowaj `.env` i `public/media`.

2. Wykonuj instrukcje aktualizacji po kolei (od najstarszej do najnowszej).

3. ✨ Twoja nowa instancja jest gotowa!

### Czy powinienem wykonać kopię zapasową przed aktualizacją?

Radzimy tak zrobić, żeby w razie czego nie stracić wszystkiego!

Generalnie zalecamy regularne tworzenie kopii zapasowych plików Castopod i bazy danych, aby uniknąć utraty wszystkiego...