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
)
    
/*
    if ($conn->query($sql) === TRUE) {
   $message[] = 'vendor added succesfully';
  
  header('location: vendorlogin.php');
}else {
   $message[] = 'could not add the vendor';
  
  header('location: addnewproduct.php');
}
$conn->close();


   $select = mysqli_query($conn, "SELECT * FROM `vendor_list` WHERE shop_name = '$name' AND password = '$pass'") or die('query failed');

   if(mysqli_num_rows($select) > 0){
      $message[] = 'user already exist'; 
   }else{
      if($pass != $cpass){
         $message[] = 'confirm password not matched!';
      }elseif($image_size > 2000000){
         $message[] = 'image size is too large!';
      }else{
         $insert = mysqli_query($conn, "INSERT INTO `vendor_list`(shop_name,shop_owner,contact,shop_type_id,username,password,avatar) VALUES('$name', '$ownername','$contact','$type','$username', '$pass', '$filename')") or die('query failed');

         if($insert){
            move_uploaded_file($image_tmp_name, $image_folder);
            $message[] = 'registered successfully!';
            header('location:vendorlogin.php');
         }else{
            $message[] = 'registration failed!';
         }
      }
   }

*/

?>