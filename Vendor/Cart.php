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
 <?php

require("connection.php");
if(isset($_POST['update_btn'])){
  $update_value=$_POST['update_quantity'];
  $update_id=$_POST['update_quantity_id'];
  $update_quantity_query=mysqli_query($conn,"UPDATE `tbl_cart` SET quantity='$update_value' WHERE id='$update_id'");
  if($update_quantity_query){
    header('location: Cart.php');
  };
};

if(isset($_GET['remove'])){
  $remove_id=$_GET['remove'];
  mysqli_query($conn, "DELETE FROM `cart` WHERE id='$remove_id'");
  header('location: Cart.php');
};

if(isset($_GET['delete_all'])){
   mysqli_query($conn, "DELETE FROM `cart`");
   header('location:Cart.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>EVERMALL SELLER DASHBOARD</title>	
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
        width: 170px;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
        -o-transition: all 0.5s;
        transition: all 0.5s;
        cursor: pointer;
        margin: 5px;
      }

    </style>
	
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

<div>
				<button type="button" onclick="window.location.href='invoice.php';">VIEW PREVIOUS ORDERS</button>
	        </div>

<!--Main Body-->
			<!-- main Section -->
<table class="table" style= "width: 100%" alt="No product in cart">
			<thead>
            <th>user_id</th>
            <th>product_id</th>
            <th>product name</th>          
            <th>product price</th>
            <th>product image</th>           
            <th>quantity</th>
		 <th>sub-Total</th>           
            <th>action</th>
			</thead>
<tbody>
				 <?php
         $select_cart = mysqli_query($conn, "SELECT * FROM `tbl_cart` WHERE user_id='$user_id'");
            $grand_total = 0;
            if(mysqli_num_rows($select_cart)>0){
              while($fetch_cart=mysqli_fetch_assoc($select_cart)){
              ?>
              <tr>
<tr>
		    <td> <?php echo $fetch_cart['user_id'];?></td>
		    <td> <?php echo $fetch_cart['product_id'];?></td>
		    <td> <?php echo $fetch_cart['name'];?></td>
		    <td> $<?php echo number_format($fetch_cart['price']);?></td>
                <td><img src="./image/<?php echo $fetch_cart['image'];?>"alt="" height="100"></td>
                <td><form action="" method="post">
                  <input type="hidden" name="update_quantity_id" value="<?php echo $fetch_cart['id'];?>">

                  <input type="number" name="update_quantity" min="1" value="<?php echo $fetch_cart['quantity'];?>">

                  
                  <input type="submit" value="update" name="update_btn">
                </form>
                <td><?php echo $sub_total =number_format($fetch_cart['price'] * $fetch_cart['quantity']);?></td>
                <td><a href="Cart.php?remove=<?php echo $fetch_cart['id'];?>" class="btn" onclick="return confirm('remove item from cart?')">REMOVE</a></td>


              </tr>
<?php
if (is_numeric($fetch_cart['quantity']) && is_numeric($fetch_cart['price'])) {
  $grand_total += ((int)$fetch_cart['quantity'] * (int)$fetch_cart['price']);
}
 
  
              };
            }else{
               $grand_total = 0;
            };

          ?>
          <tr class="table-bottom">
          
            <td><a href="products.php" class="btn" >Continue shopping</a></td>
            <td colspan="3">grand total</td>
            <td><?php echo $grand_total;?></td>
              <td><a href="Cart.php?delete_all" class="btn" onclick="return confirm('are you sure you want to delete all?')">DELETE ALL</a></td>
              <td colspan="2">  <a href="checkout.php" class="btn <?=($grand_total >1)?'': 'disabled';?>">Proceed to checkout</a></td>

          </tr>
        </tbody>   
      </table>
       
  </section>
</body>
</html>
 