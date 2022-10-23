<?php

require("../Admin/connection.php");
session_start();

$user_id=$_SESSION['user_id'];

if(!isset($_SESSION['first_name'])){
   header('location:../Account/Account.php');
}
if(!isset($_SESSION['last_name'])){
    header('location:../Account/Account.php');
 }
 if(!isset($_SESSION['user_id'])){
    header('location:../Account/Account.php');
 }

 if(isset($_GET['delete'])){
    $prod_id=$_GET['delete'];
    mysqli_query($conn,"DELETE FROM tbl_product WHERE product_id=$prod_id");
    header('location:admin(Products).php');
}
 ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="with=device-width, initial-scle=1.0">
	<meta charset="utf-8">
	<title>EVERMALL | Admin page(Products)</title>	
    <style>
     button {
        display: inline-block;
        background-color: burlywood;
        border-radius: 5px;
        border: 4px double #cccccc;
        color: teal;
        text-align: center;
        font-size: 15px;
        padding: 10px;
        width: 110px;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
        -o-transition: all 0.5s;
        transition: all 0.5s;
        cursor: pointer;
        margin: 5px;
      }

    </style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../Vendor/dashing.css">
  <link rel="stylesheet" href="Admin.css">
</head>

<body>
	<section id="sidebar">
		<a href=" class="brand">
			<a href="../Index/Index.php">
      <img src="../Evermall(Black).png" width="200px">
			</a>
  

		<ul class="side-menu top">
			<li>
			<a href="admin.php">
			<i class="fa fa-bars"></i>
		    <span class="text">Admin Dashboard</span>
		    </a></li>


			<li class="active">
			<a href="admin(Products).php">
		    <i class="fa fa-tag"></i>
		    <span class="text"> Products</span>
		    </a></li>

      <li>
			<a href="admin(Categories).php">
      <i class='fa fa-tags'></i>
			<span class="text">Categories</span>
		  </a></li>

      <li>
			<a href="admin(SubCategories).php">
      <i class='fa fa-tags'></i>
			<span class="text">Sub Categories</span>
		  </a></li>

			<li>
			<a href="admin(Complains).php">
			<i class="fa fa-bell"></i>
			<span class="text">Complains</span>
		    </a></li>

		    <li>
			<a href="admin(Users).php">
			<i class="fa fa-user"></i>
			<span class="text">Users</span>
		    </a></li>

		    <!--<li>
			<a href="">
			<i class="fa fa-thumbs-up"></i>
			<span class="text">Review &amp; Ratings</span>
		    </a></li>

		    <li>
			<a href="">
			<i class="fa fa-gears"></i>
			<span class="text">Settings</span>
		    </a></li>

		    <li>
			<a href="">
			<i class="fa fa-user"></i>
			<span class="text">Customer Dashboard</span>
		    </a></li>---->

		    <li>
          <a href="../Account/Logout.php" class="logout">
          <i class="fa fa-user"></i>
          <span class="text">Logout</span>
        </a>
      </li>

		</ul>
	</section>
	<!--Sidebar ended-->

	<!--Page Content-->

	<section id="content">
    <!-- NAVBAR -->
    <nav>
     
      <i class="fa fa-bars"></i>
      <a href="#" target="_blank" class="nav-link">View Your Store</a>

      <form action="#">
        <div class="form-input">
          <input type="search" placeholder="Search...">
          <button type="submit" class="search-btn">
            <i class='fa fa-arrow-right' ></i></button>
        </div>
      </form>		

<?php

$select = mysqli_query($conn, "SELECT * FROM tbl_users");

?>

			<ul>
			<li class="profile">
			<a href="javascript:void(0)" class="nav-link"><i class="fa fa-user"> </i><?php echo"  "; echo $_SESSION['first_name']; echo" "; echo $_SESSION['last_name']?></a>
    <!--<div class="dropdown-content">
      <a href="#">Account</a><br>
      <a href="../Account/Logout.php">Logout</a>
  </div>--->
</li>
</ul>

</nav>	

<!--/Top Navbar/-->
			<!--Main Body-->
			<!-- main Section -->

	<main>
 
    <div>
		<button type="button" onclick="window.location.href='admin_page(Products).php';">Add New</button>
	</div>

    <table class="table" style= "width: 100%">
    <thead>
         <tr>
            <th>Product id</th>
            <th>Vendor id</th>
            <th>Product image</th>
            <th>Product name</th>
            <th>Product description</th>
            <th>Product price</th>
            <th>Subcategory name</th>
            <th>Category name</th>
            <th>Available quantity</th>
            <th>Product keywords</th>
            <th>Action</th>
         </tr>
         </thead>

         <?php
                require_once("connections.php");
                
                

                
                while($row = mysqli_fetch_array($sql)){
                    
                ?>
            <tr>
        
            <td><?php echo $row["product_id"]?></td>
            <td><?php echo $row["vendor_id"]?></td>
            <td><img src="uploaded_image/<?php echo $row["product_image"]; ?>" height="100" alt=""></td>
            <td><?php echo $row["product_name"]?></td>
            <td><?php echo $row["product_description"]?></td>
            <td>Ksh <?php echo $row["unit_price"]?>/-</td>
            <td><?php echo $row["subcategory_name"]?></td>
            <td><?php echo $row["category_name"]?></td>
            <td><?php echo $row["available_quantity"]?></td>
            <td><?php echo $row["product_keywords"]?></td>
            <td>
               <a href="admin_update(Products).php?edit=<?php echo $row["product_id"];?>" class="btn"> edit </a>
               <a href="admin(Products).php?delete=<?php echo $row["product_id"];?>" class="btn"> delete </a>
            </td>
         </tr>
         <?php 
            }
                ?>
			
		</table>

   </main>
</section>
</body>
</html>
