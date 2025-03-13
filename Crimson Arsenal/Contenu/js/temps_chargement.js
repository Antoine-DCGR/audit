async function fetchAndMeasureTime(selectedFilter, selectedValue) {
    try {
      const baseUrl = window.location.href.split('?')[0];
      const url = `${baseUrl}?${selectedFilter}=${selectedValue}`;
  
      const startTime = Date.now(); // Début de la mesure du temps
      const response = await fetch(url);
      const endTime = Date.now(); // Fin de la mesure du temps
  
      // Calculer le temps écoulé
      const elapsedTime = endTime - startTime;
      console.log(`Temps pris pour la requête : ${elapsedTime} ms`);
  
      if (!response.ok) {
        throw new Error(`Erreur serveur : ${response.statusText}`);
      }
  
      const data = await response.json();
      console.log("Données reçues :", data);
    } catch (error) {
      console.error("Une erreur est survenue :", error);
    }
  }
  
  // Appelle cette fonction avec le filtre et la valeur
  fetchAndMeasureTime("filterName", "filterValue");
  