<form action="index.php?action=login" method="post">
    <div>
        <label for="labUser">Login :</label>
        <input name="login" type="text" id="labUser">
    </div>
    <div>
        <label for="labPass">Password :</label>
        <input name="mdp" type="password" id="labPass">
    </div>
    <input type="submit" value="Connexion">
</form>
<?php echo($msg); ?>