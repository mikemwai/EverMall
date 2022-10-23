<?php
require("connections.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width , initial-scale=1.0">
    <title>EverMall | Admin page(Categories)</title>
    <link rel="stylesheet" href="Admin.css">
</head>
<body>
<div style="margin: 0 auto" class="container">
    <div class="admin-product-form-container">
     <form action="categoryaddition.php" method="post" enctype="multipart/form-data">
      <h3>Add new category</h3>
      <input type="text" placeholder="enter category name" name="category_name" class="box">
      <input type="submit" class="btn" name="add_category" value="Add Category">
      <a href="admin(Categories).php" class="btn">Go back!</a>
     </form>
    </div>
</div>---->
</body>
</html>
