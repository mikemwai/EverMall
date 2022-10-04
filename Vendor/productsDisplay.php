<?php
 
require("connection.php");

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

  $sql = "SELECT id, name, description, image_path, price FROM product_list";

  $result= $conn->query($sql);

if (isset($_GET["shop now"])) {
 $id=$GET["shop now"];
 $sql= "SELECT id, name, description, image_path, price FROM product_listWHERE vendor_id=$id";
}



$conn->close();
?>