<?php

require("connection.php");

$user_id = $_GET['edit'];

if(isset($_POST['update_user'])){

   $FName=$_POST['first_name'];
   $LName=$_POST['last_name'];
   $Email=$_POST['Email'];
   $Password=$_POST['password'];
   $Sex=$_POST['sex'];
   $role=$_POST['role'];

   if(empty($FName) || empty($LName) || empty($Email) || empty($Password)  || empty($Sex) || empty($role))
   {
      $message[] = 'please fill out all!';    
   }else{

      $update_data = "UPDATE tbl_users SET first_name='$FName', last_name='$LName', Email='$Email',password='$Password',gender='$Sex',role='$role'  WHERE user_id = '$user_id'";
      $upload = mysqli_query($conn, $update_data);

      if($upload){
         header('location:admin_page(Users).php');
      }else{
         $message[] = 'please fill out all!'; 
      }

   }
};

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="Admin.css">
</head>
<body>

<?php
   if(isset($message)){
      foreach($message as $message){
         echo '<span class="message">'.$message.'</span>';
      }
   }
?>

<div class="container">

<?php
      
      $select = mysqli_query($conn, "SELECT * FROM tbl_users WHERE user_id = '$user_id'");
      while($row = mysqli_fetch_assoc($select)){

?>

<div class="admin-product-form-container centered">
   <form action="" method="post" enctype="multipart/form-data">
      <h3 class="title">update the user</h3>
      <input type="text" id="fname" name="first_name" value="<?php echo $row['first_name']; ?>" placeholder="enter first name" class="box"><p>

      <input type="varchar" id="lname" name="last_name" value="<?php echo $row['last_name']; ?>" placeholder="enter last name" class="box"></p>

      <input type="email" id="Email" name="Email" value="<?php echo $row['email']; ?>" placeholder="enter email" class="box"><p>

      <input type="password" id="password" name="password" value="<?php echo $row['password']; ?>" placeholder="enter password" class="box"></p>

      <input type="varchar" id="sex" name="sex" value="<?php echo $row['gender']; ?>" placeholder="enter gender" class="box"></p>

      <input type="int" id="role" name="role" value="<?php echo $row['role']; ?>" placeholder="enter role id" class="box"></p>

      <input type="submit" class="btn" name="update_user" value="update user">
      <a href="admin_page(Users).php" class="btn">go back!</a>
   </form>
</div>

</div>

</body>
</html>