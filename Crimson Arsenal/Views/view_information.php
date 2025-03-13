<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title> Crimson Arsenal</title>
    <link rel="stylesheet" href="Contenu/css/info_arme.css"/>
    <link rel="icon" type="image/x-icon" href="Contenu/img/Crimson_Arsernal.png">
</head>
<body>
<header>
    <a href="?controller=accueil&action=accueil&start=1">
        <img src="Contenu/img/Crimson_Arsernal.png" alt="Logo Crimson Arsenal" id="logo-crimson">
    </a>
</header>

<div id="animated-background">
    <div class="glow"></div>
</div>

<div class="content">
    <div id="arme">
        <img src="./<?php echo $infos["imagepath"]; ?>"/>
        <h3 style="font-family: <?php echo htmlspecialchars($infos['gamename']) === 'Valorant' ? "'Orbitron'" : "'Russo One'"; ?>;">
            <?php echo htmlspecialchars($infos["weaponname"]); ?>
        </h3>
    </div>
    <table>
    <?php
        $max_value = 450; 
        echo "<tr>
            <td>
                <div class='bar-container'>";

        // Liste des statistiques et leur clé correspondante dans `$infos`
        $stats = [
            'Portée' => 'range_w',
            'Dégâts' => 'damage',
            'Mobilité' => 'mobility',
            'Cadence de tirs' => 'fire_rate',
            'Maniabilité' => 'control',
            'Précision' => 'accuracy',
        ];

        // Boucle sur chaque statistique
        foreach ($stats as $label => $key) {
            $value = isset($infos[$key]) ? (float) $infos[$key] : 0; // Convertit en nombre ou assigne 0 si non défini
            $width = ($value > 0) ? min(100, ($value / $max_value) * 100) : 0; // Vérification de la division par zéro

            echo "<div class='stat'>
                    <p>$label</p>
                    <div class='bar'>
                        <div class='jauge' style='width: $width%;'></div>
                    </div>
                </div>";
        }

        echo "    </div>
            </td>
            <td style=\"font-family: " . (htmlspecialchars($infos['gamename']) === 'Valorant' ? "'Orbitron'" : "'Russo One'") . ";\">
                " . htmlspecialchars($infos['gamename']) . "
            </td>
            <td>" . htmlspecialchars($infos['categoryname']) . "</td>
            <td>" . htmlspecialchars($infos['description']) . "</td>
            <td>" . htmlspecialchars($infos['typename']) . "</td>
            <td>" . htmlspecialchars($infos['anecdote']) . "</td>
            <td><p><strong>Apercu du son de l'arme : </strong></p><audio controls><source src=" . htmlspecialchars($infos['sound']) . " ". "type='audio/ogg'></audio></td>
        </tr>";
    ?>
    </table>
</div>
<div id="scroll-button" onclick="scrollToBottom()">
    <div class="arrow"></div>
</div>

<script src="Contenu/js/info_arme.js"></script>
<script>
    // Gestionnaire du bouton
    const scrollButton = document.getElementById("scroll-button");

    // Fonction pour défiler vers le bas
    function scrollToBottom() {
        window.scrollTo({
            top: document.body.scrollHeight,
            behavior: "smooth",
        });

        // Cacher le bouton après clic
        scrollButton.style.display = "none";
    }

    // Faire réapparaître le bouton lorsque l'utilisateur remonte
    window.addEventListener("scroll", () => {
        if (window.scrollY < document.body.scrollHeight - window.innerHeight - 100) {
            scrollButton.style.display = "flex"; // Réapparaît
        } else {
            scrollButton.style.display = "none"; // Disparaît quand on atteint le bas
        }
    });
</script>


</body>
</html>
