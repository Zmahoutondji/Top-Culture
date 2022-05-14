<?php
if (!defined('CONST_INCLUDE'))
    die('Acces direct interdit !');
?>
<?php

include_once "ContOeuvre.php";

class ModOeuvre
{
    private $contOeuvre;

    public function __construct()
    {
        if (isset($_GET['action'])) {
            $action = addslashes(strip_tags($_GET['action']));
        } else {
            $action = "affichage_oeuvre";
        }

        $this->contOeuvre = new ContOeuvre();
        $this->determineAction($action);
    }

    public function determineAction($action)
    {
        switch ($action) {
            case "affichage_oeuvre":
                $this->contOeuvre->affichagePageOeuvre(null);
                break;
           
        }
    }
}