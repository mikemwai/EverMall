<?php
require("connections.php");


if (isset($_POST['add_subcategory'])) {
$subcategory_name=$_POST['subcategory_name'];

$sql1="INSERT INTO tbl_subcategories(subcategory_name) VALUES('$subcategory_name')";

$query= mysqli_query($conn,$sql1);

if ($query){
        header('location:admin(SubCategories).php');
}}
else{
    //http_respose_code(400);
    echo"404 ERROR.Fill All Fields";
}
?>