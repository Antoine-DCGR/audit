<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8"/>
		<title>Ajout d'armes</title>
        <link rel="icon" type="image/x-icon" href="Contenu/img/Crimson_Arsernal.png">
		<link rel="stylesheet" href="Contenu/css/formAdd.css"/>
	</head>
	<body>
	<header>
    <a href="?controller=accueil&action=accueil"><img src="Contenu/img/Crimson_Arsernal.png" alt="Logo Crimson Arsenal" id="logo-crimson"></a>
    </header>
<?php if(isset($successMessage) && $successMessage != ""){
    echo "<h2><span class ='successMessage'>" . $successMessage . "</span></h2>" ; 
    echo "<script>
    setTimeout(function() {
            window.location.href = '?controller=accueil&action=accueil&start=1'; 
        }, 5000);
    </script>";
}
if(isset($errorMessage) && $errorMessage != ""){
    echo "<h2><span class ='errorMessage'>" . $errorMessage . "</span></h2>" ;
}
?> 

<div id="form_add">
<h2> Ajout d'Armes </h2>

<form action="?controller=set&action=addWeapon" method="POST" enctype="multipart/form-data">

    <p> Nom de l'arme : <br><input type="text" name="weaponname"  required> <br></p>

    <p> Jeu : </p>
    <select name="gamename" id="filtre-jeu" required onchange="updateGameHiddenInput()">
    <option value="" disabled selected>-- Choisissez un jeu --</option>
    <?php foreach ($game as $games): ?>
        <option value="<?= htmlspecialchars($games['gamename']) ?>" data-id="<?= htmlspecialchars($games['idgame']) ?>">
            <?= htmlspecialchars($games['gamename']) ?>
        </option>
    <?php endforeach; ?>
</select>
<input type="hidden" name="idGame" id="idGameHidden">

<script>
    function updateGameHiddenInput() {
        // Récupérer le select et l'input caché
        const select = document.getElementById('filtre-jeu');
        const hiddenInput = document.getElementById('idGameHidden');
        
        // Récupérer l'option sélectionnée et son data-id
        const selectedOption = select.options[select.selectedIndex];
        hiddenInput.value = selectedOption.getAttribute('data-id');
    }
</script>



    <!-- Menu déroulant pour les types d'armes -->
    <p>Type : </p>
    <select name="categoryname" id="filtre-arme" required onchange="updateTypeHiddenInput()">
    <option value="" disabled selected>-- Choisissez un type --</option>
    <?php foreach ($type as $types): ?>
        <option value="<?= htmlspecialchars($types['categoryname']) ?>" data-id="<?= htmlspecialchars($types['idtype']) ?>">
            <?= htmlspecialchars($types['categoryname']) ?>
        </option>
    <?php endforeach; ?>
</select>
<input type="hidden" name="idType" id="idTypeHidden">

<script>
    function updateTypeHiddenInput() {
        // Récupérer le select et l'input caché
        const select = document.getElementById('filtre-arme');
        const hiddenInput = document.getElementById('idTypeHidden');
        
        // Récupérer l'option sélectionnée et son data-id
        const selectedOption = select.options[select.selectedIndex];
        hiddenInput.value = selectedOption.getAttribute('data-id');
    }
</script>



    <p> Portée : <br><input type="number" name="range_w" required min="0" max="450" oninput="this.value = this.value.replace(/[^0-9]/g, ''); if(this.value.length > 3) this.value = this.value.slice(0, 3);"> <br></p>

    <p> Image : </br><input type="file" name="imagepath" accept="image/png" > <br></p>

    <p> Dégâts : <br><input type="number" name="damage" required  min="0" max="450" oninput="this.value = this.value.replace(/[^0-9]/g, ''); if(this.value.length > 3) this.value = this.value.slice(0, 3);"> <br></p>

    <p> Mobilité : <br><input type="number" name="mobility" required min="0" max="450" oninput="this.value = this.value.replace(/[^0-9]/g, ''); if(this.value.length > 3) this.value = this.value.slice(0, 3);"> <br></p>

    <p> Cadence de tir : <br><input type="number" name="fire_rate" required min="0" max="450" oninput="this.value = this.value.replace(/[^0-9]/g, ''); if(this.value.length > 3) this.value = this.value.slice(0, 3);"> <br></p>

    <p> Maniabilité : <br><input type="number" name="control" required min="0" max="450" oninput="this.value = this.value.replace(/[^0-9]/g, ''); if(this.value.length > 3) this.value = this.value.slice(0, 3);"> <br></p>

    <p> Précision : <br><input type="number" name="accuracy" required min="0" max="450" oninput="this.value = this.value.replace(/[^0-9]/g, ''); if(this.value.length > 3) this.value = this.value.slice(0, 3);"> <br></p>

    <p> Son : <br><input type="file" name="sound" > <br></p>

    <p> Description : <br><textarea name="description" style="resize: none;" required></textarea> <br></p>

    <p> Anecdote : <br><textarea name="anecdote" style="resize: none;" required></textarea> <br></p>

    <button type="submit">Ajouter</button>
</form>

</div>

<script>
    document.querySelector('form').addEventListener('submit', function (e) {
        const inputs = document.querySelectorAll('input[type="number"]');
        let isValid = true;

        inputs.forEach(input => {
            const value = parseFloat(input.value);
            if (value < 0 || value > 450) {
                alert(`Le champ "${input.name}" doit être compris entre 0 et 450.`);
                isValid = false;
            }
        });

        if (!isValid) {
            e.preventDefault(); // Empêche l'envoi du formulaire
        }
    });
</script>
