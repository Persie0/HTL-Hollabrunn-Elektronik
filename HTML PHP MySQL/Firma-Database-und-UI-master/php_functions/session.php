<?php
/*Schaut ob User die notwendigen Daten hat um angemeldet zu sein*/
include "connect.php";
session_start();

$email_check = $_SESSION["Email"];
$pass_check = $_SESSION["Passwort"];
$mode_check = $_SESSION["Mode"];
if (!($_SESSION["Email"] === "admin@mail.com" && $_SESSION["Passwort"] === "1234")) {
    if ($mode_check === "Arbeiter") {
        $sql = "SELECT * FROM arbeiter WHERE Email='$email_check' AND Passwort='$pass_check'";
    } else {
        $sql = "SELECT * FROM kunde WHERE Email='$email_check' AND Passwort='$pass_check'";
    }

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) === 1) {
        $row = mysqli_fetch_assoc($result);

        if (
            $row["Email"] === $email_check &&
            $row["Passwort"] === $pass_check
        ) {
            $login_session = $row["Vorname"] . " " . $row["Nachname"];
        } else {
            header("location: ../pages/index.php");
            die();
        }
    } else {
        header("location: ../pages/index.php");
        die();
    }
}
else
{
    $login_session = "Admin";
}
?>
