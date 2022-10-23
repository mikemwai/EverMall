<?php
$servername="localhost";
$username="root";
$password="";
$database="ecommerce";

$conn = mysqli_connect($servername, $username, $password,$database);

$float =  mysqli_query($conn,"SELECT * FROM tbl_subcategories");
$result =  mysqli_query($conn,"SELECT * FROM tbl_categories");
$sql =  mysqli_query($conn,"SELECT * FROM tbl_product");


if(!$conn){
    die("Connection failed:".mysqli_connect_error());

}
    echo" ";
?>