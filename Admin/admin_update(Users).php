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


<div class="admin-product-form-container centered">
   <form action="" method="post" enctype="multipart/form-data">
      <h3 class="title">update the user</h3>
      <input type="text" id="fname" name="first_name" value="" placeholder="enter first name" class="box"><p>

      <input type="varchar" id="lname" name="last_name" value="" placeholder="enter last name" class="box"></p>

      <input type="email" id="Email" name="Email" value="" placeholder="enter email" class="box"><p>

      <input type="password" id="password" name="password" value="" placeholder="enter password" class="box"></p>

      <input type="varchar" id="sex" name="sex" value="" placeholder="enter gender" class="box"></p>

      <input type="int" id="role" name="role" value="" placeholder="enter role id" class="box"></p>

      <input type="submit" class="btn" name="update_user" value="update user">
      <a href="admin_page(Users).php" class="btn">go back!</a>
   </form>
</div>

</div>

</body>
</html>