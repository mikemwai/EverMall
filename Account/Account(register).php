<?php
$con = mysqli_connect("localhost","root","","ecommerce");
if($con == false){
    die("ERROR:Could not connect.".mysqli_connect_error());
}
 $fname=$_REQUEST['first_name'];
 $lname=$_REQUEST['last_name'];
 $email=$_REQUEST['email'];
 $pwd=$_REQUEST['password'];
 $sex=$_REQUEST['gender'];

 $sql="INSERT INTO tbl_users(first_name,last_name,email,password,gender) VALUES('$fname','$lname','$email','$pwd','$sex')";
 if (mysqli_query($con,$sql)){
    //echo "<h3> You have successfily registered</h3>";
    header('location:Account.php'); 

 }
 else{
    echo "ERROR: Hush! Sorry $sql."
    .mysqli_error($conn);
 }
 mysqli_close($con);
?>