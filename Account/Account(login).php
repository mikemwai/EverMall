<?php
$conn= mysqli_connect("localhost","root","","ecommerce");
if ($conn==false){
    die("ERROR:Could not connect.".mysqli_connect_error());
}

session_start();

if (isset($_POST["Login"]))
{
      
    $email=$_POST['Email'];
    $pass=$_POST['password'];

    $sql="SELECT * FROM tbl_users WHERE email='".$email."'AND password='".$pass."' limit 1";
    
    $result=mysqli_query($conn,$sql);

    $row = mysqli_fetch_array($result);

    if(empty($email) || empty($pass))
    {
       $error[] = 'Please fill out all details!';
    }
    else
    {
    if($row['role'] == '1')
    {
        
       header('location:../Admin/admin_page(Products).php');

    }
    elseif($row['role'] == '3')
    {
       $_SESSION['first_name'] = $row['first_name'];
       $_SESSION['last_name'] = $row['last_name'];
       $_SESSION['user_id']=$row['user_id'];
       header('location:../Vendor/dashboard.php'); 

    }
    }
}
?>
