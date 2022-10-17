 <?php

include_once("connection.php");

//$edit_id = $_GET['edit'];

if(isset($_POST['update']))
{     
      $product_id = $_POST['product_id'];
      $category = $_POST['category_name'];
      $prod_name = $_POST['name'];
      $prodDesc = $_POST['description'];      
      $filename=$_FILES["image"]["name"];
      $tempname = $_FILES["image"]["tmp_name"];
      $folder = "../Admin/uploaded_image/" . $filename;
      $price = $_POST['price'];
      $available_quantity=$_POST['available_quantity'];
      $product_keywords=$_POST['product_keywords'];
      $subcategory_name=$_POST['subcategory_name'];
      /*$stats = $_POST['status'];
      $updatetime = $_POST['update'];*/

  if (move_uploaded_file($tempname, $folder)) {
        echo "<h3>  Image uploaded successfully!</h3>";
    } else {
        echo "<h3>  Failed to upload image!</h3>";
    }
     
$sql= "UPDATE tbl_product SET category_name='$category', product_name='$prod_name', product_description='$prodDesc', product_image='$filename', unit_price='$price',
available_quantity='$available_quantity', subcategory_name='$subcategory_name', product_keywords='$product_keywords' WHERE product_id='$product_id'";    
$result = $conn->query($sql);
}

if ($conn->query($sql) === TRUE) {
  echo "Record updated successfully";
  header('location: productpage.php');

} else {
  echo "Error updating record: " . $conn->error;
  header('location: addnewproduct.php');
}
//$conn->close();

?>