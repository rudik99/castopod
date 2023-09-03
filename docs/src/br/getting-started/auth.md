# Dilennadur ha Aotreoù

Gestionet eo dilennadur ha aotreoù e Castopod en ur ober gant `codeigniter/shield` kevreet gant ar gerioù doujet. Kinniget e vez al rolloù ha dilennadurioù war duo stumm div niver :

1. [war lec'h an enklask](#1-rolloù-ha-dilennadurioù-war-lec'h-an-enklask)
2. [diwar-benn ur podcast](#2-rolloù-ha-dilennadurioù-diwar-benn-ur-podcast)

## 1. Rolloù ha dilennadurioù war lec'h an enklask

### Rolloù war lec'h an enklask

<!-- AUTH-INSTANCE-ROLES-LIST:START - Na sistañ na kemmoñ an devezh-mañ -->

| rol          | deskrivadur                                              | dilennadurioù                                                                                                                                                       |
| ------------ | -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Super admin  | Diell du uriñ war Castopod.                              | admin.\*, podcasts.\*, users.manage, persons.manage, pages.manage, fediverse.manage-blocks                                                                       |
| Tolter       | Manaj an danvez en Castopod.                             | podcasts.create, podcasts.import, persons.manage, pages.manage                                                                                                    |
| Podcaster    | An implijerien a veva gant Castopod.                      | admin.access                                                                                                                                                       |

<!-- AUTH-INSTANCE-ROLES-LIST:END -->

### Dilennadurioù war lec'h an enklask

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:START - Na sistañ na kemmoñ an devezh-mañ -->

| dilennadur              | deskrivadur                                                                                     |
| ----------------------- | ----------------------------------------------------------------------------------------------- |
| admin.access            | Kerzhel da zenvel eno adalek kêr maez d'ar mareoù Castopod e vez diskouezhet.                    |
| admin.settings          | Kerzhel da aked da preferadennoù Castopod.                                                      |
| users.manage            | Kerzhel da monedañ an implijerien e Castopod.                                                    |
| persons.manage          | Kerzhel da monedañ ar brudennoù.                                                                 |
| pages.manage            | Kerzhel da monedañ ar bajennoù.                                                                 |
| podcasts.view           | Kerzhel da welout an holl podcastoù.                                                            |
| podcasts.create         | Kerzhel da grouiñ podcastoù nevez.                                                              |
| podcasts.import         | Kerzhel da imporzhiañ podcastoù.                                                                |
| fediverse.manage-blocks | Kerzhel da ostilhoù blokea castorien/tirioù fediverse da gomz diouzh Castopod.                  |

<!-- AUTH-INSTANCE-PERMISSIONS-LIST:END -->

## 2. Rolloù ha dilennadurioù diwar-benn ur podcast

### Rolloù war buhez an enklask

<!-- AUTH-PODCAST-ROLES-LIST:START - Na sistañ na kemmoñ an devezh-mañ -->

| rol       | deskrivadur                                                                     | dilennadurioù                                                                                                                                                                                                                |
| --------- | ------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Admin     | Kontroll gwirouesel ouzh ar podcast #{id}.                                      | \*                                                                                                                                                                                                                         |
| Reder     | Manaj ar c'hoant hag an embannadur war ar podcast #{id}.                        | gwelet, kemm, embregiñ treuzkas, embregiñ urzhiataerien, embregiñ platfomoù, embregiñ embannadurioù, embregiñ niverennadennoù, kemm embregiñ, dilemel embregiñ, manaj embregiñ urzhiataerien, manaj embregiñ trolioù,
manaj embregiñ embannadurioù, manaj embregiñ commentoù |
| Aotrou    | Manaj kontant ar podcast #{id}, met ne c'helle ket embannout anezho.           | gwelet, manaj urzhiataerien, niverennadennoù, kemm niverennadennoù embregiñ, dilemel niverennadennoù                                                                                                                                                             |
| Devezhmat | Ousitan allenn eus ar podcast #{id}.                                            | gwelet, kemm niverennadennoù                                                                                                                                                                                                |

<!-- AUTH-PODCAST-ROLES-LIST:END -->

### Dilennadurioù war buhez an enklask

<!-- AUTH-PODCAST-PERMISSIONS-LIST:START - Na sistañ na kemmoñ an devezh-mañ -->

| dilennadur                      | deskrivadur                                                                                          |
| ------------------------------ | ---------------------------------------------------------------------------------------------------- |
| gwelet                         | Gwelet daspyegelezh ha maez ar podcast #{id}.                                                        |
| kemm                           | Kemmañ ar podcast #{id}.                                                                             |
| dilemel                        | Dilemel ar podcast #{id}.                                                                            |
| embregiñ treuzkas              | Kemmañ ar podcast treuzkaset #{id}.                                                                  |
| embregiñ urzhiataerien         | Gwiriañ/neuzeiañ embregiñ urzhiataerienient eus ar podcast #{id}.                                    |
| embregiñ plaennerion           | Gellet kempuniañ/skartañ ereuredoù al lunennañ embregel ar podcast #{id}.                           |
| embregiñ embannadurioù         | Kemmañ ar podcast #{id}.                                                                             |
| embregiñ niverennadennoù       | Gwelet ha selaou treuzkas ar podcast #{id}.                                                          |
| embregiñ abonadennoù           | Gwiriañ/neuzeiañ embregiñ an abonadennou eus ar podcast #{id}.                                       |
| embregiñ embregelourion        | Gwiriañ/neuzeiañ embregiñ embregelourion ar podcast #{id}.                                           |
| embregiñ platfomoù             | Gellet stlennu/dilemel liammoù etre ar podcast ha platfomoù #{id}.                                   |
| embregiñ embregeriñ            | Gell an embregiñ ar podcast #{id} embregeriñ.                                                        |
| embregiñ niverennadennoù       | Gwiriañ/neuzeiañ embregiñ niverennadennoù eus ar podcast #{id}.                                      |
| embregiñ treuzkredoù           | Gwiriañ/neuzeiañ embregiñ treuzkredoù video pe sonenn eus ar podcast #{id}.                         |
| embregiñ embregelouriezhioù    | Gwiriañ/neuzeiañ embregiñ embregelouriezhioù eus ar podcast #{id}.                                    |
| embregiñ commentoù             | Kemmañ/Seleiñ an aozerentoù war ur video eus ar podcast #{id}.                                       |

<!-- AUTH-PODCAST-PERMISSIONS-LIST:END -->