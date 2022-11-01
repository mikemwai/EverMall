<?php
include 'connection.php';
include('express-stk.php');

$sql="SELECT * FROM tbl_cart ";
$all_product = $conn->query($sql);

if(isset($_POST['order_btn']))
{
    

   $user_id=$_SESSION['user_id'];
   $vendor_id=$_POST['vendor_id'];
   $method = $_POST['paymentmethod'];
   $phone = $_POST['phone'];
   $address= $_POST['address'];

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
   $detail_query=mysqli_query($conn,"INSERT INTO `tbl_order`( `user_id`,`vendor_id`,`phone`,`address`, `total_products`, `order_amount`, `order_status`,`payment_type`) VALUES ('$user_id','$vendor_id','$phone','$address', '$total_product','$price_total','Paid','$method')") or die('query failed');
   if($cart_query && $detail_query){

      
      header('Location: ../M-pesa/checkout.php');
      
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
   <form action='<?php echo $_SERVER['PHP_SELF'] ?>' method="post">

      <div class="inputBox"> 
         <?php
   while($row=mysqli_fetch_assoc($all_product)){
?>
      <input type="hidden" name="vendor_id" value="<?php echo $row['vendor_id']; ?>">

<?php
};
?>       
      </div>
    
   <div class="display-order">
      <?php
         $select_cart = mysqli_query($conn, "SELECT * FROM `tbl_cart`");
         $total = 0;
         $grand_total = 0;
         if(mysqli_num_rows($select_cart) > 0){
            while($fetch_cart = mysqli_fetch_assoc($select_cart)){
            $total_price = number_format($fetch_cart['price'] * $fetch_cart['quantity']);

           $grand_total=($grand_total+($fetch_cart['quantity'] * (int)$fetch_cart['price'])) ;
        
         
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
      <span>Contact Name<span>
      <input type="text" name="customer" class="form-control" placeholder="Enter your name" required>
      </div>
     
      <div class="inputBox">
      <span>Payment Number<span>
      <input type="text" name="phone" class="form-control" placeholder="Enter your Mpesa number" required>
      </div>
      <div class="inputBox" readonly>
         <span>Payment method</span>
         <select name="paymentmethod">
         <option value="M-Pesa" selected>M-Pesa</option>
         <option value="BankAccount">Bank Account</option>
         <option value="CashOnDelivery">Cash On Delivery</option>
         </select>
      </div>
      <div class="inputBox">
      <span>Physical Address<span>
      <input type="text" name="address" class="form-control" placeholder="Enter your address">
      </div>
       
   </div>
   <a href="express-stk.php" > <input  type="submit" value="Order now" name="order_btn" class="btn1"></a>
   <p><a class="btn1" href="cart.php">Go Back!</a></p>
   </form>
</section>
</div> 
</body>
</html>