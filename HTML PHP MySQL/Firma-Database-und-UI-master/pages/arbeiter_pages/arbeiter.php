<!--Arbeiterseite, zu der man nach dem Login als Arbeiter hinkommt,
man kann Aufträge als erledigt markieren-->
<?php
include "../../php_functions/session.php";
include "../../php_functions/connect.php";
include "../../php_functions/display_data.php";

?>
<html lang="en">
<head>
    <title>Auftrag erledigen </title>
    <link rel="shortcut icon" type="image/png" href="../../images/favicon.jpg"/>
    <link rel="stylesheet" href="../../css_files/overview.css">
</head>

<body>
<div class="topnav">
    <a class="active" href="arbeiter.php">Offene Aufträge</a>
    <a href="alle_auftraege.php">Alle Aufträge</a>
    <a class="logout" href = "../../php_functions/logout.php">Ausloggen</a>
    <a class="name" ><?php echo $login_session?></a>
</div>

<?php
$query = "select Auftrag.ID, Logo.Standort, Deadline, Typ, Art, Erledigt
from logo join auftrag on logo.id = auftrag.logoid join arbeiter on auftrag.arbeiterid = arbeiter.id
 WHERE Email='$email_check' AND Passwort='$pass_check' and Erledigt = 'N' order by Deadline;
";
$result = mysqli_query($conn, $query);
/*Ausstehende Aufträge des Arbeiters anzeigen*/
display_data_erledigt($result);
?>

</body>

</html>