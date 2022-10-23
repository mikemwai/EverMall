<?php
require("connections.php");
$subcategory_id = $_GET['edit'];
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
<?php
   $select = mysqli_query($conn,"SELECT * FROM tbl_subcategories WHERE subcategory_id='$subcategory_id'");
   while($row = mysqli_fetch_assoc($select)){    
?>

<div class="admin-product-form-container centered">   
   <form action="subcategory_update.php" method="post" enctype="multipart/form-data"><!-----specifies how form data should be encoded----->
      <h3 class="title">update the subcategory</h3>
      <input type="int" class="box" name="subcategory_id" value="<?php echo $row['subcategory_id'];?>" placeholder="enter subcategory id">
      <input type="double" class="box" name="subcategory_name" value="<?php echo $row['subcategory_name'];?>" placeholder="enter subcategory name">
      <!---<select type="text" class="box" name="payment_type" placeholder="enter payment type">
            <option></option>
            <option value="M-Pesa">M-Pesa</option>
            <option value="Bank Account">Bank Account</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
      </select><br>---->
      <input type="submit" value="Update subcategory" name="update_subcategory" class="btn">
      <a href="admin(SubCategories).php" class="btn">Go back!</a>
   </form>
   <?php
    };
   ?>
</div>

</div>

</body>
</html>