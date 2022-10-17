<?php
 
require("connection.php");

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

  $sql = "SELECT * FROM tbl_product";

  $result= $conn->query($sql);

if (isset($_GET["shop now"])) {
 $id=$GET["shop now"];
 $sql= "SELECT * FROM tbl_product";
}



$conn->close();
?>