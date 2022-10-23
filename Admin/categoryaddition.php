<?php
require("connections.php");


if (isset($_POST['add_category'])) {
$category_name=$_POST['category_name'];

$sql1="INSERT INTO tbl_categories(category_name) VALUES('$category_name')";

$query= mysqli_query($conn,$sql1);

if ($query){
        header('location:admin(Categories).php');
}}
else{
    //http_respose_code(400);
    echo"404 ERROR.Fill All Fields";
}
?>