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

<form class="returnOrder" action="wetter.php" method="post">
    Messungen Filtern: <br>
    Von
            <input type="text" onfocus="(this.type='date')" name="value1ToSearch" placeholder="<?php if(isset($_POST['search']))
            {
                echo $_POST['value1ToSearch'];
            }?>">
            bis
            <input type="text" onfocus="(this.type='date')" name="value2ToSearch" placeholder="<?php
            if(isset($_POST['search']))
            {
                echo $_POST['value2ToSearch'];
            }
    ?>">
            <input type="submit" name="search" value="Filtern"></form>
    <?php
    if(isset($_POST['search']))
    {
        $value2ToSearch = $_POST['value2ToSearch'];
        $value1ToSearch = $_POST['value1ToSearch'];
        $query = "select Ort, Temperatur, Timest as Timestamp from Wettermessung WHERE DATE(Timest) BETWEEN '".$value1ToSearch."' AND '".$value2ToSearch."';";
        
    }
     else {
        $query = "select Ort, Temperatur, Timest as Timestamp from Wettermessung;";
    }
    $result = mysqli_query($conn, $query);
    /*Alle Aufträge anzeigen lassen*/
    display_data($result);
    ?>
</div>
</body>

</html>