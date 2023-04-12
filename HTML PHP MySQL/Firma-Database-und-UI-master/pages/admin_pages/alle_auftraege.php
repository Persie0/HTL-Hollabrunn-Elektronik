<!--Admin kann hier alle Aufträge + Arbeiter + Kunde sehen-->
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
    <a  class="active" href="alle_auftraege.php">Alle Aufträge</a>
    <a  href="alle_arbeiter.php">Alle Arbeiter</a>
    <a  href="alle_kunden.php">Alle Kunden</a>
    <a href="arbeiter_zuweisen.php">Arbeiter zuweisen</a>
    <a class="logout" href = "../../php_functions/logout.php">Ausloggen</a>
    <a class="name" ><?php echo $login_session?></a>
</div>
<div>
    <?php
    $query = "select Deadline, auftrag.ID as 'AuftragID', logo.Standort, auftrag.Art, auftrag.Erstelldatum, kunde.vorname as 'Kundenvorname', kunde.Nachname as 'Kundennachname', kunde.Telefonnummer as 'KundeTNr.', arbeiter.Vorname as 'Arbeitervorname', arbeiter.Nachname as 'Arbeiternachname', arbeiter.Telefonnummer as 'ArbeiterTNr.'
from logo join auftrag on logo.id = auftrag.logoid join kunde on auftrag.kundeid = kunde.id join arbeiter on auftrag.arbeiterid = arbeiter.id order by Deadline;

";
    $result = mysqli_query($conn, $query);
    /*Alle Aufträge anzeigen lassen*/
    display_data($result);
    ?>
</div>
</body>

</html>