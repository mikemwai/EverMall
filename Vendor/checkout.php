<?php
include 'connection.php';

if(isset($_POST['order_btn']))
{
    session_start();

   $user_id=$_SESSION['user_id'];
   $method = $_POST['paymentmethod'];

   $cart_query = mysqli_query($conn, "SELECT * FROM `tbl_cart` WHERE user_id='$user_id'");
   $price_total = 0;
   if(mysqli_num_rows($cart_query) > 0){
      while($product_item = mysqli_fetch_assoc($cart_query)){
         $product_name[] = $product_item['name'] .' ('. $product_item['quantity'] .') ';
         $product_price = number_format($product_item['price'] * $product_item['quantity']);
         if (is_numeric($product_item['quantity']) && is_numeric($product_item['price'])) {
         $price_total += ((int)$product_item['quantity'] * (int)$product_item['price']);
         }
        
   };
   }else
   {
      $price_total = 0;
   }
   ;
   $total_product = implode(', ',$product_name);
   $detail_query=mysqli_query($conn,"INSERT INTO `tbl_order`( `user_id`, `total_products`, `order_amount`, `order_status`,`payment_type`) VALUES ('$user_id', '$total_product','$price_total','Pending','$method')") or die('query failed');
   if($cart_query && $detail_query){
      echo "
      <div class='order-message-container'>
      <div class='message-container'>
         <h3>thank you for shopping!</h3>
         <div class='order-detail'>
            <span>".$total_product."</span>
            <span class='total'> total : Ksh ".$price_total." /-  </span>
         </div>
         <div class='customer-details'>
            <p> your payment mode : <span>".$method."</span> </p>
            <p>(*pay when product arrives*)</p>
         </div>
            <a href='../Shop/Shop.php' class='btn1'>continue shopping</a>
         </div>
      </div>
      ";
   }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>checkout</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="checkout.css">
   <link rel="stylesheet" href="dashing.css">
</head>

<body>
<?php include 'sidebar(Cart).php'; ?>
<!--Sidebar ended-->
<!--Page Content-->
<section id="content">
<!-- NAVBAR -->
<div class="container">
<section class="checkout-form">

   <h1 class="heading">Complete your order</h1>
   <form action="" method="post">
   <div class="display-order">
      <?php
         $select_cart = mysqli_query($conn, "SELECT * FROM `tbl_cart`");
         $total = 0;
         $grand_total = 0;
         if(mysqli_num_rows($select_cart) > 0){
            while($fetch_cart = mysqli_fetch_assoc($select_cart)){
            $total_price = number_format($fetch_cart['price'] * $fetch_cart['quantity']);
            if (is_numeric($fetch_cart['quantity']) && is_numeric($fetch_cart['price'])) {
         $grand_total += ((int)$fetch_cart['quantity'] * (int)$fetch_cart['price']);
         }   
      ?>
      <span><?= $fetch_cart['name']; ?>(<?= $fetch_cart['quantity']; ?>)</span>
      <?php
         }
      }else{
         echo "<div class='display-order'><span>your cart is empty!</span></div>";
      }
      ?>
      <span class="grand-total"> grand total : Ksh <?= $grand_total; ?> /- </span>
   </div>

   <div class="flex">
      <div class="inputBox">
         <span>Payment method</span>
         <select name="paymentmethod">
         <option value="M-Pesa" selected>M-Pesa</option>
         <option value="BankAccount">Bank Account</option>
         <option value="CashOnDelivery">Cash On Delivery</option>
         </select>
      </div>
        
   </div>
   <input type="submit" value="Order now" name="order_btn" class="btn1">
   <p><a class="btn1" href="cart.php">Go Back!</a></p>
   </form>
</section>
</div> 
</body>
</html>