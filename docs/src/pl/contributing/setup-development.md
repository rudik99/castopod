---
title: Konfiguracja środowiska programistycznego
sidebarDepth: 3
---

# Skonfiguruj swoje środowisko programistyczne

## Wprowadzenie

Castopod jest aplikacją internetową opartą na frameworku `php` [CodeIgniter 4](https://codeigniter.com).

Używamy [Dockera](https://www.docker.com/), aby szybko skonfigurować środowisko deweloperskie. W projekcie w folderze głównym znajdziesz pliki `docker-compose.yml` i `Dockerfile`, które pomogą Ci rozpocząć pracę nad projektem.

> Nie potrzebujesz żadnej wiedzy na temat Dockera, aby przejść do następnych kroków. Jeśli jednak chcesz używać własnego środowiska, możesz to zrobić!

## Instrukcje konfiguracji

### 1. Wymagania wstępne

0. Zainstaluj [dockera](https://docs.docker.com/get-docker).

1. Sklonuj projekt Castopod, wykonując polecenie:

  ```
  git clone https://code.castopod.org/adaures/castopod.git
  ```

2. Utwórz plik `.env` z minimalną wymaganą konfiguracją, aby połączyć aplikację z bazą danych i skonfigurować Redis jako obsługę pamięci podręcznej:

  ```
  CI_ENVIRONMENT="development"
  # Jeśli ustawione na development, należy uruchomić `npm run dev`, aby uruchomić serwer statycznych zasobów
  vite.environment="development"

  # Domyślnie jest to ustawione na true w konfiguracji aplikacji.
  # Dla środowiska deweloperskiego należy ustawić to na false, jak na lokalnym środowisku
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

  # Możesz nie chcieć używać Redis jako obsługi pamięci podręcznej
  # Wykomentuj/usuń dwie linie powyżej i odkomentuj
  # następną linię dla pamięci podręcznej plikowej.
  #cache.handler="file"
  ```

  > _NB._ Możesz dostosować swoje środowisko, ustawiając więcej zmiennych środowiskowych w swoim niestandardowym pliku `.env`. Zobacz `env` dla przykładów lub [Przewodnik użytkownika CodeIgniter4](https://codeigniter.com/user_guide/index.html) dla więcej informacji.

3. (dla Dockera Desktop) Dodaj sklonowany projekt do `Ustawienia` > `Zasoby` > `Udostępnianie plików` w Docker Desktop.

### 2. (zalecane) Twórz w kontenerze aplikacji w VSCode

Jeśli pracujesz w VSCode, możesz skorzystać z folderu `.devcontainer/`. Definiuje on środowisko deweloperskie (kontener deweloperski) z zainstalowanymi wcześniej wymaganiami i rozszerzeniami VSCode, więc nie musisz się tym martwić. Wszystkie wymagane usługi zostaną załadowane automatycznie! 🪄

1. Zainstaluj rozszerzenie VSCode [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
2. `Ctrl/Cmd + Shift + P` > `Otwórz w kontenerze`.

  > Okno VSCode zostanie ponownie załadowane wewnątrz kontenera deweloperskiego. Oczekuj kilku minut podczas pierwszego ładowania, ponieważ budowane są wszystkie wymagane usługi.

  **Uwaga**: Kontener deweloperski uruchomi serwer php Castopoda. Podczas pracy deweloperskiej będziesz musiał uruchomić serwer deweloperski [Vite](https://vitejs.dev), aby skompilować kod TypeScript i style:

  ```bash
  # uruchom serwer deweloperski Vite
  npm run dev
  ```

  Jeśli wystąpi problem z nieuruchomieniem serwera php, możesz go ponownie uruchomić za pomocą poniższych poleceń:

  ```bash
  # uruchom serwer Castopod
  php spark serve - 0.0.0.0
  ```

3. Gotowe! 🎉

  Jesteś teraz wewnątrz kontenera deweloperskiego, możesz używać konsoli VSCode (`Terminal` > `Nowy terminal`), aby uruchomić dowolne polecenie:

  ```bash
  # PHP jest zainstalowany
  php -v

  # Composer jest zainstalowany
  composer -V

  # npm jest zainstalowane
  npm -v

  # git jest zainstalowany
  git version
  ```

  Więcej informacji znajdziesz w dokumentacji [VSCode Remote Containers](https://code.visualstudio.com/docs/remote/containers).

### 3. Zacznij pracować

Gotowe! Zaczynamy tworzyć magię, aktualizując pliki projektu! Skorzystaj z [Przewodnika użytkownika CodeIgniter4](https://codeigniter.com/user_guide/index.html), aby uzyskać więcej informacji na ten temat.

Aby zobaczyć swoje zmiany, przejdź do:

- `http://localhost:8080/` dla aplikacji Castopod
- `http://localhost:8888/` dla interfejsu phpmyadmin:

  - nazwa użytkownika: **castopod