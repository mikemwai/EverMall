<?php
$conn = mysqli_connect("localhost","root","","ecommerce");//enter name of the database here
if($conn == false){
die("ERROR:Could not connect.".mysqli_connect_error());
}
   //cam change depanding on the database
$category_id=$_POST['category_id'];
$category_name= $_POST['category_name'];
//$respo=$_REQUEST['responce'];
$sql="UPDATE tbl_categories SET category_name='$category_name' WHERE category_id = '$category_id'";
  if(mysqli_query($conn,$sql)){
    header('location:admin(Categories).php');   
  }
 else{
      echo "ERROR: Hush! Sorry $sql."
      .mysqli_error($conn);
  }
  //mysqli_close($conn);
?>