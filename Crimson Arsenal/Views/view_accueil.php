<?php 

if (!isset($_SESSION['connect'])) {
    session_start();
}

require "view_begin.php";
?>
<div class="loader">
    <div>
        <span class="lettre">C</span>
        <span class="lettre">H</span>
        <span class="lettre">A</span>
        <span class="lettre">R</span>
        <span class="lettre">G</span>
        <span class="lettre">E</span>
        <span class="lettre">M</span>
        <span class="lettre">E</span>
        <span class="lettre">N</span>
        <span class="lettre">T</span>
    </div>
    <span class="pi">▄︻┻┳═一</span>
</div>

<div id="background-section"></div>
<?php
echo '<div class="content">';
$title = "Toutes les armes";
$fontFamily = "Arial, sans-serif"; 

if (isset($_GET['jeu'])) {
    $jeu = htmlspecialchars($_GET['jeu']);
    $fontFamily = "Russo One";

    if ($jeu === "Valorant") {
        $title = $jeu;
        $fontFamily = "Orbitron";
    } else {
        $title = $jeu;
    }
} elseif (isset($_GET['type_arme']) || isset($_GET['caracteristiques']) || isset($_GET['ordre'])) {
    $filter = htmlspecialchars($_GET['type_arme'] ?? $_GET['caracteristiques'] ?? $_GET['ordre']);
    $title = ucfirst($filter);
}

if (isset($_SESSION['connect']) && $_SESSION['connect'] == true)
{
    echo '<div id="contentChoice">';
        echo '<button id="buttonAdd" onclick="window.location.href=\'?controller=admin&action=formAdd\'">Ajouter une arme</button>';
        echo '<button id="buttonLogout" onclick="window.location.href=\'?controller=logout&action=logout&start=1\'">Déconnexion</button>';
    echo '</div>';
}

echo '<h1 style="font-family: \'' . $fontFamily . '\'">' . $title . ' ➤</h1>';
echo "<table>";
$max_value = 450; 
foreach ($printab as $cle => $val) {
    // Définir le dégradé, la police et les styles pour bar/jauge par défaut
    $backgroundGradient = "linear-gradient(135deg, rgb(84 55 19 / 20%), rgb(130 31 1))";
    $fontFamily = "Russo One";
    $barStyle = "border: solid rgb(201, 64, 0) 1.5px;";
    $jaugeStyle = "background-color: rgb(212, 60, 0);";

    // Si le jeu est Valorant, appliquer des styles spécifiques
    if ($val['gamename'] === "Valorant") {
        $backgroundGradient = "linear-gradient(135deg, rgb(84 55 19 / 20%), rgb(106, 0, 0))";
        $fontFamily = "Orbitron";
        $barStyle = "border: solid rgb(198, 0, 0) 1.5px;";
        $jaugeStyle = "background-color: rgb(198, 0, 0);";
    }
    echo "<tr 
            style='background: $backgroundGradient; box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.8);'
            onclick=\"window.location.href='?controller=set&action=AllInformation&id=" . $val['idweapon'] . "&start=" . $_GET['start'] . "'\">
        <td class='visuel_arme'> 
            <p style=\"font-family: $fontFamily;\">" . htmlspecialchars($val['gamename']) . "</p>
            <a href='?controller=set&action=AllInformation&id=" . $val['idweapon'] . "&start=" . $_GET['start'] . "'>" . htmlspecialchars($val['weaponname']) . " ⓘ</a>
            <img src=./" . htmlspecialchars($val["imagepath"]) . " />
        </td>
        <td class='info_arme'>
            <div class='info_arme_container'>
                <span class='info_precise'><span>PRT: </span><span>" . $val['range_w'] . "</span></span>
                <span class='info_precise'><span>DG: </span><span>" . $val['damage'] . "</span></span>
                <span class='info_precise'><span>MOB: </span><span>" . $val['mobility'] . "</span></span>
                <span class='info_precise'><span>CDT: </span><span>" . $val['fire_rate'] . "</span></span>
                <span class='info_precise'><span>MAN: </span><span>" . $val['control'] . "</span></span>
                <span class='info_precise'><span>PRC: </span><span>" . $val['accuracy'] . "</span></span>
            </div>
            <div class='bar-container'>
                <div class='bar' style='$barStyle'>
                    <div class='jauge' style='width:" . min(100, ($val['range_w'] / $max_value) * 100) . "%; $jaugeStyle'></div>
                </div>
                <div class='bar' style='$barStyle'>
                    <div class='jauge' style='width:" . min(100, ($val['damage'] / $max_value) * 100) . "%; $jaugeStyle'></div>
                </div>
                <div class='bar' style='$barStyle'>
                    <div class='jauge' style='width:" . min(100, ($val['mobility'] / $max_value) * 100) . "%; $jaugeStyle'></div>
                </div>
                <div class='bar' style='$barStyle'>
                    <div class='jauge' style='width:" . min(100, ($val['fire_rate'] / $max_value) * 100) . "%; $jaugeStyle'></div>
                </div>
                <div class='bar' style='$barStyle'>
                    <div class='jauge' style='width:" . min(100, ($val['control'] / $max_value) * 100) . "%; $jaugeStyle'></div>
                </div>
                <div class='bar' style='$barStyle'>
                    <div class='jauge' style='width:" . min(100, ($val['accuracy'] / $max_value) * 100) . "%; $jaugeStyle'></div>
                </div>
            </div>
        </td>
    </tr>";
}

echo "</table>"; 
require "view_pagination.php";
echo '</div>';
?>

<script src="Contenu/js/chargement.js"></script>
<script src="Contenu/js/barre_de_recherche.js"></script>
<script src="Contenu/js/filtres.js"></script>
<script src="Contenu/js/temps_chargement.js"></script>

<?php 
require "view_end.php";
?>
