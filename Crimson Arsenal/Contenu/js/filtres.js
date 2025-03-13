const filtersList = {
    jeu: document.getElementById("filtre-jeu"),
    type_arme: document.getElementById("filtre-arme"),
    caracteristiques: document.getElementById("filtre-caractéristique"),
    ordre: document.getElementById("filtre-ordre")
};

function updateURL() {
    const params = new URLSearchParams();

    for (const key in filtersList) {
        const value = filtersList[key]?.value;
        if (value) {
            params.append(key, value);
        }
    }

    const baseUrl = "?controller=accueil&action=filtrer&start=1";
    const newUrl = `${baseUrl}&${params.toString()}`;

    // Redirection
    window.location.href = newUrl;
}

Object.values(filtersList).forEach(filter => {
    filter.addEventListener("change", updateURL);
});
