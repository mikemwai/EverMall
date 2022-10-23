<?php

require("connections.php");

$prod_id=$_GET['edit'];


if (isset($_POST['update_product'])) {
    




$p_name=$_POST['product_name'];


$p_des=$_POST['product_description'];


$p_price=$_POST['product_price'];


$p_quan=$_POST['available_quantity'];


$sub_n =$_POST['subcategory_name'];


$cat_n=$_POST['category_name'];


$key=$_POST['product_keywords'];
 
$p_image= $_FILES['product_image']['name'];
$p_image_tmp_name = $_FILES['product_image']['tmp_name'];
$file_type = 'uploaded_image/' .$p_image;
	//print($file_type);




$sql="UPDATE tbl_product SET product_name= '$p_name' ,product_description= '$p_des' ,product_image = '$p_image' ,available_quantity ='$p_quan' , subcategory_name = '$sub_n',category_name = '$cat_n',product_keywords= '$key' WHERE product_id= $prod_id";


$query= mysqli_query($conn,$sql);


if ($query){

   $sql2="INSERT INTO tbl_productimages(product_image)
   VALUES('$p_image')";
    $upload= mysqli_query($conn,$sql2);
   if($upload){
       move_uploaded_file($p_image_tmp_name,$file_type);
       header('location:admin(Products).php');
   }
   else{ 
       echo"could not add the product";
   }
}
}
else{
    //http_respose_code(400);
    //echo"404 ERROR.Fill All Fields";
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
<div class="admin-product-form-container centered">
               <?php
                $select = mysqli_query($conn,"SELECT * FROM tbl_product WHERE product_id=$prod_id");
                while($row = mysqli_fetch_assoc($select)){                  
                ?>
   <form action="<?php $_SERVER['PHP_SELF']?>" method="post" enctype="multipart/form-data"><!-----specifies how form data should be encoded----->
      <h3 class="title">update the product</h3>
      <input type="text" class="box" name="product_name" value="<?php echo $row['product_name'];?>" placeholder="enter the product name">
      <input type="int" min="0" class="box" name="product_price" value="<?php echo $row['unit_price'];?>" placeholder="enter the product price">
      <input type="text" placeholder="enter product description" name="product_description" value="<?php echo $row['product_description'];?>" class="box">
      <select type="text" class="box" name="subcategory_name">
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
      <select type="text" class="box" name="category_name">
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
      <input type="int" placeholder="enter available quantity" name="available_quantity" value="<?php echo $row['available_quantity'];?>" class="box">
      <input type="text" placeholder="enter product keywords" name="product_keywords" value="<?php echo $row['product_keywords'];?>" class="box">
      <input type="file" class="box" name="product_image"  accept="image/png, image/jpeg, image/jpg, image/webp" value="<?php echo $row['product_image'];?>">
      <input type="submit" value="Update product" name="pdate_product" class="btn">
      <a href="admin(Products).php" class="btn">Go back!</a>
   </form> 
 <?php
 };?>
</div>

</div>

</body>
</html>