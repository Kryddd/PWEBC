<?php

session_start();

// Vérification des parametres GET
if(count($_GET) != 0 && !(isset($_GET['action']) && isset($_GET['controle']))) {
    require('./V/erreur404.tpl');
}
else {
    if(count($_GET) == 0) { // Pas de parametres get
        
        $controle = 'user';
        require('./C/'. $controle . '.php');
        
        if(isset($_SESSION['login'])) {
            $action = 'accueil';
            $action();
        }
        else {
            $action = 'login';
            $action();
        }
    }
    else { // parametres get
        
        if(isset($_SESSION['login'])) {
            // utilisateur connecté
            
            $controle = $_GET['controle'];
            $action = $_GET['action'];
            require('./C/'. $controle . '.php');
            $action();
        }
        else {
            // utilisateur non connecté
            
            if($_GET['action'] == 'login' && $_GET['controle'] == 'user') {
                // Permet à l'utilisateur de se connecter
                $controle = $_GET['controle'];
                $action = $_GET['action'];
                require('./C/'. $controle . '.php');
                $action();
            }
            else {
                $controle = 'user';
                $action = 'login';
                require('./C/'. $controle . '.php');
                $action();
            }
        }
    }
}

?>