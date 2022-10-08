<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width , initial-scale=1.0">
    <title>EverMall | Account</title>
    <link rel="stylesheet" href="Account.css">
</head>
<body>
<div style="margin: 0 auto" class="hero">
    <div class="header">
        <div class="container">
            <div class="navbar">
                <a href="../Index/Index.php">
                <div class="logo">
                    <img src="../Evermall(White).png" width="200px">
                </div>
                </a>

                <nav>
                <div class="nav-links" id="navLinks">
                <img src="../close.png" class="menu-icon"
                 onclick="hideMenu()">
                <ul id="MenuItems">
                    <li><a href="../Index/Index.php">Home</a></li>
                    <li><a href="../Homepage/Shoppage.php">Shop</a></li>
                    <li><a href="../About/About.php">About</a></li>
                    <li><a href="../Contact%20Us/Contact.php">Contact</a></li>
                    <li><a href="../Account/Account.php">Account</a></li>
                    <li><a href="../Vendor/Cart.php">Cart</a></li>
                </ul>
                </div>
                </nav>

                <img src="../menu.png" class="menu-icon"
                 onclick="showMenu()">
            </div>
        </div>
    </div>
    
    <div style="margin: 0 auto" class="form-box">
    
        <div class="form-container">
            <?php
           if(isset($error))
           {
            foreach($error as $error)
            {
            echo '<span class="error-msg">'.$error.'</span>';
             };
           };
           ?>
        </div>       
    
        <div class="button-box">
            <div id="btn"></div>
            <button type="button" class="toggle-btn" onclick="login()">Log In</button>
            <button type="button" class="toggle-btn" onclick="register()">Register</button>
        </div>
        <!--<div class="social-icons">
            <img src="fb.png">
            <img src="tw.png">
            <img src="gp.png">
        </div>--->

        <!------------Login Form-------------->
        <form id="login" action="Account(login).php" method="post" class="input-group">              
                  <input type="email" id="Email" name="Email" placeholder="Email" class="input-field"></p>
                  <input type="password" id="password" name="password" placeholder="Password" class="input-field"></p>
                   <input type="submit" value="Login" name="Login" class="submit-btn"><br>
                   <!--<p>Forgotten Password?</p>
                   <a href="Account_update.php?edit=<?php //echo $row['user_id']; ?>">
                   <p>Reset Password</p>--->
                   </a>
                   <!---<p>Don't have an account? <a href="../Account/Registration.php">Register Now</a></p>--->
        </form>

        <!-----------Registration Form------->
        <form id="register" action="Account(register).php" method="" class="input-group">    
             <input type="text" id="fname" name="first_name" placeholder="FirstName" class="input-field"><p>
             <input type="varchar" id="lname" name="last_name" placeholder="LastName" class="input-field"></p>
             <input type="email" id="Email" name="email" placeholder="Email" class="input-field"><p>
             <input type="password" id="password" name="password" placeholder="Password" class="input-field"></p>
             <input type="varchar" id="sex" name="gender" placeholder="Gender" class="input-field"></p>
             <!--<input type="checkbox" class="chech-box">I agree to the Terms and Conditions--->
   
             <input type="submit" value="Register" name="registration" class="submit-btn"><br></br>
       </form>

    </div>

</div>

<script>
    var x=document.getElementById("login");
    var y=document.getElementById("register");
    var z=document.getElementById("btn");
    function register()
    {
        x.style.left="-400px";
        y.style.left="50px";
        z.style.left="110px";
    }
    
    function login()
    {
        x.style.left="50px";
        y.style.left="450px";
        z.style.left="0px";
    }
</script>

<!--------------JavaScript for Toggle Menu----------------->
<script>
    var navLinks=document.getElementById("navLinks");
    function showMenu()
    {
        navLinks.style.right="0";
    }

    function hideMenu()
    {
        navLinks.style.right="-200px";
    }
</script>

</body>
</html>