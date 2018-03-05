<!doctype html>
<?php 
global $controle;
global $action;
?>

<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Trouvez le lieu!">
        <meta name="author" content="Jacques Couderc, Pierre Couderc">
        <title>Trouvez le lieu!</title>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="./V/css/style.css">
    </head>
    <body>
        <?php if(isset($_SESSION['login'])) require("./V/user/menu.tpl"); ?>
        <?php require("./V/" . $GLOBALS['controle'] . "/" . $GLOBALS['action'] . ".tpl"); ?>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

        <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"></script>
        <script src="./V/js/jeuMap.js"></script>

    </body>
</html>