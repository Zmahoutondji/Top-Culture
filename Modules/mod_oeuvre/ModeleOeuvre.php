<?php
if (!defined('CONST_INCLUDE'))
    die('Acces direct interdit !');
?>
<?php

include_once "ConnexionBD.php";

require_once( "sparqllib.php" );




//var_dump($db);

class ModeleOeuvre extends ConnexionBD
{
    // FONCTION PRINCIPALE

    public function __construct()
    {
        $this->db = sparql_connect( "https://dbpedia.org/sparql/" );
      
    }

    // fourni les éléments de l'oeuvre
    public function modelePageOeuvre($idOeuvre)
    {
            $requeteElmtsOeuvre = self::$bdd->prepare("SELECT * FROM oeuvre WHERE idOeuvre = ?");
            $requeteElmtsOeuvre->execute([$idOeuvre]);
            $result = $requeteElmtsOeuvre->fetch();
            

            return $result;
      
    }

    
    

    //vérifie si l'utilisateur est un admin ou non
    public function modeleEstAdmin()
    {
        if (isset($_SESSION['nom_utilisateur'])) {
            try {
                $reqVerifAdmin = self::$bdd->prepare("SELECT * FROM utilisateur WHERE pseudo = ? AND admin = 1");
                $reqVerifAdmin->execute([$_SESSION['nom_utilisateur']]);
                $result = $reqVerifAdmin->fetch();

                if (empty($result)) {
                    return 0;
                } else {
                    return 1;
                }
            } catch (PDOException $e) {
            }
        } else {
            return 0;
        }
    }


    //FONCTION POUR LA MODIFICATION D'UN AVIS

    

    
}