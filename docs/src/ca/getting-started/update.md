---
title: Actualització
sidebarDepth: 3
---

# Com instal·lar Castopod ?

Després d'instal·lar Castopod, pots actualitzar la teva instància a la
darrera versió per poder gaudir de les últimes funcionalitats ✨, correccions de
bugs 🐛 i millores de rendiment ⚡.

## Instruccions d'actualització

0. ⚠️ Abans de realitzar cap actualització, us recomanem encaridament que feu una còpia de seguretat
   dels vostres fitxers de Castopod i de la base de dades.

   - cf.
     [He de fer una còpia de seguretat abans de fer la actualització?](#he-de-fer-una-còpia-de-seguretat-abans-de-fer-la-actualització)

1. Vés a la
   [pàgina de versions](https://code.castopod.org/adaures/castopod/-/releases) i
   comprova si la teva instància està actualitzada a l'última versió de Castopod.

   - cf.
     [On puc trobar la versió de Castopod?](#on-puc-trobar-la-versió-de-castopod)

2. Descarrega el paquet de l'última versió anomenat `Paquet de Castopod`, pots triar
   entre els arxius `zip` o `tar.gz`.

   - ⚠️ Assegura't de descarregar el Paquet de Castopod i **NO** el Codi Font.
   - Tingues en compte que també pots descarregar l'últim paquet des de
     [castopod.org](https://castopod.org/).

3. Al teu servidor:

   - Esborra tots els fitxers menys `.env` i `public/media`.
   - Copia els nous fitxers del paquet descarregat al teu servidor.

     ::: info Nota

     Potser hauràs de configurar de nou els permisos dels fitxers com
     s'indica en el procés d'instal·lació. Consulta
     [Qüestions de seguretat](./security.md).

     :::

4. Actualitza l'esquema de la teva base de dades des de la pàgina `Castopod Admin` > `Sobre l'aplicació` o bé
   executant:

   ```bash
   php spark castopod:database-update
   ```

5. Netega la memòria cau des de l'opció `Castopod Admin` > `Configuració` > `general` > `Netega`.
6. ✨ Gaudeix de la teva nova instància, has acabat!

::: info Nota

Les versions poden tenir instruccions d'actualització adicionals (consulta la
[pàgina de les notes de la versió](https://code.castopod.org/adaures/castopod/-/releases)).

- cf.
  [Fa molt de temps que no actualitzo la meva instància... Què hauria de fer?](#fa-molt-de-temps-que-no-actualitzo-la-meva-instància-què-hauria-de-fer)

:::

## Actualitzacions totalment automatitzades

> Properament... 👀

## Preguntes Més Freqüents (PMF)

### On puc trobar la versió de Castopod?

Ves al teu panell d'administració de Castopod, la versió es mostra a la part inferior esquerra.

També pots trobar la versió a l'aplicació
`> Configuració > Constants.php` carpeta.

### Fa molt de temps que no actualitzo la meva instància... Què hauria de fer?

Cap problema! Només has de seguir els passos per aconseguir l'última versió com s'explica
anteriorment. Quan executis les instruccions d'actualització (4), executa-les
seqüencialment, de més antiga a més recent.

> Hauries de fer una còpia de seguretat de la teva instància segons la data de l'última actualització
> de Castopod.

Per exemple, si estàs a la versió `v1.0.0-alpha.42` i vols actualitzar a
la versió `v1.0.0-beta.1`:

0. (fortament recomanat) Fes una còpia de seguretat dels teus fitxers i de la teva base de
   dades.

1. Descarrega l'última versió, sobreescriu els teus fitxers conservant
   `.env` i `public/media`.

2. Executa les instruccions d'actualització una per una (de més antiga a més recent).

3. ✨ La teva nova instància està llesta!

### He de fer una còpia de seguretat abans de fer la actualització?

Et recomanem que ho facis, per si de cas alguna cosa anés malament!

En general, et recomanem que facis còpies de seguretat regulars dels teus fitxers de Castopod i de la teva
base de dades per evitar perdre-ho tot...