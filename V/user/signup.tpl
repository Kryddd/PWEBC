<form class="form-signin" action="index.php?controle=user&action=signup" method="post">
    <h1 class="h3 mb-3 font-weight-normal">Cr&eacute;er un compte</h1>
    <label for="inputLogin" class="sr-only">Login</label>
    <input name="login" type="text" id="inputLogin" class="form-control" placeholder="Login" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input name="mdp" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
    <label for="inputPasswordConfirm" class="sr-only">Password confirmation</label>
    <input name="mdpConfirm" type="password" id="inputPasswordConfirm" class="form-control" placeholder="Password" required>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Continuer</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
</form>
<?php echo($msg); ?>
<a href="index.php?controle=user&action=login"><b>Se connecter</b></a>