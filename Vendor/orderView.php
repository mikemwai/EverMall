<?php
 
require("connection.php");

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

  $sql= "SELECT id,product_id,product_name,needed_quantity FROM tbl_orders WHERE vendor_id=$user_id";

  $result= $conn->query($sql);

if (isset($_GET["shop now"])) {
 $id=$GET["shop now"];

 

}



$conn->close();
?>