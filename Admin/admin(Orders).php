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
    <title>EverMall | Admin page(Orders)</title>    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../Vendor/dashing.css">
    <link rel="stylesheet" href="Admin.css">
</head>
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


			<li>
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

          <li class="active">
			<a href="admin(Orders).php">
            <i class='fa fa-bell'></i>
			<span class="text">Orders</span>
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

        <div class="card-header">
            <!--<h1>ORDER LIST</h1>--->
            
            <button type="button" onclick="window.location.href='admin_page(Orders).php';">Send Order</button>
            <!--<button type="button" onclick="window.location.href='pending.php';">Pending</button>
            <button type="button" onclick="window.location.href='orderconfirmed.php';">Confirmed</button>
            <button type="button" onclick="window.location.href='orderpickup.php';">Pickup</button>
            <button type="button" onclick="window.location.href='ordercompleted.php';">Completed</button>
            <button type="button" onclick="window.location.href='cancelledorders.php';">Cancelled</button>---->
        </div>
        <table class="table" style= "width: 100%">
            <thead>
                <th>Order No</th>
                <th>Vendor id</th>
                <th>Total Products</th>
                <th>Total Amount</th>
                <th>Order Status</th>
                <th>Paid by</th>

                <th>Order Date</th>               
                
                <th>Action</th>
            </thead>
        
                <tbody>
                    <?php
                require_once("orderView.php");
                 foreach($result as $key =>$value)
                {
                    ?>
                    <tr>
                        <td><?php echo $value["order_id"] ?></td>
                        <td><?php echo $value["vendor_id"]?></td>
                        <td><?php echo $value["total_products"] ?></td>
                        <td>Ksh <?php echo $value["order_amount"] ?> /-</td>
                        <td><?php echo $value["order_status"] ?></td>
                        <td><?php echo $value["payment_type"] ?></td>
                        <td><?php echo $value["created_at"] ?></td>                        
                         <!--<td> <a href="productpage.php?edit=<?php echo $value['id']; ?>"  onClick="edit(this);" title="Edit" >  <input type="image" src="Images/edit.png" title="Edit"> </a></td>

                        <td><a href="productpage.php?delete=<?php echo $value['id']; ?>" onclick="return confirm('are your sure you want to delete this?');" title="Delete" ><input type="image" src="Images/trash.png" title="Trash">  </a></td>-->

                        <td>
                            <button type="button" class="btn btn-flat border btn-light btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                Action
                            <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu" role="menu">
                                <a class="dropdown-item view_data" href="javascript:void(0)" data-id="<?= $row['id'] ?>" data-code="<?= $row['code'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
                            </div>
                        </td>
                    </tr>
                <?php
                    }    
            
                ?>
                </tbody>
            </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('.view_data').click(function(){
            uni_modal("View Order Details - <b>"+($(this).attr('data-code'))+"</b>","orders/view_order.php?id="+$(this).attr('data-id'),'mid-large')
        })
        $('table').dataTable();
    })
</script>
</section>
</body>
</html>