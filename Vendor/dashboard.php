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
 ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>EVERMALL SELLER DASHBOARD</title>	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="dashing.css">
</head>

<body>
	<?php include 'sidebar.php'; ?>
	<!--Sidebar ended-->

	<!--Page Content-->

	<section id="content">
    <!-- NAVBAR -->
    <?php include 'header.php'; ?>

<!--/Top Navbar/-->
			<!--Main Body-->
			<!-- main Section -->

	 <main>
      <div class="head-title">
        
        <a href="#" class="btn-download">
          <i class='fa fa-download' ></i>
          <span class="text">Download report</span>
        </a>
      </div>

      <ul class="box-info">
        <li>
          <i class='' ></i>
          <span class="text">
          	 <p>Total Orders</p>           
            <h3>#</h3> 
          </span>
        </li>

        <li>
          <i class='' ></i>
          <span class="text">
          	<p>Orders awaiting processing</p>
            <h3>#</h3>
          </span>
        </li>

        <li>
          <i class='' ></i>
          <span class="text">
          	<p>Orders Processing</p>
            <h3>#</h3>           
          </span>
        </li>

         <li>
          <i class='' ></i>
          <span class="text">
          	<p>Ready for pickup</p>
            <h3>#</h3>           
          </span>
        </li>

         <li>
          <i class='' ></i>
          <span class="text">
          	<p>Orders completed</p>
            <h3>#</h3>           
          </span>
        </li>

         <li>
          <i class='' ></i>
          <span class="text">
          	<p>Orders Cancelled</p>
            <h3>#</h3>           
          </span>
        </li>

         <li>
          <i class='' ></i>
          <span class="text">
          	<p>Published products</p>
            <h3>#</h3>           
          </span>
        </li>

         <li>
          <i class='' ></i>
          <span class="text">
          	<p>Review &amp; Ratings</p>
            <h3>#</h3>           
          </span>
        </li>
      </ul>

</main>
</section>

</body>/
</html>
