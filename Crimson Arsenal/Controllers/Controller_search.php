<?php

class Controller_search extends Controller {
    
    public function action_default() {
        $this->action_search(); 
    }

    public function action_search() {
        $query = $_GET['query'] ?? '';
        $jeu = $_GET['jeu'] ?? null;
        $type_arme = $_GET['type_arme'] ?? null;

        if (empty($query)) {
            echo json_encode(['results' => []]);
            return;
        }

        $model = Model::getModel();

        $filters = [
            'jeu' => $jeu,
            'type_arme' => $type_arme,
        ];
        $results = $model->searchKeywordsWithFilters($query, $filters);

        ob_clean();
        header('Content-Type: application/json');
        echo json_encode(['results' => $results]); 
        exit;
    }
}
