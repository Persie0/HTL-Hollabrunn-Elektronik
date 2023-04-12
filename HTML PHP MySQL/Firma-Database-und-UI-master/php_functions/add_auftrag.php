<?php
include "connect.php";
session_start();

$email_check = $_SESSION["Email"];
$pass_check = $_SESSION["Passwort"];
$sql = "SELECT * FROM kunde WHERE Email='$email_check' AND Passwort='$pass_check'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) === 1)
{

    $location=$_POST['location'];
    $logo=$_POST['logo_select'];
    $row = mysqli_fetch_array($result);
    $id=$row['ID'];
    $deadline = $_POST['deadline'];
    if($logo=== "Anbringen")
    {
        $required = array('logo_select', 'deadline', 'location', 'auftragsart', 'type_select');//type_select= type & cost
        foreach($required as $field) {
            if (empty($_POST[$field])) {
                $_SESSION["error"] = $field;
                header("Location: ../pages/kunde_pages/add_auftrag.php");
                exit();
            }
        }
        $auftragsart = $_POST['auftragsart'];
        $type_cost = explode('|',$_POST['type_select'] );
        $type=$type_cost[0];
        $cost=intval($type_cost[1]);

        $sql = "INSERT INTO logo (standort, zustand, typ)
VALUES ('$location', '$logo', '$type');";
        $result = mysqli_query($conn, $sql);
        if (!$result) {
            $_SESSION["error"] = "Error beim Erstellen des neuen Logos: " . mysqli_error($conn);
            header("Location: ../pages/kunde_pages/add_auftrag.php");
            exit();
        }
        else
        {
            $query = "select logo.ID
        from logo WHERE logo.Standort='$location' and typ='$type' and Zustand='$logo';
        ";
            $result = mysqli_query($conn, $query);
            if (mysqli_num_rows($result) !== 1) {
                $_SESSION["error"] = "Error beim Erstellen des neuen Logos:";
                header("Location: ../pages/kunde_pages/add_auftrag.php");
                exit();
            }
            else {
                $row = mysqli_fetch_assoc($result);
                $logo_id = $row['ID'];
            }
        }
    }
    else
    {
        $required = array('auftragsart2', 'logo_select', 'deadline');
        foreach($required as $field) {
            if (empty($_POST[$field])) {
                $_SESSION["error"] = "Ein Eingabefeld war leer!";
                header("Location: ../pages/kunde_pages/add_auftrag.php");
                exit();
            }
        }
        $auftragsart = $_POST['auftragsart2'];
        if($auftragsart==="Reparieren")
            $cost=190;
        else
            $cost=230;
        $query = "select logo.ID
        from logo join auftrag on logo.id = auftrag.logoid join kunde on auftrag.kundeid = kunde.id WHERE Email='$email_check' AND Passwort='$pass_check' and Standort='$logo';
        ";
        $result = mysqli_query($conn, $query);
        $row = mysqli_fetch_array($result);
        $logo_id=$row['ID'];
    }
    $sql = "INSERT INTO auftrag (Preis, Erstelldatum, Deadline, Art, KundeID, LogoID, ArbeiterID)
VALUES ($cost, CURDATE() , '$deadline', '$auftragsart', $id, $logo_id, 1);";
    $result = mysqli_query($conn, $sql);
    if ($result) {
        header("Location: ../pages/kunde_pages/kunde.php");
    } else {
        $_SESSION["error"] = "Auftrag konnte nicht hinzugefügt werden: " . mysqli_error($conn);
        header("Location: ../pages/kunde_pages/add_auftrag.php");
    }
}


