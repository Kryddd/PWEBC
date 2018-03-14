# PWEBC

### Prérequis
* Wamp server ou serveur PHP5 et MySQL

## Installation
* Cloner ou télécharger https://github.com/Kryddd/PWEBC.git dans le répertoire www de votre serveur
* Créer une nouvelle base de données dans PHPMyAdmin
* Executer le fichier SQL [dbPWEBC.sql](https://github.com/Kryddd/PWEBC/blob/master/dbPWEBC.sql) dans votre DB MySQL
* Changer le fichier [M/configDB.php](https://github.com/Kryddd/PWEBC/blob/master/M/configDB.php) selon le nom, le login et le mot de passe de votre DB


#### M/config.php
```php
$host = "localhost";
$db = "/* Nom de la base de données */";
$user = "/* Login de la base de données */";
$pass = "/* Mot de passe de la base de données */";
```

## Règles du jeu
Le jeu consiste à trouver dans quel pays un panorama se trouve
* Par exemple : si l'on observe la tour Eiffel sur le panorama, il faut cliquer sur la France sur la carte.

L'utilisateur a la possibilité de créer un compte, se connecter et comparer son score avec les autres joueurs.
