<?php

function loginDB($user, $password) {
    require("./M/connectDB.php");
    
    $statement = $dbh->prepare("SELECT * FROM utilisateur
    WHERE login = :user AND password = :password");
    
    $statement->bindParam(':user', $user);
    $statement->bindParam(':password', $password);
}