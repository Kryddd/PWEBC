<?php

require("./M/configDB.php");

if(!isset($dbh)) {
    try {
        $dbParam = 'mysql:host=' . $host . ';dbname=' . $dbname;
        $dbh = new PDO($dbParam, $user, $pass);
    }
    catch(Exception $e) {
        die('Erreur PDO : ' . $e->getMessage());
    }
}