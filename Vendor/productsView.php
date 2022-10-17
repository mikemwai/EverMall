<?php
 
require("connection.php");

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

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

  $sql = "SELECT * FROM tbl_product WHERE vendor_id='$user_id'";

  $result= $conn->query($sql);

if (isset($_GET["shop now"])) {
 $id=$GET["shop now"];
 $sql= "SELECT * FROM tbl_product WHERE vendor_id='$user_id'";
}



$conn->close();
?>