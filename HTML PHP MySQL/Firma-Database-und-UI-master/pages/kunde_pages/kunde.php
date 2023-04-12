<!--Kundenseite, zu der man nach dem Login als Kunde hinkommt-->
<?php
include "../../php_functions/session.php";
include "../../php_functions/connect.php";
include "../../php_functions/display_data.php";
?>
<html lang="en">
<head>
    <title>Alle Aufträge </title>
    <link rel="shortcut icon" type="image/png" href="../../images/favicon.jpg"/>
    <link rel="stylesheet" href="../../css_files/overview.css">
</head>

<body>
<!--Zeigt Usernamen und Interaktionsoptionen als Navigationsbar-->
<div class="topnav">
    <a class="active" href="kunde.php">Alle Aufträge</a>
    <a href="add_auftrag.php">Auftrag hinzufügen</a>
    <a href="offene_auftraege.php">Offene Aufträge</a>
    <a class="logout" href = "../../php_functions/logout.php">Ausloggen</a>
    <a class="name" ><?php echo $login_session?></a>
</div>
<div>
    <?php
    $query = "select Preis, Art, Erstelldatum, Standort, Deadline, Erledigt
from logo join auftrag on logo.id = auftrag.logoid join kunde on auftrag.kundeid = kunde.id WHERE Email='$email_check' AND Passwort='$pass_check' order by auftrag.id desc;
";
    $result = mysqli_query($conn, $query);
/*Zeigt alle Auträge des Kunden als Table an*/
    display_data($result);
    ?>
</div>
</body>

</html>