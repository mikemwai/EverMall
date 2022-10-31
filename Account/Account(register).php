<?php
$con = mysqli_connect("localhost","root","","ecommerce");
if($con == false){
    die("ERROR:Could not connect.".mysqli_connect_error());
}

if(isset($POST["Register"]))
{
 $fname=$_REQUEST['first_name'];
 $lname=$_REQUEST['last_name'];
 $email=$_REQUEST['email'];
 $pwd=$_REQUEST['password'];
 $sex=$_REQUEST['gender'];

 $sql="INSERT INTO tbl_users(first_name,last_name,email,password,gender) VALUES('$fname','$lname','$email','$pwd','$sex')";
 $select=" SELECT * from tbl_users WHERE email='$email' && password='$pwd' ";

$result=mysqli_query($con,$select);

if(mysqli_num_rows($result)>0)
{
    if(empty($fname) || empty($lname) || empty($email) || empty($pwd) || empty($sex))
    {
    $message[] = 'Please fill out all details!';
    }
    else
    {
    $message[]='User already exists!';
    }
}
else
{
    if(mysqli_query($conn,$sql))
   {
    //header('location:Account.php');
    $message[]='You can now login';
   }
  else
   {
    $message[]='Please fill out all details';
   }
}
};

/* if (mysqli_query($con,$sql))
 {
    //echo "<h3> You have successfily registered</h3>";
    $message[]='You can now login';
    //header('location:Account.php'); 
 }
 else{
    //echo "ERROR: Hush! Sorry $sql."
    //.mysqli_error($conn);
    $message[]='Please fill out all details';
 }
 //mysqli_close($con);*/
?>