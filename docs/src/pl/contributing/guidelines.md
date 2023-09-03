---
title: Wytyczne
---

# Współtworzenie Castopod

Kochasz Castopod i chcesz pomóc? Bardzo dziękujemy, jest wiele do zrobienia dla każdego!

Prosimy o chwilę czasu, aby zapoznać się z tym dokumentem, aby proces współtworzenia był łatwy i skuteczny dla wszystkich zaangażowanych.

Przestrzeganie tych wytycznych pomaga w komunikacji, która świadczy o szacunku dla czasu programistów zarządzających i rozwijających ten projekt open source. W zamian, powinni oni odwzajemnić ten szacunek, odpowiadając na zgłoszone problemy lub oceniając poprawki i nowe funkcje.

::: info Notka

**Każdy** wkład na repozytorium innym niż [oryginalne repozytorium](https://code.castopod.org/adaures/castopod) nie zostanie przyjęty.

:::

## Korzystanie z systemu śledzenia problemów

[System śledzenia problemów](https://code.castopod.org/adaures/castopod/-/issues) jest preferowanym kanałem do zgłaszania [błędów](#zgłaszanie-błędów), [propozycji funkcji](#propozycje-funkcji) i [przesyłania żądań wciągnięcia zmian](#żądania-wciągnięcia-zmian).

## ⚠️ Problemy dotyczące bezpieczeństwa i luki

Jeśli napotkasz jakiekolwiek problemy dotyczące bezpieczeństwa lub luki w kodzie źródłowym Castopoda, prosimy o bezpośredni kontakt z nami drogą mailową na adres [security@castopod.org](mailto:security@castopod.org).

## Zgłaszanie błędów

Błąd to _widoczny problem_, który jest spowodowany kodem w repozytorium. Dobre zgłoszenia błędów są niezwykle pomocne - bardzo dziękujemy!

Wytyczne dotyczące zgłaszania błędów:

1. **Skorzystaj z wyszukiwarki problemów** &mdash; sprawdź, czy problem został już zgłoszony.

2. **Sprawdź, czy problem został naprawiony** &mdash; spróbuj odtworzyć go korzystając z najnowszej gałęzi `main` w repozytorium.

3. **Izoluj problem** &mdash; idealnie stwórz [testową wersję redukowaną](https://css-tricks.com/reduced-test-cases/) i przykład na żywo.

Dobre zgłoszenie błędu nie powinno wymagać dodatkowych próśb o więcej informacji. Prosimy, staraj się być jak najbardziej szczegółowy w zgłoszeniu. Jaka jest Twoja środowisku? Jakie kroki powodują wystąpienie problemu? Jakie przeglądarki i systemy operacyjne go doświadczają? Jaki jest oczekiwany rezultat? Wszystkie te szczegóły pomogą innym osobom w naprawieniu potencjalnych błędów.

>[Szablony zgłoszeń](https://docs.gitlab.com/ee/user/project/description_templates.html#using-the-templates) zostały stworzone dla tego projektu. Możesz z nich skorzystać, aby ułatwić przestrzeganie tych wytycznych.

## Propozycje funkcji

Propozycje funkcji są mile widziane. Jednak zastanów się przez chwilę, czy Twój pomysł pasuje do zakresu i celów projektu. To od _ciebie_ zależy, aby przekonać programistów projektu o wartości tej funkcji. Proszę dostarcz jak najwięcej szczegółów i kontekstu.

## Żądania wciągnięcia zmian

Dobre żądania wciągnięcia zmian &ndash; poprawki, ulepszenia, nowe funkcje, to fantastyczna pomoc. Powinny one pozostać skoncentrowane i unikać zawierania niepowiązanych zmian.

**Prosimy o zapytanie** przed przystąpieniem do znacznego żądania wciągnięcia zmian (np. implementacja funkcji, refaktoring kodu, przenoszenie do innego języka), w przeciwnym razie ryzykujesz, że spędzisz dużo czasu na czymś, co programiści projektu mogą nie chcieć scalić.

Prosimy o przestrzeganie konwencji kodowania stosowanych w całym projekcie (wcięcia, dokładne komentarze itp.) oraz innych wymagań (takich jak pokrycie testami).

Przestrzeganie poniższego procesu to najlepszy sposób na uwzględnienie Twojej pracy w projekcie:

1. [Sforkuj](https://docs.gitlab.com/ee/gitlab-basics/fork-project.html) projekt, sklonuj swoje repozytorium (`fork`) i skonfiguruj zdalne repozytoria:

```bash
# Sklonuj swoje repository (`fork`) do obecnego katalogu
git clone https://code.castopod.org/<twoja-nazwa-użytkownika>/castopod.git

# Przejdź do nowo sklonowanego katalogu
cd castopod

# Przypisz oryginalne repozytorium do zdalnego o nazwie "upstream"
git remote add upstream https://code.castopod.org/adaures/castopod.git
```

2. Jeżeli sklonowałeś repozytorium jakiś czas temu, pobierz najnowsze zmiany ze zdalnego repozytorium:

```bash
git checkout main
git pull upstream main
```

3. Utwórz nową gałąź tematyczną (od gałęzi `main`), która będzie zawierać Twoją funkcję, zmianę lub poprawkę:

```bash
git checkout -b <nazwa-gałęzi-tematycznej>
```

4. Zatwierdź swoje zmiany w logicznych częściach. Prosimy przestrzegać tych
   [wytycznych dotyczących zatwierdzania zmian w systemie Git](https://conventionalcommits.org/) lub kod nie zostanie prawdopodobnie scalony z głównym projektem. Skorzystaj z funkcji
   [przerywania interaktywnego w systemie Git](https://help.github.com/articles/about-git-rebase/)
   w celu uporządkowania swoich zmian przed ich ujawnieniem publicznie.

5. Lokalnie scal (lub przepisz historię) gałąź `dev` ze zdalnej gałęzi tematycznej:

```bash
git pull [--rebase] upstream main
```

6. Wypchnij swoją gałąź tematyczną do swojego repozytorium (`fork`):

```bash
git push origin <nazwa-gałęzi-tematycznej>
```

7. [Otwórz żądanie wciągnięcia zmian](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html#new-merge-request-from-a-fork)
   z wyraźnym tytułem i opisem.

**WAŻNE**: Przesyłając poprawkę, zgadzasz się na udostępnienie jej na licencji
[GNU AGPLv3](https://code.castopod.org/adaures/castopod/-/blob/main/LICENSE).

## Wytyczne współpracy

Istnieje kilka podstawowych zasad, które należy przestrzegać, aby zapewnić wysoką jakość projektu:

- Przed scaleniem, żądanie wciągnięcia wymaga co najmniej dwóch zatwierdzeń od współpracowników, chyba że dotyczy to zmian architektonicznych, większej funkcji itp. Jeśli tak, to co najmniej 50% rdzenia zespołu musi zgodzić się na jego scalenie, przy pełnym prawie veta każdego członka zespołu. (tj. każdy może zablokować dowolne żądanie wciągnięcia zmian)
- Żądanie wciągnięcia zmian powinno pozostać otwarte przez co najmniej dwa dni przed scaleniem (nie dotyczy to trywialnych wkładów, takich jak poprawianie literówek). W ten sposób wszyscy mają wystarczająco dużo czasu, aby się przyjrzeć.

Zawsze jesteś mile widziany, aby omawiać i proponować ulepszenia tych wytycznych.