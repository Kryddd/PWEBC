<?php

session_start();

if(count($_GET) != 0 && !isset($_GET['action'])) {
    require('./V/erreur404.tpl');
}
else {
    if(count($_GET) == 0) {
        if(isset($_SESSION['user'])) {
            require('./V/user.php');
            play();
        }
        else {
            require('./V/login.tpl');
        }
    }
    else {
        $action = $_GET['action'];
        require('./V/user.php');
        $action();
    }
}