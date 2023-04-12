<!--Admin kann hier alle Kunden sehen-->
<?php
include "../../php_functions/session.php";
include "../../php_functions/connect.php";
include "../../php_functions/display_data.php";

?>
<html lang="en">
<head>
    <title>Alle Kunden </title>
    <link rel="shortcut icon" type="image/png" href="../../images/favicon.jpg"/>
    <link rel="stylesheet" href="../../css_files/overview.css">
</head>

<body>
<div class="topnav">
    <a  href="admin.php">Offene Aufträge</a>
    <a   href="alle_auftraege.php">Alle Aufträge</a>
    <a  href="alle_arbeiter.php">Alle Arbeiter</a>
    <a  class="active" href="alle_kunden.php">Alle Kunden</a>
    <a href="arbeiter_zuweisen.php">Arbeiter zuweisen</a>
    <a class="logout" href = "../../php_functions/logout.php">Ausloggen</a>
    <a class="name" ><?php echo $login_session?></a>
</div>
<div>
    <?php
    $query = "select * from kunde;

";
    $result = mysqli_query($conn, $query);
    /*Alle Aufträge anzeigen lassen*/
    display_data($result);
    ?>
</div>
</body>

</html>