<?php

$ip= "192.168.188.177";

$user= "fsst";

$password = "pw";

$db_name = "fsst";

$conn = mysqli_connect($ip, $user, $password, $db_name);

if (!$conn) {
    echo "Connection failed!";
}