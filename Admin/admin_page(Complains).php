<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width , initial-scale=1.0">
    <title>EverMall | Admin page(Orders)</title>
    <link rel="stylesheet" href="Admin.css">
</head>
<body>

<?php
    require_once("complains.php");
   
    ?>


<!---------Navigation Bar--------->
<div class="hero">
<div style="margin: 0 auto" class="header">
   <div class="container1">
        <div class="navbar">
            <div class="logo">
                <img src="../Evermall(White).png" width="200px">
            </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="Logout.php">Logout</a></li>
                    </ul>
                </nav>
    
                <!--<img src="../eShopping/images/cart.png" width="30px" height="30px">--->
                <img src="../eShopping/images/menu.png" class="menu-icon"
                     onclick="menu-toggle()">
        </div>
    </div>
</div>

<div class="title1">
<h1 style="margin: 0 auto" class="title">Admin Page</h1>
</div>

<div style="margin: 0 auto" class="header1">
    <div class="container">
        <div style="text-align:center" class="navbar1">
                <nav>
                    <ul id="MenuItems">
                        <!--<li><a href="admin.php">Categories</a></li>
                        <li><a href="admin_page(Subcategory).php">Subcategories</a></li>---->
                        <li><a href="admin_page(Products).php">Products</a></li>
                        <li><a href="admin_page(Users).php">Users</a></li>
                        <li><a href="admin_page(Complains).php">Complains</a></li>
                    </ul>
                </nav>
            
        </div>
    </div>
</div>

<div style="margin: 0 auto" class="container">
   <div style="margin: 0 auto" class="product-display">
      <table class="product-display-table">
         <thead>
         <tr>
            <th>complain id</th>
            <th>user id</th>
            <th>complain</th>
            <th>response status</th>
            <th>action</th>
         </tr>
         </thead>
            
         <?php
                            if(is_array($fetchData)){
                                $sn=1;
                                foreach($fetchData as $data){
                            
                            ?>

         <tr>
            <td><?php echo $data['complain_id']?></td>
            <td><?php echo $data['user_id']?></td>
            <td><?php echo $data['complain']?></td>
            <!--<td>Ksh /-</td>
            <td></td>---->
            <td><?php echo $data['responce']?></td>
            <td>
               <a href="admin_update(Complains).php" class="btn"> edit </a>
               <!---<a href="admin_page(Orders).php" class="btn"> delete </a>--->
            </td>
         </tr>

         <?php
                            $sn++;}}else{?>
                            <tr>
                                <td colspan="8">
                                    <?php echo $fetchData; ?>
                                </td>
                                <tr>
                                    <?php
                                }?>


      </table>
   </div>
</div>

</div>

<!--------------footer------
<div class="footer">
    <div class="small-container">
        <div class="row">
            <div class="footer-col-1">
                <h3>Download Our App</h3>
                <p>Download App for Android and ios mobile phone.</p>
                <div class="app-logo">
                    <img src="../play-store.png">
                    <img src="../app-store.png">
                </div>
            </div>

            <div class="footer-col-4">
                <h3>Follow Us</h3>
                <ul>
                    <li>
                        Facebook
                    </li>
                    <li>
                        Twitter
                    </li>
                    <li>
                        Instagram
                    </li>
                    <li>
                        YouTube
                    </li>
                </ul>
            </div>

            <div class="footer-col-3">
                <h3>Additional Information</h3>
                <ul>
                    <li>
                        <a href="../Content/Blog articles on eShopping.html">Blog articles on eShopping</a>
                    </li>
                    <li>
                        <a href="../Content/Recommendations.html">Recommendations</a>
                    </li>
                    <li>
                        <a href="../Content/Tools%20and%20Tips.html">Tools and Tips</a>
                    </li>
                    <li>
                        <a href="../Offers/Free%20Shipping.html">Free Shipping</a>
                    </li>
                    <li>
                        <a href="../Updates/Product%20Launches.html">Product Launches</a>
                    </li>
                    <li>
                        <a href="../Updates/Announcements.html">Announcements</a>
                    </li>
                    <li>
                        <a href="../Offers/Discounts.html">Discounts</a>
                    </li>
                    <li>
                        <a href="../Offers/Coupons.html">Coupons</a>
                    </li>
                </ul>
            </div>

        </div>
        <hr>
        <p class="copyright">&#169; 2022 EverMall</p>
    </div>
</div>---->


</body>
</html>
