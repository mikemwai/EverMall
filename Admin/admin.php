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
	<meta name="viewport" content="with=device-width, initial-scle=1.0">
	<meta charset="utf-8">
	<title>EVERMALL ADMIN DASHBOARD</title>	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../Vendor/dashing.css">
</head>

<body>
	<section id="sidebar">
		<a href=" class="brand">
			<a href="../Index/Index.php">
      <img src="../Evermall(Black).png" width="200px">
			</a>
  </a>

		<ul class="side-menu top">
			<li class="active">
			<a href="dashboard.php">
			<i class="fa fa-bars"></i>
		    <span class="text">Admin Dashboard</span>
		    </a></li>


			<li>
			<a href="productpage.php">
		    <i class="fa fa-tag"></i>
		    <span class="text"> Products</span>
		    </a></li>

			<li>
			<a href="orders.php">
			<i class="fa fa-bell"></i>
			<span class="text">Complains</span>
		    </a></li>

		    <li>
			<a href="">
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
			<a href="javascript:void(0)" class="dropbtn">Welcome <?php echo $_SESSION['first_name']; echo" "; echo $_SESSION['last_name']?>(Admin)</a>
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
</body>
</html>
