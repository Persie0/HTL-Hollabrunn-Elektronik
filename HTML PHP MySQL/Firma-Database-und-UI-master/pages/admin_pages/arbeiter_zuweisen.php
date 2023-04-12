<!--Arbeiterseite, zu der man nach dem Login als Arbeiter hinkommt-->
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
<div class="topnav">
    <a  href="admin.php">Offene Aufträge</a>
    <a  href="alle_auftraege.php">Alle Aufträge</a>
    <a  href="alle_arbeiter.php">Alle Arbeiter</a>
    <a  href="alle_kunden.php">Alle Kunden</a>
    <a class="active" href="arbeiter_zuweisen.php">Arbeiter zuweisen</a>
    <a class="logout" href = "../../php_functions/logout.php">Ausloggen</a>
    <a class="name" ><?php echo $login_session?></a>
</div>
<div>
    <?php
    $query = "select auftrag.id as 'AuftragID', Standort, Preis, Deadline, Art, Erledigt from auftrag join Logo on LogoID=logo.ID where ArbeiterID=1;
";
    $result = mysqli_query($conn, $query);
    /*Alle Aufträge anzeigen lassen*/
    $query = "select arbeiter.vorname as 'Arbeitervorname',arbeiter.Nachname as 'Arbeiternachname', ID from arbeiter;";
    $options = mysqli_query($conn, $query);
    display_data_edit($result, $options)
    ?>
</div>
</body>

</html>