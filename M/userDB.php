<?php

function loginDB($login, $password) {
    require('M/connectDB.php');
    $queryUser= 'SELECT * FROM utilisateur
    WHERE username=? AND password=?;';
    
    $prepUser = $dbh->prepare($queryUser);
    
    $prepUser->bindValue(1, $login, PDO::PARAM_STR);
    $prepUser->bindValue(2, $password, PDO::PARAM_STR);
    $prepUser->execute();
    
    $user = $prepUser->fetch();
    if($user['username'] == $login && $user['password'] == $password) {
        return true;
    }
    
    return false;
}

function userExists($username) {
    require('M/connectDB.php');
    $queryUser= 'SELECT * FROM utilisateur
    WHERE username=?;';
    
    $prepUser = $dbh->prepare($queryUser);
    
    $prepUser->bindValue(1, $username, PDO::PARAM_STR);
    $prepUser->execute();
    
    $user = $prepUser->fetch();
    
    // Si la requete n'a pas de resutat
    if($user == false) {
        return false;
    }
    
    return true;
}

function signupDB($username, $password) {
    require('M/connectDB.php');
    $insertUser = $dbh->prepare('INSERT INTO utilisateur(username, password) 
    VALUES(?, ?)');
    
    $insertUser->bindParam(1, $username);
    $insertUser->bindParam(2, $password);
    $insertUser->execute();
    
    return true;
}

?>