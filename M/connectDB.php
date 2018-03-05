<?php

require("./M/configDB.php");

if(!isset($dbh)) {
    try {
        $dbParam = 'mysql:host=' . $host . ';dbname=' . $db;
        $dbh = new PDO($dbParam, $user, $pass);
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch(Exception $e) {
        die('Erreur PDO : ' . $e->getMessage());
    }
}

?>