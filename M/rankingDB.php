<?php
function rankingDB() {
    require('M/connectDB.php');
    $resultQuery = 'SELECT U.username, J.score, P.nomPartie, J.idPartie 
    FROM joue J, utilisateur U, partie P
    WHERE U.idUtilisateur = J.idUtilisateur
    AND P.idPartie = J.idPartie
    ORDER BY P.nomPartie, J.score DESC';

    $prepResult = $dbh->prepare($resultQuery);
    $prepResult->execute();

    $ranking = $prepResult->fetchAll();
    return $ranking;
}