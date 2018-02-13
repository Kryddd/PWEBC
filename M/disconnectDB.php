<?php

function disconnectDB() {
	require("M/connectDB.php");
	if(isset($_SESSION['user'])) {
		$sqlDisconnect = "UPDATE utilisateur SET bConnect = '0' WHERE login = '".$_SESSION['user']['login']."';";
		//choper le link de la DB
		mysqli_query($link,$sqlDisconnect) or die ('erreur de requete : ' . $sqlDisconnect);
	}
}

?>