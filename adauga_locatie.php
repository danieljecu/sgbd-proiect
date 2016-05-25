<!DOCTYPE html>
<html>
<head>
    
</head>
<body>


<?php
        session_start();
        if (!isset($_SESSION['Username'])) 
        {
            header("Location: homeNeautentificat.html");
        }
?>
<?php   
   $conn = oci_connect('student', 'student', 'localhost/XE');
    if (!$conn) {
        $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}



        $output = '<!DOCTYPE html>
                <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="adauga_locatie.css">
                    <link rel="stylesheet" type="text/css" href="style.css">
                    <link rel="stylesheet" type="text/css" href="menu_dropdown_1.css">
                    <link rel="stylesheet" type="text/css" href="menu_dropdown_2.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
                    <script type="text/javascript" src="map.js"></script>
                    <script type="text/javascript" src="focus_menu.js"></script>
                    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBngR69niuAiblEs82gB8Qlx2QaETM4QWs&callback=initMap"> </script>
                    <title>Adaugare Locatii </title>
                </head>
                <body>

                    <div id="header"><a href="home.html"><img id="logoHome" src="../imagini/recomap.png" alt="RecoMap"></a>
                        <a class="ghost-button" href="log out.php">Sign out</a>
                        <div class="dropdown">
                          <button class="dropbtn">Menu</button>
                          <div class="dropdown-content">
                            <a href="adauga_locatie.html">Add Location</a>
                            <a href="#">Favourite Location</a>
                            <a href="#">Edit Preferences</a>
                            <a href="search.html">Search</a>
                            <a href="category.html">Choose category</a>
                          </div>
                        </div>

                        <div class="dropdown2"0>
                          <button class="dropbtn2">Altceva</button>
                          <div class="dropdown-content2">
                            <a href="#">Link 1</a>
                            <a href="#">Link 2</a>
                            <a href="#">Link 3</a>
                          </div>
                        </div>
                    </div> 

                    <form action="adauga_locatie_php.php" method="post">
                        <div>
                            <label for="nume">Nume:</label>
                            <input type="text" id="nume" name="nume" />
                        </div>
                        <div id="meniu_categorie">
                            <label for="categorie">Categorie:</label>
                            <select name="categorie">';
            
            $stid = oci_parse($conn, "SELECT TIP_RES FROM CATEG");

            $r = oci_execute($stid); 

            while ($row = oci_fetch_array($stid, OCI_ASSOC)) {
                $output .= '<option value="'.$row['TIP_RES'].'">'. $row['TIP_RES'] .'</option>';
            }

                            $output .=   '
                                
                            </select>
                        </div>
                        <div>
                            <label for="latitudine">Latitudine:</label>
                            <input type="text" id="latitudine" name="latitudine" />
                        </div>
                        <div>
                            <label for="longitudine">Longitudine:</label>
                            <input type="text" id="longitudine" name="longitudine" />
                        </div>
                        <div>
                            <label for="oras">Oras:</label>
                            <input type="text" id="oras" name="oras" />
                        </div>
                        <div>
                            <label for="tara">Tara:</label>
                            <select name="tara">';

            $stid = oci_parse($conn, "SELECT NUME_TARA FROM TARI");

            $r = oci_execute($stid); 

            while ($row = oci_fetch_array($stid, OCI_ASSOC)) {
                $output .= '<option value="'.$row['NUME_TARA'].'">'. $row['NUME_TARA'] .'</option>';
            }

                            $output .= '
                            </select>
                        </div>

                        <div>
                            <label for="descriere">Descriere:</label>
                            <textarea id="descriere" name="descriere"></textarea>
                        </div>
                        
                        <div class="button">
                            <button type="submit">Next</button>
                        </div>
                    </form>

                </body>
                </html>';

    echo $output;
        /*$file = 'adauga_locatie.html';
        file_put_contents($file, $output);*/
/*$stid = oci_parse($conn, 'BEGIN adauga_locatie(:v1, :v2, :v3, :v4, :v5, :v6, :v7); END;');
oci_bind_by_name($stid, ':v1', $userName);
oci_bind_by_name($stid, ':v2', $userCategorie);
oci_bind_by_name($stid, ':v3', $userLatitudine);
oci_bind_by_name($stid, ':v4', $userLongitudine);
oci_bind_by_name($stid, ':v5', $userOras);
oci_bind_by_name($stid, ':v6', $userTara);
oci_bind_by_name($stid, ':v7', $userDescriere);    */


/*$stid = oci_parse($conn, 'INSERT INTO locatii_adaugate (nume , categorie , latitudine , longitudine , oras , tara , descriere) VALUES(:v1, :v2 , :v3 ,:v4 ,:v5 , :v6 , :v7)');
oci_bind_by_name($stid, ':v1', $userName);
oci_bind_by_name($stid, ':v2', $userCategorie);
oci_bind_by_name($stid, ':v3', $userLatitudine);
oci_bind_by_name($stid, ':v4', $userLongitudine);
oci_bind_by_name($stid, ':v5', $userOras);
oci_bind_by_name($stid, ':v6', $userTara);
oci_bind_by_name($stid, ':v7', $userDescriere);*/

/*$r = oci_execute($stid);  

if ($r) {
    echo "<script type=\"text/javascript\">
            window.alert('Locatie adaugata cu succes');
            window.location='pizzerie.html';
            </script>";
}*/
/*echo "<script type=\"text/javascript\">
            window.location='" . $_SESSION['categorie'] . ".html';
            </script>";*/

oci_free_statement($stid);
oci_close($conn);
  
?>


</body>
</html>