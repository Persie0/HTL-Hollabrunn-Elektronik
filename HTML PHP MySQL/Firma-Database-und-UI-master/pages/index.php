<?php
session_start();
?>
<!--Login/Index Seite, zeigt Login-Form für User an-->
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>Log In</title>
        <link rel="shortcut icon" type="image/png" href="../images/favicon.jpg"/>
        <link rel="stylesheet" href="../css_files/login_page.css">
    </head>
    <body>
    <div class="parent clearfix">
        <div class="bg-illustration">
            <!--<img src="../images/favicon.jpg" alt="logo">-->
        </div>

        <div class="login">
            <div class="container">
                <h1>Login to access<br />your account</h1>

                <div class="login-form">
                    <form method="post" action="../php_functions/login.php" >
                        <label for="txt_email"></label><input type="email" class="textbox" id="txt_email" name="txt_email" placeholder="Email" />
                        <br>
                        <label for="txt_pwd"></label><input type="password" class="textbox" id="txt_pwd" name="txt_pwd" placeholder="Password"/>

                        <div class="error-message">
                            <?php
                            /*Falls error beim Einloggen*/
                            if(isset($_SESSION["error"])){
                                $error = $_SESSION["error"];
                                echo "<span>$error</span>";
                            }
                            ?>
                        </div>
                        <div class="forget-pass">
                            <a href="mailto:admin@mail.com">Forgot password?</a>
                        </div>
                        <button type="submit">Login</button>

                    </form>
                </div>

            </div>
        </div>
    </div>
    </body>
    </html>

<?php
/*Error wieder löschen*/
unset($_SESSION["error"]);
?>