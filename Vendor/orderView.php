<?php
 
require("connection.php");

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

  $sql = "SELECT id, code, vendor_id, total_amount,status, date_created FROM order_list";

  $result= $conn->query($sql);

if (isset($_GET["shop now"])) {
 $id=$GET["shop now"];
 $sql= "SELECT id, code, vendor_id, total_amount,status, date_created  WHERE id=$id";
}



$conn->close();
?>