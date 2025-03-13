<?php 

class Controller_accueil extends Controller{

    public function action_default() {
        $this->action_accueil(); 
    }

    public function action_accueil() {
        $m = Model::getModel();

        if (isset($_GET['start'])) {
            if (preg_match("/^[1-9]\d*$/", $_GET['start'])) {
                $page = $_GET['start'];
                $itemsPerPage = 20;
                $totalweapons = $m->getNbWeapons();
                $offset = ($page - 1) * $itemsPerPage;
                $printab = $m->getWeaponsWithLimit($offset, $itemsPerPage);
                $pages = ceil($totalweapons/$itemsPerPage);
                if (is_float($pages)) {
                    $pages = ceil($pages);
                }
                if ($page > $pages) {
                    $data = [
                        'title' => 'Message Page',
                        'message' => "La page n'existe pas"
                    ];
                    $this->render("message", $data);
                } else {
                    $data = [
                        'printab' => $printab,
                        'page' => $page,
                        'itemsPerPage' => $itemsPerPage,
                        'pages' => $pages, 
                        'action' => 'accueil'
                    ];
                    $this->render("accueil", $data);
                }
            }
            else {
                $_GET['start'] = 1;
                header("Location: ?controller=accueil&action=accueil&start=" . $_GET['start']);
            }
        }
        else {
            $_GET['start'] = 1;
            header("Location: ?controller=accueil&action=accueil&start=" . $_GET['start']);
        }
    }

    public function action_information()
    {
        if (isset($_GET['id']) && preg_match("/^[1-9][0-9]*$/", $_GET['id'])) {

            $m = Model::getModel();
            $data = [
                'infos' => $m->getWeapons($_GET['id']),
            ];
            if ($data['infos']) {
                foreach ($data['infos'] as $cle => $val) {
                    if($val === null) {
                        $data['infos'][$cle] = "?";
                    }
                }
                $this->render("accueil", $data);
            }
        }
    }

    public function action_filtrer()
    {
        $m = Model::getModel();

        $url = '';

        $filters = [
            'jeu' => $_GET['jeu'] ?? null,
            'type_arme' => $_GET['type_arme'] ?? null,
            'caracteristiques' => $_GET['caracteristiques'] ?? null,
            'ordre' => $_GET['ordre'] ?? null,
        ];
        if (isset($_GET['start'])) {
            if (preg_match("/^[1-9]\d*$/", $_GET['start'])) {
                $page = $_GET['start'];
                $itemsPerPage = 20;
                $totalweapons = $m->countFilteredWeapons($filters);
                $offset = ($page - 1) * $itemsPerPage;
                $printab = $m->getFilteredWeapons($filters, $offset, $itemsPerPage);
                $pages = ceil($totalweapons/$itemsPerPage);
                if (is_float($pages)) {
                    $pages = ceil($pages);
                }
                if ($page > $pages) {
                    $data = [
                        'title' => 'Message Page',
                        'message' => "La page n'existe pas"
                    ];
                    $this->render("message", $data);
                } else {
                    if ($filters['jeu']) {
                        $url = '&jeu=' . $filters['jeu'];
                    }
                    elseif ($filters['type_arme']) {
                        $url = '&type_arme=' . $filters['type_arme'];
                    }
                    elseif ($filters['caracteristiques']) {
                        $url = '&caracteristiques=' . $filters['caracteristiques'];
                    }
                    elseif ($filters['ordre']) {
                        $url = '&ordre=' . $filters['ordre'];
                    }
                    else {
                        $data = [
                            'title' => 'Message Page',
                            'message' => "La page n'existe pas"
                        ];
                        $this->render("message", $data);
                    }
                    
                    $data = [
                        'printab' => $printab,
                        'page' => $page,
                        'itemsPerPage' => $itemsPerPage,
                        'pages' => $pages,
                        'action' => 'filtrer',
                        'url' => $url
                    ];
                    $this->render("accueil", $data);
                }
            }
            else {
                $_GET['start'] = 1;
                header("Location: ?controller=accueil&action=filtrer&start=" . $_GET['start']);
                exit; 
            }
        }
        else {
            $_GET['start'] = 1;
            header("Location: ?controller=accueil&action=filtrer&start=" . $_GET['start']);
            exit; 
        }
    }
}