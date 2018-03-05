<div class="container">
    <?php var_dump($parties); ?>
    <?php $i = 0; while($parties[$i] != null) { ?>
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3><?php echo($parties[$i]['nomPartie']); ?></h3>
                </div>
                <div class="panel-body">
                    <h4>Difficult&eacute; : <?php echo($parties[$i]['difficulte']); ?></h4>
                    <form action="index.php?controle=user&action=choixPartie" method="post">
                        <div class="button">
                            <input type="submit" name="<?php echo($parties[$i]['idPartie']); ?>" class="btn btn-danger" value="Lancer" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php $i++; } ?>
</div>