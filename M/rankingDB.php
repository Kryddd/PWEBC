<?php
	function rankingDB() {
		require('M/connectDB.php');
		$resultQuery = 'SELECT username, scoreTotal FROM utilisateur ORDER BY scoreTotal DESC';
		
		$prepResult = $dbh->prepare($resultQuery);
		$prepResult->execute();
		
		$ranking = $prepResult->fetchAll();
		
		return $ranking;
	}
?>