<?php

require("connection.php");

if(isset($_POST['submit'])){

   $name = ($_POST['name']);
   $ownername = ($_POST['ownername']); 
   $contact = ($_POST['number']);  
   $type= ($_POST['shopname']);
   $username= ($_POST['username']);
   $pass = md5($_POST['password']);
   $cpass = md5($_POST['confpassword']);
   $filename=$_FILES["image"]["name"];
   $image_size = $_FILES['image']['size'];
   $tempname = $_FILES["image"]["tmp_name"];
   $folder = "./image/" . $filename;

$select = mysqli_query($conn, "SELECT * FROM `vendor_list` WHERE shop_name = '$name' AND password = '$pass'") or die('query failed');

if(mysqli_num_rows($select) > 0){
      $message[] = 'user already exist'; 
   }else{
      if($pass != $cpass){
         $message[] = 'confirm password not matched!';
      }elseif($image_size > 2000000){
         $message[] = 'image size is too large!';
      }else{
         $sql = mysqli_query($conn, "INSERT INTO `vendor_list`(shop_name,shop_owner,contact,shop_type_id,username,password,avatar) VALUES('$name', '$ownername','$contact','$type','$username', '$pass', '$filename')") or die('query failed');

 if (move_uploaded_file($tempname, $folder)) {
      $message[] = 'registered successfully!';
       header('location:vendorlogin.php');
    } else {
      $message[] = 'registration failed!';
       header('location:vendorregister.php');
    }
      }
   }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>REGISTER</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="style.css">

</head>
<body>
   <div class="form-container">
   <form action="vendorregister.php" method="post" enctype="multipart/form-data">
   <h3>Register now</h3>
   
         <?php
      if(isset($message)){
         foreach($message as $message){
            echo '<div class="message">'.$message.'</div>';
         }
      }
      ?>
            
            <input type="text" placeholder="Shop name" name="name" class="box" required>
         
            
            <input type="text" placeholder="Owner name" name="ownername" class="box" required>
         
            
            <input type="number" placeholder="Contact" name="number" class="box" required>
         
          <label for="shop_type_id" class="control-label">Shop Type</label>
         <select name="shopname" id="shopname" class="box" placeholder="Shop Type" required>
            <?php 
                require("connection.php");
                $sql = "SELECT * FROM `shop_type_list` where delete_flag = 0 and `status` =1 order by `name` asc" ;
                $all_categories = mysqli_query($conn,$sql);

                while ($category = mysqli_fetch_array(
                        $all_categories,MYSQLI_ASSOC)):; 
            ?>
                <option value="<?php echo $category["id"];
                    // The value we usually set is the primary key
                ?>">
                    <?php echo $category["name"];
                        // To show the category name to the user
                    ?>
                </option>
            <?php 
                endwhile; 
               
            ?>
        </select>

         
            <input type="text" placeholder="Username" name="username" class="box" required>
      

            <input type="password" placeholder="Password" name="password" class="box" required>
         
            <input type="password" placeholder="Confirm password" name="confpassword" class="box" required>
         

         <p><span>Shop logo</span></p>
         <input class="input-box" type= "file" name="image" id="image" required>
      
      <input type="submit" value="REGISTER" name="order_btn" class="btn">

   </form>
</div>
</body>
</html>
