---
title: Hizivadennoù
sidebarDepth: 3
---

# Petra eo da ober evit Mont e Castopod ?

Goude mont e barzh Castopod, e c'hellit kas ar vosion diwezhañ da zizoloiñ ho stagad dre astenn ar sterenn/theurellec'hioù nevez ✨, ar sutrennoù bugoù 🐛 ha skoazellet profadurezhioù ⚡.

## Hizivadennoù miz eo bet graet

0. ⚠️ Da c'houzout a raio deoc'h heuliañ war da fardas keuz d'ar c'huzul war ho ficherien Castopod ha war ar bazenn roadennoù.

   - cf.
     [Plesk a meur eus un war-lerc'h war lerc'hañ och e vo saveteiñ fenstr saveteiñ a-raok treiñ](#plesk-a-meur-eus-un-war-larsh-war-lerch-och-e-vo-savetei-fenstr-savetin-a-raok-trein)

1. Klikit war ar bajenn
   [embannadegoù](https://code.castopod.org/adaures/castopod/-/releases) ha
   gwelet setu ma vez savet ho stagad gant ar reizhiad nevezwezhañ Castopod

   - cf.
     [Pelec'h e c'hellin kaout ho verzion Castopod ?](#pelech-e-chellin-kaout-ho-verzion-castopod)

2. Prenniwit ar bitteg embannadur nevezwezhañ enoret `Castopod Package`, goude
   e c'hallit dibunañ etre embannadurioù `zip` pe `tar.gz`

   - ⚠️ Bezit sur oc'h prenañ ar Castopod Package ha **NANN** ar C'hod Anaoudegezh.
   - Abarzh e c'hallit prenañ ar bitteg nevezwezhañ eus
     [castopod.org](https://castopod.org/)

3. War ho servijer :
   - Dilemel an holl restr nevez en oberiant d'ar restr .env hag d'ar pub-/media

     ::: info Notenn

     Gallet c'heller reiñ keveradur distrad-se war restr divyezhek warnañ ar
     processus anthirdiñ. Gwelloc'h eo
     [Strobellerezh](./security.md).

     :::

4. Hizivaet ho tac'henn bazenn eus ho pajenn `Ger-tremen ar c'hastopod` ha `Ober`
   pe drezañ:

   ```bash
   php spark castopod:database-update
   ```

5. Distrubañ gaelloù dor liveus ho c'hastopod eus ho pajenn `Ger-tremen ar
   c'hastopod` > `Ardivink` > `Hentrol ar c'hoadoù`.
6. ✨ Kavit ho stagad nevez, pezet eo bet finyeah !

::: info Notenn

Gallet c'haller ober gant plijadur da vare ar vosioneoù (cf.
[Bladenn kasidañ embannadoù](https://code.castopod.org/adaures/castopod/-/releases)).

- cf.
  [N'ho mont ket da zougañ ho stadur abaoe un den na oa bet paketiget e ioa
  finyeah ?](#nho-mont-ket-da-zouga-ho-stadur-abaoe-un-den-na-oa-bet-paketiget-e-ioa-finyeah)

:::

## Mechouerioù en un doare lazhek

> En ur bennach ... 👀

## Goulennioù Frejal (FAQ)

### Pelec'h am c'haller kaout ho verzion Castopod ?

Klikit war ho c'huzul merdeiñ a vez skrivet e viz kentañ mennet war ho pannel merdeiñ
Castopod, e vez displeget e barzh an douarbenn gwerc'hentañ.

Gellit kaout ur verzion arall e ruilhenn
`Holedoù > Kefluniou > Constants.php`.
 
### N'ho mont ket da zougañ ho stadur evit ur forzh patromioù-termenet-mañ... Petra e fell deoc'h ober ?

N'eo eus gwall geen ! Bezit sur mont da lavarout, hollek re ihti.
Prenit ar finyeah nevezizh eval mivioù skrivet warzu. Pa derit echuiñ urzelioù finyeah (4), oberit anezho urzhiañ, pedompenn diwar-benn an evorikoù ha goberiennioù finyeah.

> Bezit sur ho skalpiteiñ ho stadur adalek dater eo ho stadur nevezault Castopod.

Er skouer, ma'z oc'h e `v1.0.0-alpha.42` hag oc'h ezhomm da guzumminañ evit dastum eus dastum da vroadañ bet leuniet e `v1.0.0-beta.1` :

0. (hollek anavezet) Savetit ho ficherien ha bañdit ho bazenn roadennoù.

1. Prenit ar verzion diwezhañ, greit mac'het ho ficherien hag e chom-hed ho .env hag ho pub-/media.

2. Stalit ar mivioù da zougañ war ar renk (dispar da diwar kreskiñ).

3. ✨ Fellout a ra d'an novigezh ho nechal zo gant.

### Ha n'eo ket ret da vont da zougañ a-raok ?

Kas a reomp deoc'h ho kas gantañ evit bezañ sur na gremañ ket ar pezh a c'hallfe bezañ gwisket gantoc'h-se !

A-benn pell eo gortozet deoc'h kaout az canañ ho finyeah diwezhañ eus ho ficherien Castopod ha ho bazenn roadennoù er-maez evit na gremañt ket...