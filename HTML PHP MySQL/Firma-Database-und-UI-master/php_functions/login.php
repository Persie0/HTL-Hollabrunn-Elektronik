<?php
session_start();
/*Funktionen der login Seite, leitet Admin, Arbeiter oder Kunde zu jeweiliger Seite weiter
und speichert Daten als Session*/

include "../php_functions/connect.php";

if (isset($_POST["txt_email"]) && isset($_POST["txt_pwd"])) {
    $email = $_POST["txt_email"];

    $pass = $_POST["txt_pwd"];

    if (empty($email)) {
        $_SESSION["error"] = 'Email is required';
        header("Location: ../pages/index.php");
        exit();
    } elseif (empty($pass)) {
        $_SESSION["error"] = 'Password is required';
        header("Location: ../pages/index.php");
        exit();
    } else {
        if ($email === "admin@mail.com" && $pass === "1234") {
            $_SESSION["Email"]    = "admin@mail.com";
            $_SESSION["Passwort"] = "1234";
            $_SESSION["Mode"]     = "Admin";
            header("Location: ../pages/admin_pages/admin.php");
        } else {
            $sql = "SELECT * FROM arbeiter WHERE Email='$email' AND Passwort='$pass'";

            $result = mysqli_query($conn, $sql);

            if (mysqli_num_rows($result) === 1) {
                $row = mysqli_fetch_assoc($result);

                $_SESSION["Email"] = $row["Email"];

                $_SESSION["Passwort"] = $row["Passwort"];

                $_SESSION["Mode"] = "Arbeiter";
                header("Location: ../pages/arbeiter_pages/arbeiter.php");
            } else {
                $sql = "SELECT * FROM kunde WHERE Email='$email' AND Passwort='$pass'";
                $result = mysqli_query($conn, $sql);
                if (mysqli_num_rows($result) === 1) {
                    $row = mysqli_fetch_assoc($result);
                    $_SESSION["Email"] = $row["Email"];
                    $_SESSION["Passwort"] = $row["Passwort"];
                    $_SESSION["Mode"] = "Kunde";
                    header("Location: ../pages/kunde_pages/kunde.php");
                }
                else {
                    $_SESSION["error"] = "Email/Password incorrect";
                    header("Location: ../pages/index.php");
                }
            }
            exit();
        }
    }
} else {
    $_SESSION["error"] = "Email/Password incorrect";
    header("Location: ../pages/index.php");
}
