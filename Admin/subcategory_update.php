<?php
$conn = mysqli_connect("localhost","root","","ecommerce");//enter name of the database here
if($conn == false){
die("ERROR:Could not connect.".mysqli_connect_error());
}
   //cam change depanding on the database
$subcategory_id=$_POST['subcategory_id'];
$subcategory_name= $_POST['subcategory_name'];
//$respo=$_REQUEST['responce'];
$sql="UPDATE tbl_subcategories SET subcategory_name='$subcategory_name' WHERE subcategory_id = '$subcategory_id'";
  if(mysqli_query($conn,$sql)){
    header('location:admin(SubCategories).php');   
  }
 else{
      echo "ERROR: Hush! Sorry $sql."
      .mysqli_error($conn);
  }
  //mysqli_close($conn);
?>