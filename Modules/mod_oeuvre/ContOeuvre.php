<?php
if (!defined('CONST_INCLUDE'))
    die('Acces direct interdit !');
?>
<?php

include_once "ModeleOeuvre.php";
include_once "VueOeuvre.php";

class ContOeuvre
{
    private $modeleOeuvre;
    private $vueOeuvre;

    public function __construct()
    {
        $this->modeleOeuvre = new ModeleOeuvre();
        $this->vueOeuvre = new VueOeuvre();
    }

    public function affichagePageOeuvre($oeuvre)
    {
        if (isset($_POST['idOeuvre'])) {
            $idOeuvre = addslashes(strip_tags($_POST['idOeuvre']));
        } else {
            $idOeuvre = $oeuvre;
        }
        if ($idOeuvre != null) {
            
            $tab = $this->modeleOeuvre->modelePageOeuvre($idOeuvre);
            $estAdmin = $this->modeleOeuvre->modeleEstAdmin();
            $this->vueOeuvre->vuePageOeuvre($tab, $estAdmin);
        }
    }

   
 
}