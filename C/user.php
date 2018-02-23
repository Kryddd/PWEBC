<?php

function login() {
    //récupère le login et mdp en POST ou les init
    $login= isset($_POST['login'])?trim($_POST['login']):'';
    $mdp= isset($_POST['mdp'])?trim($_POST['mdp']):'';
    $msg = '';

    if(count($_POST) == 0) {
        require("V/base.tpl");
    }
    else {
        require("M/userDB.php");
        if  (! loginDB($login,$mdp)) {
            $msg = "erreur de saisie";
            require('V/user/base.tpl') ;
        }
        else  { 
            $_SESSION['login'] = $login;
            $_SESSION['mdp'] = $mdp;
            var_dump($_SESSION);
            header("Location:index.php?controle=user&action=accueil");

        }
    }
}

function accueil() {
	if(!isset($_SESSION['login'])) {
		login();
	}
    require("V/base.tpl");
}

function addLocation() {
    $image= isset($_POST['image'])?($_POST['image']):'';
    $lon= isset($_POST['lon'])?($_POST['lon']):'';
    $lat= isset($_POST['lat'])?($_POST['lat']):'';

    if(count($_POST) == 0) {
        require("V/user/ajouterEndroit.tpl");
    }
    else {
        require("M/addLocationDB.php");
        addLocationDB();
    }
}

function play() {
	
	if(count($_POST) == 0) {
		accueil();
	}
	else {
		$opponent = $_POST['opponent'];
		//faire un truc avec l'opponent
		require("V/user/play.tpl");
	}
    
}

function ranking() {
    require("M/rankingDB.php");
    $ranking = rankingDB();
}

function disconnect() {
    require("M/disconnectDB.php");
    disconnectDB();
    session_destroy();
    header("Location:index.php");
}

?>