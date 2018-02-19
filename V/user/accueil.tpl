<!doctype html>
<?php 
    global $action;
?>

<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>Trouvez le lieu!</title>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" />

        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

        <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"></script>
        <script src="js/jeuMap.js"></script>
    </head>
    <body>
        <?php require("./V/user/" . $GLOBALS['action'] . ".tpl"); ?>
		
		<!-- créer un scrollview avec des joueurs dispos récupérés par php -->
		<form method="post" action="index.php?controle=user&action=play">
			<button type="submit" value=" <!-- selectedOpponent--> ">Jouer !</button>
		</form>
    </body>
</html>