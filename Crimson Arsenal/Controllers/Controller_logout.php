<?php 

class Controller_logout extends Controller{

    public function action_default() {
        $this->action_logout(); 
    }

    public function action_logout() {

        session_start();
        if (!isset($_SESSION['connect']) || $_SESSION['connect'] !== true) {
            header("Location: ?controller=accueil&action=accueil&start=1");
            exit;
        }
        else {
            session_destroy();
            session_unset();
            $_SESSION = array();
            header("Location: ?controller=accueil&action=accueil&start=" . $_GET['start']);
            exit;
        }
    }

}