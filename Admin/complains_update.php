<?php
$conn = mysqli_connect("localhost","root","","ecommerce");//enter name of the database here
if($conn == false){
die("ERROR:Could not connect.".mysqli_connect_error());
}
   //cam change depanding on the database
$comp_id=$_POST['complain_id'];
$user_id = $_POST['user_id'];
$complain= $_POST['complain'];
//$respo=$_REQUEST['responce'];
$respo = $_POST['responce'];

$sql="UPDATE tbl_complain SET responce='$respo' WHERE complain_id = '$comp_id'";
  if(mysqli_query($conn,$sql)){
    header('location:admin(Complains).php');   
  }
 else{
      echo "ERROR: Hush! Sorry $sql."
      .mysqli_error($conn);
  }

  mysqli_close($conn);


?>