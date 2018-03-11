<div id="choixPartie" class="container">
    <?php $i = 1; foreach($parties as $partie) { ?>
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3><?php echo($partie['nomPartie']); ?></h3>
                </div>
                <div class="panel-body">
                    <h4>Difficult&eacute; : <?php echo($partie['difficulte']); ?></h4>
                    <div class="button">
                        <input type="button" name="<?php echo($i); ?>" class="btn btn-danger btnChoix" value="Lancer" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $i++; } ?>
</div>
<div id="partie">
    <h3 id="nomPartie"></h3>
    <div class="alert alert-info"><p id="alert"></p></div>
    <div id="map" class="ui-widget-header" ></div>
	<button id="btnValider" type="button">Valider</button>
	<div id="streetview" style="width: 900px; height: 400px;"></div>
    
</div>
