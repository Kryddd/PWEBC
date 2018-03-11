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

function getIdFromLoginPwd($login, $pwd) {
    require('M/connectDB.php');
    
    $queryUser = "SELECT idUtilisateur FROM utilisateur
    WHERE username=? AND password=?";
    
    $prepUserId = $dbh->prepare($queryUser);
    
    $prepUserId->bindValue(1, $login, PDO::PARAM_STR);
    $prepUserId->bindValue(2, $pwd, PDO::PARAM_STR);
    $prepUserId->execute();
    
    $idUser = $prepUserId->fetch();
    return $idUser;
}

function fetchParties() {
    require('M/connectDB.php');
    $partiesQuery = 'SELECT * FROM partie';
    $prepParties = $dbh->prepare($partiesQuery);
    $prepParties->execute();
    
    $parties = $prepParties->fetchAll();
    
    return $parties;
}

function fetchLieuxDB($numPartie) {
    require('M/connectDB.php');
    $queryLieux= 'SELECT * FROM lieu WHERE idPartie=?';
    
    $prepLieux = $dbh->prepare($queryLieux);
    $prepLieux->bindParam(1, $numPartie);
    $prepLieux->execute();
    
    $lieux = $prepLieux->fetchAll();
    return $lieux;
}

function saveGame($idUser, $idPartie, $score) {
    require('M/connectDB.php');
    
    // TODO Ecraser la partie précedente si le score est inferieur
    
    $insert = 'INSERT INTO joue(idUtilisateur, idPartie, score)
    VALUES(?, ?, ?)';
    
    $prepInsert = $dbh->prepare($insert);
    
    $prepInsert->bindParam(1, $idUser);
    $prepInsert->bindParam(2, $idPartie);
    $prepInsert->bindParam(3, $score);
    $prepInsert->execute();
}

