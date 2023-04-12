<?php
/*Setzt Arbeiter von Auftrag auf übergebene ID*/
require('connect.php');
$arbeiter_id=$_POST['arbeiter_id'];//ID via post holen
$auftrag_id=$_POST['auftrag_id'];//ID via post holen
$query = "UPDATE auftrag SET ArbeiterID=". $arbeiter_id . " WHERE auftrag.id=" . $auftrag_id . ";";
$result = mysqli_query($conn, $query);
if ($result) {
    header("Location: ../pages/admin_pages/alle_auftraege.php");
} else {
    echo "Error updating record: " . mysqli_error($conn);
}
