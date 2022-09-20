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
   <form action="" method="post" enctype="multipart/form-data"><!-----specifies how form data should be encoded----->
      <h3 class="title">update the product</h3>
      <input type="text" class="box" name="product_name" value="" placeholder="enter the product name">
      <input type="int" min="0" class="box" name="product_price" value="" placeholder="enter the product price">
      <input type="text" placeholder="enter product description" name="product_description" value="" class="box">
      <select type="text" class="box" name="subcategory_name">
            <option value="" disabled selected hidden>enter subcategory name</option>
            <option value="Formal">Formal</option>
            <option value="Casual">Casual</option>
            <option value="Sports">Sports</option>
            <option value="Dogs">Dogs</option>
            <option value="Cats">Cats</option>
            <option value="Others">Others</option>
       </select><br>
      <select type="text" class="box" name="category_name">
            <option value="" disabled selected hidden>enter category name</option>
            <option value="Men">Men</option>
            <option value="Women">Women</option>
            <option value="Children">Children</option>
            <option value="Pets">Pets</option>
      </select><br>
      <input type="int" placeholder="enter available quantity" name="available_quantity" value="" class="box">
      <input type="text" placeholder="enter product keywords" name="product_keywords" value="" class="box">
      <input type="file" class="box" name="product_image"  accept="image/png, image/jpeg, image/jpg, image/webp" value="">
      <input type="submit" value="update product" name="update_product" class="btn">
      <a href="admin_page(Products).php" class="btn">go back!</a>
   </form> 
</div>

</div>

</body>
</html>