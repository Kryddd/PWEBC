<div class="container">
    <?php $i = 0; foreach($parties as $partie) { ?>
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3><?php echo($partie['nomPartie']); ?></h3>
                </div>
                <div class="panel-body">
                    <h4>Difficult&eacute; : <?php echo($partie['difficulte']); ?></h4>
                    <form action="index.php?controle=user&action=choixPartie" method="post">
                        <div class="button">
                            <input type="submit" name="<?php echo($i); ?>" class="btn btn-danger" value="Lancer" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php $i++; } ?>
</div>