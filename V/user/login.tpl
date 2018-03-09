<form class="form-signin" action="index.php?controle=user&action=login" method="post">
    <h1 class="h3 mb-3 font-weight-normal">Connexion</h1>
    <label for="inputLogin" class="sr-only">Login</label>
    <input name="login" type="text" id="inputLogin" class="form-control" placeholder="Login" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input name="mdp" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Se connecter</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
</form>
<b><?php echo($msg); ?></b><br>
<a href="index.php?controle=user&action=signup" style="text-align: center;"><b>Cr&eacute;er un compte</b></a>