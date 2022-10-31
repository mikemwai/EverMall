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
  mysqli_query($conn, "DELETE FROM `tbl_cart` WHERE id='$remove_id'");
  header('location: Cart.php');
};

if(isset($_GET['delete_all'])){
   mysqli_query($conn, "DELETE FROM `tbl_cart`");
   header('location:Cart.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>EverMall | Shopping Cart</title>	
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
	<?php include 'sidebar(Cart).php'; ?>
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
            <th>Product image</th>  
            <th>Product name</th>          
            <th>Product price</th>     
            <th>Quantity</th>
		 <th>Sub-Total</th>           
            <th>Action</th>
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
        <td><img src="../Admin/uploaded_image/<?php echo $fetch_cart['image'];?>"alt="" height="100"></td>
		    <td><?php echo $fetch_cart['name'];?></td>
		    <td>Ksh <?php echo number_format($fetch_cart['price']);?> /-</td>
        <td><form action="" method="post">
        <input type="hidden" name="update_quantity_id" value="<?php echo $fetch_cart['id'];?>">
        <input type="number" name="update_quantity" min="1" value="<?php echo $fetch_cart['quantity'];?>">
        <input type="submit" value="Update" name="update_btn" class="btn">
        </form>
        <td><?php echo $sub_total =number_format($fetch_cart['price'] * $fetch_cart['quantity']);?></td>
        <td><a href="Cart.php?remove=<?php echo $fetch_cart['id'];?>" class="btn" onclick="return confirm('Remove item from cart?')">REMOVE</a></td>
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
          
            <td><a href="../Shop/Shop.php" class="btn" >Continue<br>Shopping</a></td>
            <td colspan="3">Grand Total</td>
            <td>Ksh <?php echo $grand_total;?> /-</td>
              <td><a href="Cart.php?delete_all" class="btn" onclick="return confirm('Are you sure you want to delete all?')">DELETE ALL</a><br>
                  <a href="checkout.php" class="btn <?=($grand_total >1)?'': 'disabled';?>">Checkout</a></td>

          </tr>
        </tbody>   
      </table>
       
  </section>
</body>
</html>
 