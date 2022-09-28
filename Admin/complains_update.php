<?php
$conn = mysqli_connect("localhost","root","","ecommerce");//enter name of the database here
if($conn == false){
die("ERROR:Could not connect.".mysqli_connect_error());
}
   //cam change depanding on the database
$comp_id=$_REQUEST['complain_id'];
$user_id = $_REQUEST['user_id'];
$complain= $_REQUEST['complain'];
$respo=$_REQUEST['responce'];

$sql="INSERT INTO tbl_complain VALUES('$comp_id','$user_id','$complain','$respo')";
  if(mysqli_query($conn,$sql)){
    echo "<h3>data stored successfully</h3>";
   
  }
 else{
      echo "ERROR: Hush! Sorry $sql."
      .mysqli_error($conn);
  }

  mysqli_close($conn);


?>