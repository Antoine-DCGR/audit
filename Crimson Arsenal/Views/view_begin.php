<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8"/>
		<title> Crimson Arsenal</title>
        <link rel="icon" type="image/x-icon" href="Contenu/img/Crimson_Arsernal.png">
		<link rel="stylesheet" href="Contenu/css/accueil.css"/>
        <link rel="stylesheet" href="Contenu/css/chargement.css"/>
	</head>
	<body>
	<header>
    <a href="?controller=accueil&action=accueil&start=1"><img src="Contenu/img/Crimson_Arsernal.png" alt="Logo Crimson Arsenal" id="logo-crimson"></a>
    <nav>
        <div id="navigation">
            <div id="box-filter">
                <img src="Contenu/img/filtre.png" alt="Icône filtre" id="img-filtre">
                <div id="filtres">
                    <div class="filter-item">
                        <img src="Contenu/img/jeu.png" alt="Icône Jeu" class="filter-icon">
                        <select name="jeu" id="filtre-jeu">
                            <option value="">Jeu</option>
                            <!-- Call of Duty Options -->
                            <option value="Call Of Duty Black Ops 1">Call of Duty: Black Ops 1</option>
                            <option value="Call Of Duty Black Ops 2">Call of Duty: Black Ops 2</option>
                            <option value="Call Of Duty Black Ops 3">Call of Duty: Black Ops 3</option>
                            <option value="Call Of Duty Black Ops 4">Call of Duty: Black Ops 4</option>
                            <option value="Call Of Duty Black Ops 5">Call of Duty: Black Ops 5</option>
                            <option value="Call Of Duty Black Ops 6">Call of Duty: Black Ops 6</option>
                            <!-- Valorant Option -->
                            <option value="Valorant">Valorant</option>
                        </select>
                    </div>
                    <div class="filter-item">
                        <img src="Contenu/img/typeArme.png" alt="Icône Arme" class="filter-icon icon-height">
                        <select name="type_arme" id="filtre-arme">
                            <option value="">Catégorie d'arme</option>
                            <!-- Types d'armes -->
                            <option value="Fusil_d'assault">Fusil d'assaut</option>
                            <option value="Fusil_de_precision">Fusil de précision</option>
                            <option value="Mitraillette">Mitraillette</option>
                            <option value="Mitrailleuse">Mitrailleuse</option>
                            <option value="Fusil_tactique">Fusil tactique</option>
                            <option value="Pistolets">Pistolet</option>
                            <option value="Lanceurs">Lanceur</option>
                            <option value="Fusil_à_pompe">Fusil à pompe</option>
                            <option value="Armes_de_melee">Arme de mélée</option>
                            <option value="Equipement_mortel">Équipement mortel</option>
                            <option value="Equipement_tactique">Équipement tactique</option>
                            <option value="Arme_speciale">Arme spéciale</option>
                        </select>
                    </div>
                    <div class="filter-item">
                        <img src="Contenu/img/viseur.png" alt="Icône Caractéristiques" class="filter-icon" >
                        <select name="caracteristiques" id="filtre-caractéristique">
                            <option value="">Caractéristiques</option>
                            <!-- Caractéristiques -->
                            <option value="précision">Précision</option>
                            <option value="dégats">Dégats</option>
                            <option value="portée">Portée</option>
                            <option value="cadence de tir">Cadence de tir</option>
                            <option value="mobilité">Mobilité</option>
                            <option value="maniabilité">Maniabilité</option>
                        </select>
                    </div>
                    <div class="filter-item">
                        <img src="Contenu/img/ordre.png" alt="Icône Ordre" class="filter-icon">
                        <select name="ordre" id="filtre-ordre">
                            <option value="">Ordre</option>
                            <!-- Ordre -->
                            <option value="croissant">Croissant</option>
                            <option value="décroissant">Décroissant</option>
                        </select>
                    </div>
                </div>
            </div>
            <form id="from-recherche" action="" method="GET">

                <div id="search-bar-container">
                    <input
                        type="text"
                        id="search-input"
                        name="query"
                        placeholder="Rechercher une arme..." >
                </div>

            </form>
                <button id="bouton-recherche" type="button">
                    <img src="Contenu/img/loupe_recherche.png" alt="Recherche" id="logo_recherche">
                </button>
                <div id="search-results"></div>
        </div>
        <button id="close-button" type="button" class="hidden">
            &#10006;
        </button>
    </nav>

	</header>