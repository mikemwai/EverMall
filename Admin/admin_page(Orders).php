<?php
require("connections.php");

if(isset($_POST['send_order']))
{
    $product_id=$_POST['product_id'];
    $product_name = $_POST['product_name'];
    $vendor_id=$_POST['vendor_id'];
    $product_quantity =$_POST['needed_quantity'];

    $insert_product = mysqli_query($conn, "INSERT INTO tbl_orders(product_name,vendor_id,product_id,needed_quantity) 
    VALUES('$product_name','$vendor_id','$product_id','$product_quantity')");
    $message[] = 'Order sent succesfully!';
};
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width , initial-scale=1.0">
    <title>EverMall | Admin page(Orders)</title>
    <link rel="stylesheet" href="Admin.css">
</head>
<body>
<div style="margin: 0 auto" class="container">
<?php

if(isset($message)){
   foreach($message as $message){
      echo '<div class="message"><span>'.$message.'</span> </div>';
   };
};

?>
    <div class="admin-product-form-container">
     <form action="" method="post" enctype="multipart/form-data">
      <h3>Send Order</h3>
      <input type="text" placeholder="enter vendor id" name="vendor_id" class="box">
      <input type="text" placeholder="enter product id" name="product_id" class="box">
      <input type="text" placeholder="enter product name" name="product_name" class="box">
      <input type="text" placeholder="enter needed quantity" name="needed_quantity" class="box">
      <input type="submit" class="btn" name="send_order" value="Send Order">
      <a href="admin(Orders).php" class="btn">Go back!</a>
     </form>
    </div>
</div>
</body>
</html>
