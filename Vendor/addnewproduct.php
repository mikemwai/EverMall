<?php

include 'connection.php';

if(isset($_POST['submit'])){

   $cat = mysqli_real_escape_string($conn, $_POST['Category']);
   $name = mysqli_real_escape_string($conn, $_POST['name']);
   $desc = mysqli_real_escape_string($conn, $_POST['description']);
   $filename=$_FILES["image"]["name"];
   $tempname = $_FILES["image"]["tmp_name"];
    $folder = "./image/" . $filename;
   

   if (move_uploaded_file($tempname, $folder)) {
        echo "<h3>  Image uploaded successfully!</h3>";
    } else {
        echo "<h3>  Failed to upload image!</h3>";
    }   
   $price = mysqli_real_escape_string($conn, $_POST['price']);
   $stats = mysqli_real_escape_string($conn, $_POST['status']);

   $insert = "INSERT INTO `product_list`(`category_id`,`name`,`description`,`image_path`, `price`, `status`) VALUES('$cat', '$name', '$desc', '$filename','$price','$stats')";
  
if ($conn->query($insert) === TRUE) {
   echo 'Product added successfully';
  
  header('location: addnewproduct.php');
}else {
   echo 'Failed to add product';

  header('location: addnewproduct.php');
}}
$conn->close();

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

       <label for="Category" class="control-label">Category</label>
       <select name="Category" id="category" class="box" placeholder="Category" required>
            <?php 
                require("connection.php");
                $sql = "SELECT id, name FROM `category_list`";
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

      <input type="text" name="name" placeholder="Product name" class="box" required>

       <input type="text" name="description" placeholder="Description" class="box" required>     

      <input class="box" type= "file" name="image" id="image" required>

      <input type="text" name="price" placeholder="Price" class="box" required>

      <label for="status" class="control-label">Status</label>
      <select name="status" id="status" class="box" placeholder="Status" required>
               <option value="1" <?php echo isset($status) && $status == 1 ? 'selected' : '' ?>>Active</option>
               <option value="0" <?php echo isset($status) && $status == 0 ? 'selected' : '' ?>>Inactive</option>
        </select>

      <input type="submit" name="submit" value="Add to List" class="btn">
      <p><a href="productpage.php">BACK</a></p>
     
   </form>

</section>

</body>
</html>