const searchButton = document.getElementById("bouton-recherche");
const closeButton = document.getElementById("close-button");
const searchBarContainer = document.getElementById("search-bar-container");
const formResearch = document.getElementById("from-recherche");
const filters = document.getElementById("box-filter");
const filtersInfos = document.getElementById("filtres");
const imgFiltre = document.getElementById("img-filtre");
const header = document.querySelector("header");
const nav = document.querySelector("nav");
const navigation = document.getElementById("navigation");
const searchInput = document.getElementById("search-input"); 
const infoArme = document.getElementsByClassName('info_arme'); 
const armeElements = document.querySelectorAll('tr'); // Sélectionne tous les <tr>

armeElements.forEach((arme) => {
    const infoArme = arme.querySelector('.info_arme'); // Sélectionne l'élément .info_arme dans chaque <tr>

    arme.addEventListener("mouseover", () => {
        if (infoArme) {
            infoArme.classList.add("open"); 
            arme.classList.add("active"); // Ajoute la classe pour dérouler les infos
        }
    });

    arme.addEventListener("mouseleave", () => {
        if (infoArme) {
            infoArme.classList.remove("open"); // Retire la classe pour refermer les infos
            arme.classList.remove("active");
        }
    });
});

document.addEventListener("scroll", () => {
    const scrollPosition = window.scrollY; // Position du défilement
    const backgroundSection = document.getElementById("background-section");

    // Ajout de la classe pour activer l'effet parallaxe
    backgroundSection.classList.add("parallax");

    // Mettez à jour l'offset pour un mouvement fluide
    backgroundSection.style.setProperty(
        "--scroll-offset",
        `${scrollPosition * 0.2}px`
    );
});


document.addEventListener("DOMContentLoaded", () => {
    // Ouvrir la barre de recherche
    searchButton.addEventListener("click", () => {
        searchBarContainer.classList.add("open");
        filters.classList.add("open");
        closeButton.classList.remove("hidden");
        formResearch.classList.add("open");
        nav.classList.add("open");
        searchButton.classList.add("open");
        searchInput.classList.add("open");
    });

    // Fermer la barre de recherche
    closeButton.addEventListener("click", () => {
        searchBarContainer.classList.remove("open");
        filters.classList.remove("open");
        closeButton.classList.add("hidden");
        formResearch.classList.remove("open");
        nav.classList.remove("open");
        searchButton.classList.remove("open");
        searchInput.classList.remove("open");
    });
});


function handleScreenWidth() {
    const screenWidth = window.innerWidth;

    if (screenWidth > 1260) {
        document.addEventListener("scroll", scrollEvent);
    } else {
        document.removeEventListener("scroll", scrollEvent);
        removeScrollClasses();
    }
}

function scrollEvent(e) {
    const currentScroll = document.documentElement.scrollTop;
    if (currentScroll >= 1) {
        header.classList.add("scroll");
        nav.classList.add("scroll");
        navigation.classList.add("scroll");
        searchButton.classList.add("scroll");
        searchInput.classList.add("scroll");
    } else {
        header.classList.remove("scroll");
        nav.classList.remove("scroll");
        navigation.classList.remove("scroll");
        searchButton.classList.remove("scroll");
        searchInput.classList.remove("scroll");
    }
}

// Fonction pour supprimer les classes liées au scroll
function removeScrollClasses() {
    header.classList.remove("scroll");
    nav.classList.remove("scroll");
    navigation.classList.remove("scroll");
    searchButton.classList.remove("scroll");
    searchInput.classList.remove("scroll");
}

imgFiltre.addEventListener("click", ()=>{
    imgFiltre.classList.add("open");
    filtersInfos.classList.add("open");
    filters.classList.add("open-box");
})

// Lorsqu'on survole la boîte "filters", activez le flag
filters.addEventListener("mouseover", () => {
    isHoveringFilters = true; // La souris est sur la boîte "filters"
});

// Lorsqu'on quitte la boîte "filters", désactivez le flag et cachez la boîte
filters.addEventListener("mouseout", () => {
    isHoveringFilters = false; // La souris a quitté la boîte "filters"
    setTimeout(() => {
        if (!isHoveringFilters) { // Vérifie si la souris est vraiment partie
            imgFiltre.classList.remove("open");
            filtersInfos.classList.remove("open");
            filters.classList.remove("open-box");
        }
    }, 50); // Un léger délai pour éviter les problèmes de transition rapide
});



window.addEventListener("resize", handleScreenWidth);

handleScreenWidth();

