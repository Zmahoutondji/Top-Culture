<?php
if (!defined('CONST_INCLUDE'))
    die('Acces direct interdit !');
?>
<?php

require_once( "sparqllib.php" );


class VueOeuvre
{

    public function __construct()
    {
        $this->db = sparql_connect( "https://dbpedia.org/sparql/" );
      
    }

    public function vuePageOeuvre($result, $admin)
    {
        ?>
        <!-- Section présentation du film -->

        <div class="container">
            <div class="sectionPresentationFilm">
                <div class="row">
                    <div class="presentationFilm col-xxl-5 col-xl-5 col-lg-5 col-md-12 col-sm-12 mx-auto my-2">
                        <div class="imageFilm mx-auto">
                            <img src="<?php echo $result['image']; ?>" alt="<?php echo $result['image']; ?>">
                        </div>
                        <div class="titreFilm my-1 mx-auto">
                            <div class="titre text-center">
                                <p><?php echo $result['libelle']; ?></p>
                            </div>
                        </div>

                        <div class="texteNote my-1">
                            <p class="text-center mb-1"><?php $libelle=$result['libelle'];
                            
                            $resultatAuteurManga = "SELECT DISTINCT ?Auteur_
                WHERE
                     {
                        ?Lien dbo:type dbr:Manga .
                        ?Lien rdfs:comment ?Comm .
                        ?Lien rdfs:label ?nom .
                        ?Lien dbp:author ?auteur .
                        ?auteur dbp:name ?Auteur_ .
                        FILTER CONTAINS (?nom, '$libelle') . FILTER ( LANG ( ?Comm ) = 'en' )
                
                }";
                 $resultpManga2 = sparql_query( $resultatAuteurManga ); 

                 $fields1 = sparql_field_array( $resultpManga2 );
 
 
                 if( !$resultpManga2 ) { print sparql_errno() . ": " . sparql_error(). "\n"; exit; };
                 
                 foreach( $fields1 as $field )
                     {
                         print "<th>$field</th>";
                     }
                     print "</tr>";
                     while( $row = sparql_fetch_array( $resultpManga2 ) )
                     {
                         print "<tr>";
                         foreach( $fields1 as $field )
                         {
                             print "<td>$row[$field]</td>";
                         }
                         print "</tr>";
                     }
                     print "</table>";?> </p>
                        </div> 
                        
                        <div class="texteNote my-1">
                            <p class="text-center mb-1"> <?php if( !$this->db ) { print sparql_errno() . ": " . sparql_error(). "\n"; exit; }
                sparql_ns( "foaf","http://xmlns.com/foaf/0.1/" );
                
                $resultatDescriptionManga = "SELECT DISTINCT ?Description_ WHERE {
                    ?Lien dbo:type dbr:Manga .
                    ?Lien rdfs:comment ?Description_ .
                    ?Lien rdfs:label ?nom .
                    FILTER CONTAINS (?nom, '$libelle') .
                    FILTER ( LANG ( ?Description_ ) = 'en' )
                }";
               

                $resultpManga = sparql_query( $resultatDescriptionManga ); 

                $fields = sparql_field_array( $resultpManga );


                if( !$resultpManga ) { print sparql_errno() . ": " . sparql_error(). "\n"; exit; };
                
                foreach( $fields as $field )
                    {
                        print "<th>$field</th>";
                    }
                    print "</tr>";
                    while( $row = sparql_fetch_array( $resultpManga ) )
                    {
                        print "<tr>";
                        foreach( $fields as $field )
                        {
                            print "<td>$row[$field]</td>";
                        }
                        print "</tr>";
                    }
                    print "</table>"; ?> </p>
                        </div>

                        <div class="texteNote my-1">
                            <p class="text-center mb-1">Note:</p>
                        </div>

                        <div class="noteGlobale">
                            <p class="text-center"> <?php if (!isset($result['note'])) {
                                    echo "Non Noté";
                                } else {
                                    echo $result['note'];
                                } ?></p>
                        </div>
                    </div>
                </div>
            </div>

            

        </div>


        <?php
    }

    public function vueFormModifAVis($result)
    {
        ?>
        <div class="container">
            <div class="sectionFormulaire">
                <h2 class="my-3">Modifiez votre avis :</h2>
                <div class="formuaire mb-4">
                    <form action="index.php?module=oeuvre&action=modif_avis" method="POST">
                        <input type="hidden" value="<?php echo $result['idOeuvre']; ?>" name="oeuvre">
                        <input type="hidden" value="<?php echo $result['idAvis']; ?>" name="idAvis">
                        <div class="noteClient">
                            <label for="name">Votre note : </label>
                            <input type="number" name="note" id="noteClient" value="<?php echo $result['note']; ?>"
                                   min="1"
                                   max="10" required>
                        </div>
                        <div class="titreAvis mt-3">
                            <label for="name">Titre : </label>
                            <textarea name="titre" id="titreAvis" rows="1" cols="50"
                                      required><?php echo $result['titreAvis']; ?></textarea>
                        </div>
                        <div class="espaceCom mb-2">
                            <label for="commentaire">Votre Avis :</label>
                            <textarea name="avis" id="" rows="8" required><?php echo $result['critique']; ?></textarea>
                        </div>
                        <button type="submit" class="btn btn-success btn-lg">Envoyer</button>
                    </form>
                </div>
            </div>
        </div>
        <?php
    }


    //FONCTION ALERT
    public function vueAlertSucces($texte)
    {
        echo '
<div class="container">
    <div class="alert alert-success text-center" role="alert">' . $texte . '</div>
</div>';
    }

    public function vueAlertWarning($texte)
    {
        echo '
<div class="container">
    <div class="alert alert-warning text-center" role="alert">' . $texte . '</div>
</div>';
    }
}