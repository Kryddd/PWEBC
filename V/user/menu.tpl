<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">Trouvez le lieu!</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.php?controle=user&action=accueil">Accueil</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.php?controle=user&action=play">Jouer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.php?controle=user&action=ranking">Classement</a>
            </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><a href="index.php?controle=user&action=disconnect">Se d&eacute;connecter</a></button>
        </form>
    </div>
</nav>