<?php
$conn= mysqli_connect("localhost","root","","ecommerce");
if ($conn==false){
    die("ERROR:Could not connect.".mysqli_connect_error());
}

if (isset($_POST["Email"])){
    $email=$_POST['Email'];
    $pass=$_POST['password'];

    $sql="SELECT * FROM tbl_users WHERE email='".$email."'AND password='".$pass."' limit 1";
    
    $result=mysqli_query($conn,$sql);

    if(mysqli_num_rows($result)==1){
        //echo "<h3>You have succesfully logged in</h3>";
        header('location:../Index.php'); 
        // this part can be replaced to redirect to the homepage
        exit();
    }else{
        echo "<h3>You have entered incorrect password or email</h3>";
    }
}
?>
