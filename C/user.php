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
        // Vérifie l'utilisateur et le mot de passe
        if  (!loginDB($login,$mdp)) {
            $msg = "erreur de saisie";
            require('V/base.tpl') ;
        }
        else  { 
            $_SESSION['login'] = $login;
            $_SESSION['mdp'] = $mdp;
            var_dump($_SESSION);
            header("Location:index.php?controle=user&action=accueil");

        }
    }
}

function signup() {
    $msg = '';
    if(count($_POST) == 0) {
        require("V/base.tpl");
    }
    else {
        require('M/userDB.php');
        
        // Prise en compte des erreurs
        if($_POST['mdp'] != $_POST['mdpConfirm']) {
            $msg = 'Les mots de passe ne sont pas identiques!';
        }
        else if(userExists($_POST['login'])) {
            $msg = 'Le nom d utilisateur est deja utilise';
        }
        else if(!signupDB($_POST['login'], $_POST['mdp'])) {
            // Ajout de l'utilisateur dans la BDD
            $msg = 'Erreur DB!';
        }
        else {
            // Pas d'erreur
            $msg = 'Votre compte est enregistre  ';
        }
        
        require('V/base.tpl');
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
	require("M/userDB.php");
	if(count($_POST) == 0) {
		// Récupères les parties dans la DB
        $parties = fetchParties();
        
        //Affiche les parties
        require("V/base.tpl");
	}
	else {
		// Partie terminée
        // POST via ajax
	}
    
}

function getLieux() {
    // Appelée via ajax
    require("M/userDB.php");
    $lieux['data'] = fetchLieuxDB($_POST['partie']);
    
    echo(json_encode($lieux));
}

function ranking() {
    require("M/rankingDB.php");
    $ranking = rankingDB();
	
	
    require("V/base.tpl");
}

function savePartie() {
    require("M/userDB.php");
    $idUser = getIdFromLoginPwd($_SESSION['login'], $_SESSION['mdp']);
    echo(json_encode($idUser));
    saveGame($idUser['idUtilisateur'], $_POST['idPartie'], $_POST['scoreJoueur']);
    
}

function disconnect() {
    session_destroy();
    header("Location:index.php");
}

?>