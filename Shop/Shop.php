<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width , initial-scale=1.0">
    <title>EverMall | Shoppage</title>
    <link rel="stylesheet" href="../Account/Account.css">
</head>
<body>

<!---------Navigation Bar------------>
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
                    <li><a href="Shop.php">Shop</a></li>
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

<!---------Content----------->
<h1>Shop Page</h1>
<hr/>

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