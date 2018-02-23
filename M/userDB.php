<?php

function loginDB($login, $password) {
    /*require("./M/connectDB.php");
    
    $statement = $dbh->prepare("SELECT * FROM utilisateur
    WHERE login = :login AND password = :password");
    
    $statement->bindParam(':login', $login);
    $statement->bindParam(':password', $password);
	
	//choper le link de la DB pour le mettre dans $link
	$res = mysqli_query($link,$statement) or die ('erreur de requete : ' . $statement);
	if (mysqli_num_rows($res)> 0) {
		$_SESSION['user'] = mysqli_fetch_assoc($res);
		
		$boolConnectStatement = "UPDATE utilisateur SET bConnect = '1' WHERE login = '".$_SESSION['user']['login']."';";
		//choper le link de la DB
		mysqli_query($link,$boolConnectStatement) or die ('erreur de requete : ' . $boolConnectStatement);
		
		return true;
	}	
	else {
		return false;
	}*/
    return true;
}

?>