<?php

session_start();

require('./C/user.php');

if(count($_GET) != 0 && !isset($_GET['action'])) {
    require('./V/erreur404.tpl');
}
else {
    if(count($_GET) == 0) {
        if(isset($_SESSION['user'])) {
            accueil();
        }
        else {
            login();
        }
    }
    else {
        $action = $_GET['action'];
        
        $action();
    }
}

?>