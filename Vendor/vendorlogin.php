<?php

include 'connection.php';
session_start();

if(isset($_POST['submit'])){

   $shopname = mysqli_real_escape_string($conn, $_POST['shopname']);
   $pass = mysqli_real_escape_string($conn, md5($_POST['password']));

   $select = mysqli_query($conn, "SELECT * FROM `vendor_list` WHERE shop_name = '$shopname' AND password = '$pass'") or die('query failed');

   if(mysqli_num_rows($select) > 0){
      $row = mysqli_fetch_assoc($select);
      $_SESSION['user_id'] = $row['id'];
      header('location:dashboard.php');
   }else{
      $message[] = 'incorrect shopname or password!';
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>login</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="style.css">

</head>
<body>
   
<div class="form-container">

   <form action="" method="post" enctype="multipart/form-data">
      <h3>Vendor Login</h3>
      <h4>Log in to start your session</h4>
      <?php
      if(isset($message)){
         foreach($message as $message){
            echo '<div class="message">'.$message.'</div>';
         }
      }
      ?>
      <input type="text" name="shopname" placeholder="enter shopname" class="box" required>
      <input type="password" name="password" placeholder="enter password" class="box" required>
      <input type="submit" name="submit" value="LOG IN" class="btn">
      <p>don't have an account? <a href="vendorregister.php">register now</a></p>
      <a href="" class="btn">BACK</a>
      
      
   </form>

</div>

</body>
</html>