<?php
/*Setzt Auftrag mit übergebener ID auf erledigt*/
require('connect.php');
$id=$_POST['auftrag_id'];//ID via post holen
$query = "UPDATE auftrag SET Erledigt='Y' WHERE id=$id;";
$result = mysqli_query($conn, $query);
if ($result) {
    header("Location: ../pages/arbeiter_pages/arbeiter.php");
} else {
    echo "Error updating record: " . mysqli_error($conn);
}
