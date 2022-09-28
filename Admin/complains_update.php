<?php
$conn = mysqli_connect("localhost","root","","ecommerce");//enter name of the database here
if($conn == false){
die("ERROR:Could not connect.".mysqli_connect_error());
}
   //cam change depanding on the database
$comp_id=$_REQUEST['complain_id'];
$user_id = $_REQUEST['user_id'];
$complain= $_REQUEST['complain'];
//$respo=$_REQUEST['responce'];
$respo = $_POST['responce'];

$sql="UPDATE tbl_complain SET responce='$respo' WHERE complain_id = '$comp_id'";
  if(mysqli_query($conn,$sql)){
    header('location:admin_page(Complains).php');   
  }
 else{
      echo "ERROR: Hush! Sorry $sql."
      .mysqli_error($conn);
  }

  mysqli_close($conn);


?>