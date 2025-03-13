<?php
if (!isset($_SESSION)) {
    session_start();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title> Crimson Arsenal</title>
    <link rel="icon" type="image/x-icon" href="Contenu/img/Crimson_Arsernal.png">
    <link rel="stylesheet" href="Contenu/css/formConnect.css"/>
</head>
<body>
<header>
    <a href="?controller=accueil&action=accueil&start=1">
        <img src="Contenu/img/Crimson_Arsernal.png" alt="Logo Crimson Arsenal" id="logo-crimson">
    </a>
</header>

<div id="formConnect">
    <form action="?controller=admin&action=connect" method="POST" id="form_connect">
        <p>
            Identifiant
            <input type="text" name="iduser" placeholder="Entrez votre ID" required=''>
        </p>
        <p>
            Mot de passe
            <input type="password" name="passworduser" placeholder="Entrez votre mot de passe" required=''>
        </p>
        
        <input type="submit" name="submit" value="Connexion">   
    </form>
    <?php
    if (isset($errorMessage) && trim($errorMessage) != '') {
        echo "<span class='msg_error'>" . $errorMessage . "</span>";
    }
?>

</div>



</body>
</html>
