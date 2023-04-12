<!--Adminseite, zu der man nach dem Login als Admin hinkommt,
zeigt alle ausstehenden Aufträge + Arbeiter dazu an-->

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
    <a class="active" href="admin.php">Offene Aufträge</a>
    <a  href="alle_auftraege.php">Alle Aufträge</a>
    <a  href="alle_arbeiter.php">Alle Arbeiter</a>
    <a  href="alle_kunden.php">Alle Kunden</a>
    <a href="arbeiter_zuweisen.php">Arbeiter zuweisen</a>
    <a class="logout" href = "../../php_functions/logout.php">Ausloggen</a>
    <a class="name" ><?php echo $login_session?></a>
</div>

<?php
$query = "select Deadline,Preis,Erstelldatum,Art,Standort,Zustand,Typ,Vorname as 'Arbeitervorname',Nachname as 'Arbeiternachname' from auftrag join logo on logo.id = auftrag.logoid join arbeiter on arbeiter.ID = auftrag.ArbeiterID where erledigt = 'N' order by Deadline;";
$result = mysqli_query($conn, $query);
/*zeigt alle ausstehenden Aufträge + Arbeiter dazu an*/
display_data($result);
?>
</body>

</html>