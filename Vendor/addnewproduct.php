<?php

include 'connection.php';

if(isset($_POST['submit'])){

    session_start();

    $user_id=$_SESSION['user_id'];
    
     if(!isset($_SESSION['user_id'])){
        header('location:../Account/Account.php');
     }

   $cat = mysqli_real_escape_string($conn, $_POST['category_name']);
   $name = mysqli_real_escape_string($conn, $_POST['name']);
   $desc = mysqli_real_escape_string($conn, $_POST['description']);
   $subcategory_name=$_POST['subcategory_name'];
   $available_quantity=$_POST['available_quantity'];
   $product_keywords=$_POST['product_keywords'];
   $filename=$_FILES["product_image"]["name"];
   $tempname = $_FILES["product_image"]["tmp_name"];
   $folder = "../Admin/uploaded_image/" . $filename;
   

   if (move_uploaded_file($tempname, $folder)) {
        echo "<h3>  Image uploaded successfully!</h3>";
    } else {
        echo "<h3>  Failed to upload image!</h3>";
    }   
   $price = mysqli_real_escape_string($conn, $_POST['price']);
   $stats = mysqli_real_escape_string($conn, $_POST['status']);

   $insert = "INSERT INTO `tbl_product`(product_name, vendor_id, unit_price,product_image,product_description,available_quantity,subcategory_name,category_name,product_keywords) VALUES('$name', $user_id, '$price', '$filename', '$desc', '$available_quantity', '$subcategory_name', '$cat', '$product_keywords')";
  
if ($conn->query($insert) === TRUE) {
   echo 'Product added successfully';
  
  header('location: productpage.php');
}else {
   echo 'Failed to add product';

  header('location: addnewproduct.php');
}}
//$conn->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Add new Product</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="style.css">

</head>
<body>  
<section class="form-container">
   <form action="addnewproduct.php" method="post" href="dashing.css" enctype="multipart/form-data">
      <h3>Add New Product</h3>
       <?php
      if(isset($message)){
         foreach($message as $message){
            echo '<div class="message">'.$message.'</div>';
         }
      }
      ?>      
      <input type="text" name="name" placeholder="Product name" class="box" required>
      <select type="text" class="box" name="category_name">
         <option value="" disabled selected hidden>enter category name</option>
         <?php                 
            $sql = "SELECT * FROM `tbl_categories`";
            $all_categories = mysqli_query($conn,$sql);
            while ($category = mysqli_fetch_array(
            $all_categories,MYSQLI_ASSOC)):; 
         ?>
         <option value="<?php echo $category["category_id"];
            // The value we usually set is the primary key
         ?>" >
         <?php echo $category["category_name"];
            // To show the category name to the user
         ?>
         </option>
         <?php 
            endwhile;
         ?>
      </select><br>
      <select type="text" class="box" name="subcategory_name" >
            <option value="" disabled selected hidden>enter subcategory name</option>
            <?php                 
            $sql = "SELECT * FROM `tbl_subcategories`";
            $all_subcategories = mysqli_query($conn,$sql);
            while ($subcategory = mysqli_fetch_array(
            $all_subcategories,MYSQLI_ASSOC)):; 
         ?>
         <option value="<?php echo $subcategory["subcategory_id"];
            // The value we usually set is the primary key
         ?>" >
         <?php echo $subcategory["subcategory_name"];
            // To show the category name to the user
         ?>
         </option>
         <?php 
            endwhile;
         ?>
       </select><br>
      <input type="text" name="description" placeholder="Description" class="box" required>     
      <input class="box" type= "file" name="product_image" id="image" required>
      <input type="int" name="price" placeholder="Product Price" class="box" required>
      <input type="int" placeholder="enter available quantity" name="available_quantity" class="box">
       <input type="text" placeholder="enter product keywords" name="product_keywords" class="box">

      <!--<label for="status" class="control-label">Status</label>
      <select name="status" id="status" class="box" placeholder="Status" required>
               <option value="1" <?php //echo isset($status) && $status == 1 ? 'selected' : '' ?>>Active</option>
               <option value="0" <?php //echo isset($status) && $status == 0 ? 'selected' : '' ?>>Inactive</option>
        </select>--->
      <input type="submit" name="submit" value="Add to List" class="btn">
      <p><a href="productpage.php">Back!</a></p>
   </form>
</section>
</body>
</html>