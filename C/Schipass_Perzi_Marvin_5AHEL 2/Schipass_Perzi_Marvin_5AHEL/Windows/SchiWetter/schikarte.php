<?php
include "./php_functions/connect.php";
include "./php_functions/display_data.php";
?>


<html lang="en">
<head>
    <title>Schikarten</title>
    <link rel="shortcut icon" type="image/png" href="./images/favicon.jpg"/>
    <link rel="stylesheet" href="./css_files/overview.css">
</head>

<body>
<div class="topnav">
    <a class="logout" href = "./php_functions/logout.php">Verlassen</a>
</div>
<div>

<form class="returnOrder" action="schikarte.php" method="post">
    Schikartennummer Filtern: 
            <input type="text" name="valueToSearch" placeholder="<?php
            if(isset($_POST['search']))
            {
                echo $_POST['valueToSearch'];
            }
            else{
                echo "Skikartennummer";
            }
    ?>
    ">
            <input type="submit" name="search" value="Filtern"></form>
    <?php
    if(isset($_POST['search']))
    {
        $valueToSearch = $_POST['valueToSearch'];
        $query = "select Skicardnr as Schikartennummer, Timest as Timestamp from Skicardevent WHERE Skicardnr LIKE '%".$valueToSearch."%'";
        
    }
     else {
        $query = "select Skicardnr as Schikartennummer, Timest as Timestamp from Skicardevent;";
    }
    $result = mysqli_query($conn, $query);
    /*Alle Aufträge anzeigen lassen*/
    display_data($result);
    ?>
</div>
</body>

</html>