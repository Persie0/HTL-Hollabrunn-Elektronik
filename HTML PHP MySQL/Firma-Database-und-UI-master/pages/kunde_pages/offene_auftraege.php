<!--Arbeiterseite, zu der man nach dem Login als Arbeiter hinkommt
man kann Aufträge als erledigt markieren-->
<?php
include "../../php_functions/session.php";
include "../../php_functions/connect.php";
include "../../php_functions/display_data.php";

?>
<html lang="en">
<head>
    <title>Offene Aufträge </title>
    <link rel="shortcut icon" type="image/png" href="../../images/favicon.jpg"/>
    <link rel="stylesheet" href="../../css_files/overview.css">
</head>

<body>
<div class="topnav">
    <a href="kunde.php">Alle Aufträge</a>
    <a href="add_auftrag.php">Auftrag hinzufügen</a>
    <a class="active" href="offene_auftraege.php">Offene Aufträge</a>
    <a class="logout" href = "../../php_functions/logout.php">Ausloggen</a>
    <a class="name" ><?php echo $login_session?></a>
</div>

<?php
$query = "select Deadline, auftrag.ID ,logo.Standort, Typ, Art, arbeiter.Vorname as 'Arbeitervorname', arbeiter.Nachname as 'Arbeiternachname', arbeiter.Telefonnummer as 'ArbeiterTNr'
from logo join auftrag on logo.id = auftrag.logoid join arbeiter on auftrag.arbeiterid = arbeiter.id join kunde on auftrag.KundeID = kunde.ID
 WHERE kunde.Email='$email_check' AND kunde.Passwort='$pass_check' and Erledigt = 'N' order by auftrag.ID;
";
$result = mysqli_query($conn, $query);
/*Ausstehende Aufträge des Arbeiters anzeigen*/
display_data($result);
?>

</body>

</html>