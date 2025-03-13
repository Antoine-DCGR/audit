<?php 

class Controller_set extends Controller{

    public function action_default() {
        $this->action_AllInformation(); 
    }

    public function action_AllInformation() {

        $m = Model::getModel();

        if (isset($_GET['id']) && preg_match("/^[1-9][0-9]*$/", $_GET['id'])) {
    
            $m = Model::getModel();

            $page = $_GET['start'];
            
                
                $data = [
                    'infos' => $m->getAllInfoWeapons($_GET['id']),
                    'page' => $page,
                    
                ];
                if ($data['infos']) {
                    foreach ($data['infos'] as $cle => $val) {
                        if($val === null) {
                            $data['infos'][$cle] = "?";
                        }
                    }
                    $this->render("information", $data);
                }
        
        }
        else {
            $data = [
                'title' => 'Message Page',
                'message' => "La page n'existe pas"
            ];
            $this->render("message", $data);
        }

    }

    public function action_addWeapon() {
        session_start();
        if (!isset($_SESSION['connect']) || $_SESSION['connect'] !== true) {
            header("Location: ?controller=admin&action=formConnect");
            exit;
        }else {
            $m = Model::getModel();
            
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                if (isset($_POST['weaponname']) && isset($_POST['range_w']) && 
                    isset($_FILES['imagepath']) && isset($_POST['damage']) &&
                    isset($_POST['mobility']) && isset($_POST['fire_rate']) &&
                    isset($_POST['control']) && isset($_POST['accuracy']) &&
                    isset($_FILES['sound']) && isset($_POST['description']) &&
                    isset($_POST['anecdote']) && isset($_POST['gamename']) && 
                    isset($_POST['categoryname'])) {

                    // Sécurité et validation des champs
                    $weaponname = e(trim($_POST['weaponname']));
                    $range_w = filter_var($_POST['range_w'], FILTER_VALIDATE_INT, ["options" => ["min_range" => 0, "max_range" => 450]]);
                    $imagepath = $_FILES['imagepath'];
                    $damage = filter_var($_POST['damage'], FILTER_VALIDATE_INT, ["options" => ["min_range" => 0, "max_range" => 450]]);
                    $mobility = filter_var($_POST['mobility'], FILTER_VALIDATE_INT, ["options" => ["min_range" => 0, "max_range" => 450]]);
                    $fire_rate = filter_var($_POST['fire_rate'], FILTER_VALIDATE_INT, ["options" => ["min_range" => 0, "max_range" => 450]]);
                    $control = filter_var($_POST['control'], FILTER_VALIDATE_INT, ["options" => ["min_range" => 0, "max_range" => 450]]);
                    $accuracy = filter_var($_POST['accuracy'], FILTER_VALIDATE_INT, ["options" => ["min_range" => 0, "max_range" => 450]]);
                    $sound = $_FILES['sound'];
                    $description = e(trim($_POST['description']));
                    $anecdote = e(trim($_POST['anecdote']));
                    $gamename = $_POST['gamename'];
                    $categoryname = $_POST['categoryname'];

                    if (strlen($weaponname) < 1 || strlen($weaponname) > 255) {
                        $data = [
                            'errorMessage' => "Le nom de l'arme est invalide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }


                    elseif ($range_w === false) {
                        $data = [
                            'errorMessage' => "La portée est invalide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    
                    
                    
                    elseif ($imagepath['type'] != 'image/png') {
                        $data = [
                            'errorMessage' => "L'image doit être un fichier PNG valide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif ($damage === false) {
                        $data = [
                            'errorMessage' => "Les dégâts sont invalides !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif ($mobility === false) {
                        $data = [
                            'errorMessage' => "La mobilité est invalide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif ($fire_rate === false) {
                        $data = [
                            'errorMessage' => "La cadence de tir est invalide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif ($control === false) {
                        $data = [
                            'errorMessage' => "La maniabilité est invalide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif ($accuracy === false) {
                        $data = [
                            'errorMessage' => "La précision est invalide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif ($sound['type'] != 'audio/mpeg' ) {
                        $data = [
                            'errorMessage' => "Le fichier son doit être un fichier MP3 ou WAV valide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif (strlen($description) > 1000) {
                        $data = [
                            'errorMessage' => "La description est trop longue !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif (strlen($anecdote) > 1000) {
                        $data = [
                            'errorMessage' => "L'anecdote est trop longue !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif (trim($gamename) == "") {
                        $data = [
                            'errorMessage' => "L'identifiant du jeu est invalide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    

                    elseif (trim($categoryname) == "") {
                        $data = [
                            'errorMessage' => "L'identifiant du type est invalide !"
                        ];
                        $this->render("formAdd", $data);
                        return;
                    }

                    
                    else {
                        
                        $_POST['gamename'] = 'BO'. $_POST['idGame'];
                        $pathfile = "Contenu/img/weapon/" . $_POST['gamename'] . "/" . $_POST['categoryname'] . "/" . $_FILES['imagepath']['name'];
                        $item = [
                            'weaponname' => e($_POST['weaponname']),
                            'range_w' => e($_POST['range_w']),
                            'imagepath' => e($pathfile), 
                            'damage' => e($_POST['damage']),
                            'mobility' => e($_POST['mobility']),
                            'fire_rate' => e($_POST['fire_rate']),
                            'control' => e($_POST['control']),
                            'accuracy' => e($_POST['accuracy']),
                            'sound' => e($_FILES['sound']['name']), 
                            'description' => e($_POST['description']),
                            'anecdote' => e($_POST['anecdote']),
                            'idGame' => e($_POST['idGame']), 
                            'idType' => e($_POST['idType'])  
                        ];
                        
                        if ($m->addWeapon($item)){
                            $data = [
                                'game' => $m->getAllGames(),
                                'type' => $m->getAllTypes(),
                                'successMessage' => "arme ajouté."
                            ];
                            $this->render("formAdd", $data);
                        }else {
                            $data = [
                                'errorMessage' => "Une erreur s'est produite lors de l'ajout de l'arme, veuillez réessayer."
                            ];
                            $this->render("formAdd", $data);
                        }
                    }

                } else {
                    $data = [
                        'errorMessage' => "Un des champs n'a pas été correctement rempli !"
                    ];
                    
                    $this->render("formAdd", $data);
            }
        }
    }
        
    

}
    
    

}