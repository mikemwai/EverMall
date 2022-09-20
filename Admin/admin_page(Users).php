<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width , initial-scale=1.0">
    <title>EverMall | Admin page(Users)</title>
    <link rel="stylesheet" href="Admin.css">
</head>
<body>

<!---------Navigation Bar--------->
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
</div>

<div style="margin: 0 auto" class="container">
    <div style="margin: 0 auto" class="admin-product-form-container">
     <form action="" method="post" enctype="multipart/form-data">
      <h3>Add new user</h3>
      <input type="text" id="fname" name="first_name" placeholder="enter first name" class="box"><p>

      <input type="varchar" id="lname" name="last_name" placeholder="enter last name" class="box"></p>

      <input type="email" id="Email" name="Email" placeholder="enter email" class="box"><p>

     <input type="password" id="password" name="password" placeholder="enter password" class="box"></p>

      <input type="varchar" id="sex" name="sex" placeholder="enter gender" class="box"></p>

      <input type="int" id="role" name="role" placeholder="enter role id" class="box"></p>
      <input type="submit" class="btn" name="add_user" value="add user">
     </form>
    </div><br>

   <div style="margin: 0 auto" class="product-display">
      <table style="margin: 0 auto" class="product-display-table">
         <thead>
         <tr>
            <th>user id</th>
            <th>first name</th>
            <th>last name</th>
            <th>email</th>
            <th>password</th>
            <th>gender</th>
            <th>role</th>
            <th>action</th>
         </tr>
         </thead>

         <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
               <a href="admin_update(Users).php" class="btn"> edit </a>
               <a href="admin_page(Users).php" class="btn"> delete </a>
            </td>
         </tr>

      </table>
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