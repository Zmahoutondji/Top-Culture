<?php
if (!defined('CONST_INCLUDE'))
    die('Acces direct interdit !');
?>
<?php


class VueContact
{

    public function vuePageAPropos()
    {
        ?>
        <!-- PAGE A PROPOS-->

        <div class="container">
            <div class="row">
                <div class="titrePage my-4">
                    <h1 class="text-center">Qui sommes nous ?</h1>
                </div>
                <div class="sectionTexteAPropos">
                    <div class="sousSection">
                        <h2> À propos de nous : </h2>
                        <p>
                            CNAM
                        </p>
                    </div>
                    <div class="sousSection">
                        <h2> Les avantages de Top Culture : </h2>
                        <ul>
                            <li>Exprimer vos opinion via l'espace de notation et de commentaire disponible pour chaque œuvre.</li>
                            <li>Faites vos tops avec un large panel de thèmes et d'œuvres pour chacun d'entre eux.</li>
                            <li>Partager vos tops au monde entier ou alors consulter ceux des autres utilisateurs.</li>
                            <li>Retrouver tous vos tops réalisés sur votre page profil.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <?php
    }

}