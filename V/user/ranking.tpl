<h1>Classement</h1>

<?php 
// Récupère le nb de parties differentes
$numPartie = 1;
foreach($ranking as $entry) {
    if($entry['idPartie'] != $numPartie) {
        $numPartie++;
    }
}

?>
<?php for($countPartie = 1; $countPartie <= $numPartie; $countPartie++) { ?>

<h3><?php 
// Trouve le nom de la partie
foreach($ranking as $ligne) {
    if($ligne['idPartie'] == $countPartie) {
        echo($ligne['nomPartie']);
        break;
    }
} ?></h3>
<table class="table">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Joueur</th>
            <th scope="col">Score</th>
        </tr>
    </thead>
    <tbody>
    <?php $classement = 0; foreach($ranking as $ligne) {
        if($ligne['idPartie'] == $countPartie) { $classement++; ?>
        <tr>
            <th scope="row"><?php echo($classement); ?></th>
            <td><?php echo($ligne['username']); ?></td>
            <td><?php echo($ligne['score']); ?></td>
        </tr>
    <?php } } ?>
    </tbody>
</table>
<?php } ?>