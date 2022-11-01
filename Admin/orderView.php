<?php
 
require("connection.php");

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

  $sql= "SELECT order_id,vendor_id,total_products,order_amount,order_status,payment_type,created_at FROM tbl_order";

  $result= $conn->query($sql);

if (isset($_GET["shop now"])) {
 $id=$GET["shop now"];

 

}



$conn->close();
?>