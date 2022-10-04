<?php
 
require("connection.php");

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

  $sql = "SELECT id, name, description, price,image_path, status FROM product_list";

  $result= $conn->query($sql);

if (isset($_GET["shop now"])) {
 $id=$GET["shop now"];
 $sql= "SELECT id,name,description,image_path,price,status FROM product_list WHERE id=$id";
}



$conn->close();
?>