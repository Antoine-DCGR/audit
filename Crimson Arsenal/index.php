<?php

// Inclusion des fichiers nécessaires
require_once "Utils/functions.php";
require_once "Models/Model.php";
require_once "Controllers/Controller.php";

// Liste des contrôleurs
$controllers = ["accueil", "set", "search", "admin","logout"];
$controller_default = "accueil";

// Vérification du contrôleur demandé
if (isset($_GET['controller']) and in_array($_GET['controller'], $controllers)) {
    $nom_controller = $_GET['controller'];
} else {
    $nom_controller = $controller_default;
}

$nom_classe = 'Controller_' . $nom_controller;
$nom_fichier = 'Controllers/' . $nom_classe . '.php';

if (is_readable($nom_fichier)) {
    require_once $nom_fichier;
    new $nom_classe();
} else {
    die("Error 404: not found!");
}
?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        const searchInput = $("#search-input");
        const resultsContainer = $(".content");
        const paginationContainer = $("#pagination");
        const filters = {
            jeu: $("#filtre-jeu").val(),
            type_arme: $("#filtre-arme").val(),
        };
        const max_value = 450;

        function fetchResults(page = 1) {
            const query = searchInput.val().trim();

            if (query === "") {
                return;
            }

            $.ajax({
                type: "GET",
                url: `?controller=search&action=search&query=${encodeURIComponent(query)}&jeu=${filters.jeu}&type_arme=${filters.type_arme}&page=${page}`,
                dataType: "json",
                success: function (response) {
                    if (response.results && response.results.length > 0) {
                        let resultsContent = `<h1 style="font-family: 'Arial, sans-serif';">Résultats de recherche ➤</h1>`;
                        resultsContent += "<table>";

                        response.results.forEach((item) => {
                            // Styles dynamiques pour Valorant
                            const isValorant = item.gamename === "Valorant";
                            const backgroundGradient = isValorant
                                ? "linear-gradient(135deg, rgb(84 55 19 / 20%), rgb(106, 0, 0))"
                                : "linear-gradient(135deg, rgb(84 55 19 / 20%), rgb(130 31 1))";
                            const fontFamily = isValorant ? "Orbitron" : "Russo One";
                            const barStyle = isValorant
                                ? "border: solid rgb(198, 0, 0) 1.5px;"
                                : "border: solid rgb(201, 64, 0) 1.5px;";
                            const jaugeStyle = isValorant
                                ? "background-color: rgb(198, 0, 0);"
                                : "background-color: rgb(212, 60, 0);";

                            resultsContent += `
                                <tr style="background: ${backgroundGradient}; box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.8);"
                                    class="arme-row"
                                    onclick="window.location.href='?controller=set&action=AllInformation&id=${item.idweapon}&start=1'">
                                    <td class="visuel_arme">
                                        <p style="font-family: ${fontFamily};">${item.gamename}</p>
                                        <a href="?controller=set&action=AllInformation&id=${item.idweapon}&start=1">
                                            ${item.weaponname} ⓘ
                                        </a>
                                        <img src="./${item.imagepath}" alt="${item.weaponname}">
                                    </td>
                                    <td class="info_arme">
                                        <div class="info_arme_container">
                                            <span>PRT: ${item.range_w}</span>
                                            <span>DG: ${item.damage}</span>
                                            <span>MOB: ${item.mobility}</span>
                                            <span>CDT: ${item.fire_rate}</span>
                                            <span>MAN: ${item.control}</span>
                                            <span>PRC: ${item.accuracy}</span>
                                        </div>
                                        <div class="bar-container">
                                            <div class="bar" style="${barStyle}">
                                                <div class="jauge" style="width:${Math.min(100, (item.range_w / max_value) * 100)}%; ${jaugeStyle}"></div>
                                            </div>
                                            <div class="bar" style="${barStyle}">
                                                <div class="jauge" style="width:${Math.min(100, (item.damage / max_value) * 100)}%; ${jaugeStyle}"></div>
                                            </div>
                                            <div class="bar" style="${barStyle}">
                                                <div class="jauge" style="width:${Math.min(100, (item.mobility / max_value) * 100)}%; ${jaugeStyle}"></div>
                                            </div>
                                            <div class="bar" style="${barStyle}">
                                                <div class="jauge" style="width:${Math.min(100, (item.fire_rate / max_value) * 100)}%; ${jaugeStyle}"></div>
                                            </div>
                                            <div class="bar" style="${barStyle}">
                                                <div class="jauge" style="width:${Math.min(100, (item.control / max_value) * 100)}%; ${jaugeStyle}"></div>
                                            </div>
                                            <div class="bar" style="${barStyle}">
                                                <div class="jauge" style="width:${Math.min(100, (item.accuracy / max_value) * 100)}%; ${jaugeStyle}"></div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            `;
                        });

                        resultsContent += "</table>";
                        resultsContainer.html(resultsContent);

                        // Ajouter l'effet hover pour les nouvelles lignes
                        addHoverEffect();
                        paginationContainer.html("").hide();
                    } else {
                        resultsContainer.html("<div class='no-results'>Aucune arme trouvée.</div>");
                        paginationContainer.html("").hide();
                    }
                },
                error: function (xhr, status, error) {
                    resultsContainer.html("<div class='error'>Une erreur est survenue. Veuillez réessayer.</div>");
                    paginationContainer.html("").hide();
                },
            });
        }

        // Fonction pour gérer le survol
        function addHoverEffect() {
            const armeElements = document.querySelectorAll('tr'); // Sélectionne tous les <tr>
            armeElements.forEach((arme) => {
                const infoArme = arme.querySelector('.info_arme'); // Sélectionne l'élément .info_arme dans chaque <tr>
                arme.addEventListener("mouseover", () => {
                    if (infoArme) {
                        infoArme.classList.add("open");
                        arme.classList.add("active");
                    }
                });

                arme.addEventListener("mouseleave", () => {
                    if (infoArme) {
                        infoArme.classList.remove("open");
                        arme.classList.remove("active");
                    }
                });
            });
        }

        // Initialisation des événements hover
        addHoverEffect();

        // Gestion des recherches
        searchInput.on("keyup", function () {
            fetchResults();
        });

        $("#filtre-jeu, #filtre-arme").on("change", function () {
            filters.jeu = $("#filtre-jeu").val();
            filters.type_arme = $("#filtre-arme").val();
            fetchResults();
        });
    });
</script>
