<?php 

class Controller_admin extends Controller{

    public function action_default() {
        $this->action_formConnect(); 
    }

    public function action_formConnect() {
        
        session_start();
        if (!isset($_SESSION['connect']) || $_SESSION['connect'] !== true) {
            $this->render("formConnect");
            
        }
        else {
            $m = Model::getModel();

            $data = [
                'game' => $m->getAllGames(),
                'type' => $m->getAllTypes()
            ];


            $this->render("formAdd", $data);
        }

    }

    public function action_connect() {

        session_start();
        if (!isset($_SESSION['connect']) || $_SESSION['connect'] !== true) {
            if (isset($_POST['iduser']) && isset($_POST['passworduser']) && trim($_POST['passworduser']) != '' && trim($_POST['iduser']) != '') {
                if (preg_match("/^[0-9]*$/", $_POST['iduser'])) {
    
                    $iduser = $_POST['iduser'];
                    $passworduser = sha1($_POST['passworduser']);
    
                    $m = Model::getModel();
    
                    $userConnect = $m->connect($iduser,$passworduser);
    
                    if ($userConnect) {
    
   
                        $_SESSION['connect'] = true;
    
                        $data = [
                            'game' => $m->getAllGames(),
                            'type' => $m->getAllTypes(),
                            'connect' => $_SESSION['connect']
                        ];
    
                        
                        $this->render("formAdd",$data);
                    }
                    else {
                        $data = [
                            'errorMessage' => "Identifiant ou mot de passe incorrect !",
                        ];
                        $this->render("formConnect", $data);
                    }
                }
                else {
                    $data = [
                        'errorMessage' => "Format de l'identifiant incorrect !",
                    ];
                    $this->render("formConnect", $data);
                }
                
            }
            else {
                $data = [
                    'errorMessage' => "Un des champs n'a pas été correctement rempli !",
                ];
                $this->render("formConnect", $data);
    
            }
        }
        else {
            $m = Model::getModel();

            $data = [
                'game' => $m->getAllGames(),
                'type' => $m->getAllTypes()
            ];


            $this->render("formAdd", $data);
        }

        
            
    }

}

