<?php


abstract class Controller
{
    /**
     * Constructeur. Lance l'action correspondante
     */
    public function __construct()
    {

        //On détermine s'il existe dans l'url un paramètre action correspondant à une action du contrôleur
        if (isset($_GET['action']) and method_exists($this, "action_" . $_GET["action"])) {
            //Si c'est le cas, on appelle cette action
            $action = "action_" . $_GET["action"];
            $this->$action();
        } else {
            //Sinon, on appelle l'action par défaut
            $this->action_default();
        }
    }

    /**
     * Action par défaut du contrôleur (à définir dans les classes filles)
     */
    abstract public function action_default();

    /**
     * Affiche la vue
     * @param string $vue nom de la vue
     * @param array $data tableau contenant les données à passer à la vue
     * @return aucun
     */
    protected function render($vue, $data = [])
    {
        // On extrait les données à afficher
        extract($data);
    
        // On teste si la vue existe
        $file_name = "Views/view_" . $vue . '.php';
        if (file_exists($file_name)) {
            // Si oui, on l'affiche
            include $file_name;
        } else {
            // Sinon, on affiche une erreur générique et on arrête
            die("Erreur : La vue '$vue' n'existe pas !");
        }
    }
    

    /**
     * Méthode affichant une page d'erreur
     * @param string $message Message d'erreur à afficher
     * @return aucun
     */
    protected function action_error($message = '')
    {
        $data = [
            'title' => "Error",
            'message' => $message,
        ];
    
        // Vérifiez si la vue 'message' existe avant de l'appeler
        $file_name = "Views/view_message.php";
        if (file_exists($file_name)) {
            $this->render("message", $data);
        } else {
            // Si la vue 'message' n'existe pas, afficher un message d'erreur brut
            die("Erreur critique : La vue d'erreur 'message' est introuvable. Détails : $message");
        }
    }
    
}
