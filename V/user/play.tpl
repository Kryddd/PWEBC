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
    <div id="map" class="ui-widget-header" ></div>
    <div id="persodraggable" class="ui-widget-content" style="border: solid; width: 100px; height: 100px; padding: 0.5em; float: left; margin: 10px 10px 10px 0;"></div>
</div>
