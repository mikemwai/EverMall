<?php
require("connections.php");


if (isset($_POST['add_product'])) {
    
session_start();

$user_id=$_SESSION['user_id'];
$p_name=$_POST['product_name'];
$p_des=$_POST['product_description'];
$p_price=$_POST['product_price'];
$p_quan=$_POST['available_quantity'];
$sub_n =$_POST['subcategory_name'];
$cat_n=$_POST['category_name'];
$key=$_POST['product_keywords']; 
$p_image= $_FILES['product_image']['name'];
$p_image_tmp_name = $_FILES['product_image']['tmp_name'];
$file_type = 'uploaded_image/' .$p_image;
	//print($file_type);

$sql1="INSERT INTO tbl_product(product_name,vendor_id,product_description,product_image,unit_price,available_quantity,subcategory_name,category_name,product_keywords)
VALUES('$p_name',$user_id,'$p_des','$p_image','$p_price','$p_quan','$sub_n', '$cat_n', '$key')";

$query= mysqli_query($conn,$sql1);

if ($query){

    $sql2="INSERT INTO tbl_productimages(product_image)
    VALUES('$p_image')";
    $upload= mysqli_query($conn,$sql2);
    if($upload){
        move_uploaded_file($p_image_tmp_name,$file_type);
        //echo"New product successfully added";
        header('location:admin(Products).php');
    }
    else{ 
        echo"could not add the product";
    } 
}}
else{
    //http_respose_code(400);
    echo"404 ERROR.Fill All Fields";
}
?>