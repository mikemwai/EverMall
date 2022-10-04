 <?php

include_once("connection.php");
if(isset($_POST['update']))
{     
      $id = $_POST['id'];
      $category = $_POST['Category'];
      $prod_name = $_POST['name'];
      $prodDesc = $_POST['description'];
      
      $filename=$_FILES["image"]["name"];
  $tempname = $_FILES["image"]["tmp_name"];
    $folder = "./image/" . $filename;
  

  if (move_uploaded_file($tempname, $folder)) {
        echo "<h3>  Image uploaded successfully!</h3>";
    } else {
        echo "<h3>  Failed to upload image!</h3>";
    }
      $price = $_POST['price'];

       $stats = $_POST['status'];
      
      $updatetime = $_POST['update'];
    
     
$sql= "UPDATE product_list SET category_id='$category',name='$prod_name',description='$prodDesc',image_path='$filename' , price='$price',status='$stats', date_updated='$updatetime' WHERE id=$id";    
$result = $conn->query($sql);
}
if ($conn->query($sql) === TRUE) {
  echo "Record updated successfully";
  header('location: addnewproduct.php');

} else {
  echo "Error updating record: " . $conn->error;
  header('location: addnewproduct.php');
}
$conn->close();

?>