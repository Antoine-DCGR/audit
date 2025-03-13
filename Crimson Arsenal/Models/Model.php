<?php

class Model
{
    /**
     * Attribut contenant l'instance PDO
     */
    private $bd;

    /**
     * Attribut statique qui contiendra l'unique instance de Model
     */
    private static $instance = null;

    /**
     * Constructeur : effectue la connexion à la base de données.
     */
    private function __construct()
    {
        include "credentials.php";
        $this->bd = new PDO($dsn, $login, $mdp);
        $this->bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->bd->query("SET nameS 'utf8'");

    }

    /**
     * Méthode permettant de récupérer un modèle car le constructeur est privé (Implémentation du Design Pattern Singleton)
     */
    public static function getModel()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Retourne le nombre d'armes dans la base de données
     */
    public function getNbWeapons()
    {
        $req = $this->bd->prepare('SELECT COUNT(*) FROM weapon');
        $req->execute();
        $tab = $req->fetch(PDO::FETCH_NUM);
        return $tab[0];
    }


    /**
     * Retourne les armes dans la base de données du offset + 1 au offset + limit
     */
    public function getWeaponsWithLimit($offset = 0, $limit = 20)
    {
        $req = $this->bd->prepare('SELECT gamename,* FROM weapon JOIN Game USING (idgame) ORDER BY idWeapon DESC LIMIT :limit OFFSET :offset');
        $req->bindValue(':limit', $limit, PDO::PARAM_INT);
        $req->bindValue(':offset', $offset, PDO::PARAM_INT);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    }


    /**
     * Retourne un tableau contenant les informations de l'arme demandée (ou false s'il n'existe pas)
     */
    public function getWeapons($id)
    {
        $req = $this->bd->prepare('SELECT * FROM weapon WHERE idweapon = :id');
        $req->bindValue(':id', $id);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Retourne un tableau contenant toutes les informations de l'arme demandée (ou false s'il n'existe)
     */
    public function getAllInfoWeapons($id) {
        $req = $this->bd->prepare('SELECT gamename, weaponname, categoryname, typename, imagepath, range_w, damage, mobility, fire_rate, control, accuracy, description, anecdote, sound FROM weapon JOIN Game USING (idgame) JOIN Type USING (idtype) JOIN Category USING (idcategory) WHERE idweapon = :id');
        $req->bindValue(':id', $id);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    }


    public function getFilteredWeapons($filters, $offset, $limit)
    {
        $query = "SELECT * FROM Weapon WHERE 1=1";
        $params = [];

        if (!empty($filters['jeu'])) {
            $query = "SELECT * FROM Weapon JOIN Game USING(idgame) WHERE gamename = :jeu";
            $params['jeu'] = $filters['jeu'];
        }

        elseif (!empty($filters['type_arme'])) {
            $query = "SELECT * FROM Weapon JOIN Game USING(idgame) JOIN Type USING(idtype) JOIN Category USING (idcategory) WHERE categoryname = :type_arme";
            $params['type_arme'] = $filters['type_arme'];
        }
        
        elseif (!empty($filters['ordre']) && in_array($filters['ordre'], ['croissant', 'décroissant'])) {
            if ($filters['ordre'] === 'croissant') {
                $query = 'SELECT * FROM Weapon JOIN Game USING(idgame) ORDER BY weaponname ASC';
            }
            else {
                $query = 'SELECT * FROM Weapon JOIN Game USING(idgame) ORDER BY weaponname DESC';
            }
            
            
        }

        elseif (!empty($filters['caracteristiques'])) {
            $caracteristiquesMap = [
                'précision' => 'accuracy',
                'dégats' => 'damage',
                'portée' => 'range_w',
                'cadence de tir' => 'fire_rate',
                'mobilité' => 'mobility',
                'maniabilité' => 'control',
            ];
            if (isset($caracteristiquesMap[$filters['caracteristiques']])) {
                $query = "SELECT * FROM Weapon JOIN Game USING(idgame) ORDER BY " . $caracteristiquesMap[$filters['caracteristiques']];
            }
        } else {
            $query = "SELECT * FROM Weapon WHERE 1=1"; // Tri par défaut
        }
        

        $query .= " LIMIT :limit OFFSET :offset";
        $params['limit'] = $limit;
        $params['offset'] = $offset;

        $req = $this->bd->prepare($query);
        foreach ($params as $key => $value) {
            $req->bindValue(":$key", $value, is_int($value) ? PDO::PARAM_INT : PDO::PARAM_STR);
        }
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    }

    public function countFilteredWeapons($filters)
    {
        $query = "SELECT COUNT(*) as total FROM Weapon WHERE 1=1";
        $params = [];

        if (!empty($filters['jeu'])) {
            $query = "SELECT COUNT(*) as total FROM Weapon JOIN Game USING (idgame) WHERE gamename = :jeu";
            $params['jeu'] = $filters['jeu'];
        }

        if (!empty($filters['type_arme'])) {
            $query = "SELECT COUNT(*) as total FROM Weapon JOIN Type USING(idtype) JOIN Category USING (idcategory) WHERE categoryname = :type_arme";
            $params['type_arme'] = $filters['type_arme'];
        }



        $req = $this->bd->prepare($query);
        foreach ($params as $key => $value) {
            $req->bindValue(":$key", $value, is_int($value) ? PDO::PARAM_INT : PDO::PARAM_STR);
        }
        $req->execute();
        return $req->fetchColumn();
    }

    public function searchKeywordsWithFilters($query, $filters = []) {
        $sql = "
            SELECT * 
            FROM weapon JOIN Game USING(idgame)
            JOIN keyword USING (idweapon)
            WHERE keywordname ILIKE :query
        ";
        $params = [':query' => '%' . $query . '%'];

        // Ajouter des filtres si présents
        if (!empty($filters['jeu'])) {
            $sql .= " AND idgame = (SELECT idgame FROM game WHERE gamename = :jeu)";
            $params[':jeu'] = $filters['jeu'];
        }

        if (!empty($filters['type_arme'])) {
            $sql .= " AND idtype = (SELECT idtype FROM category WHERE categoryname = :type_arme)";
            $params[':type_arme'] = $filters['type_arme'];
        }

        $req = $this->bd->prepare($sql);
        foreach ($params as $key => $value) {
            $req->bindValue($key, $value, is_int($value) ? PDO::PARAM_INT : PDO::PARAM_STR);
        }

        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    }

    public function connect($iduser,$passworduser) {
        $req = $this->bd->prepare('SELECT * FROM admin WHERE iduser = :id AND passworduser = :password');
        $req->bindValue(':id', $iduser);
        $req->bindValue(':password', $passworduser);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Retourne un tableau contenant tous les jeux disponibles
     */
    public function getAllGames()
    {
        $query = "SELECT idGame, gameName FROM Game ORDER BY gameName ASC";
        $req = $this->bd->prepare($query);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC); 
    }

    /**
     * Retourne un tableau contenant tous les types d'armes disponibles
     */
    public function getAllTypes()
    {
        $query = "
            SELECT t.idType, t.typeName, c.categoryName
            FROM Type t
            JOIN Category c ON t.idCategory = c.idCategory
            ORDER BY c.categoryName ASC, t.typeName ASC
        ";
        $req = $this->bd->prepare($query);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC); 
    }

    /**
     * Ajoute une nouvelle arme dans la base de donnÃ©es
     */
    public function addWeapon($data) {
    try {
        $query = "
            INSERT INTO weapon (
                weaponname, range_w, imagepath, damage, mobility, fire_rate, control, accuracy, sound, description, anecdote, idGame, idType
            )
            VALUES (
                :weaponname, :range_w, :imagepath, :damage, :mobility, :fire_rate, :control, :accuracy, :sound, :description, :anecdote, :idGame, :idType
            )
        ";

        $req = $this->bd->prepare($query);
        $req->bindValue(':weaponname', $data['weaponname'], PDO::PARAM_STR);
        $req->bindValue(':range_w', $data['range_w'], PDO::PARAM_INT);
        $req->bindValue(':imagepath', $data['imagepath'], PDO::PARAM_STR);
        $req->bindValue(':damage', $data['damage'], PDO::PARAM_INT);
        $req->bindValue(':mobility', $data['mobility'], PDO::PARAM_INT);
        $req->bindValue(':fire_rate', $data['fire_rate'], PDO::PARAM_INT);
        $req->bindValue(':control', $data['control'], PDO::PARAM_INT);
        $req->bindValue(':accuracy', $data['accuracy'], PDO::PARAM_INT);
        $req->bindValue(':sound', $data['sound'], PDO::PARAM_STR);
        $req->bindValue(':description', $data['description'], PDO::PARAM_STR);
        $req->bindValue(':anecdote', $data['anecdote'], PDO::PARAM_STR);
        $req->bindValue(':idGame', $data['idGame'], PDO::PARAM_INT);
        $req->bindValue(':idType', $data['idType'], PDO::PARAM_INT);
        $req->execute();

        return true; // Si l'insertion réussit
    } catch (PDOException $e) {
        error_log("Database error: " . $e->getMessage());
        return false;
    }
}


}
