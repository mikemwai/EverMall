<?php
require("connections.php");
$complain_id = $_GET['edit'];
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
   $select = mysqli_query($conn,"SELECT * FROM tbl_complain WHERE complain_id=$complain_id");
   while($row = mysqli_fetch_assoc($select)){    
?>

<div class="admin-product-form-container centered">   
   <form action="complains_update.php" method="post" enctype="multipart/form-data"><!-----specifies how form data should be encoded----->
      <h3 class="title">update the complain</h3>
      <input type="int" class="box" name="complain_id" value="<?php echo $row['complain_id'];?>" placeholder="enter complain id">
      <input type="int" class="box" name="user_id" value="<?php echo $row['user_id'];?>" placeholder="enter user id">
      <input type="double" class="box" name="complain" value="<?php echo $row['complain'];?>" placeholder="enter complain">
      <select type="text" class="box" name="responce" placeholder="enter response status">
            <option></option>
            <option value="Not Responded">Not Responded</option>
            <option value="Responded">Responded</option>
       </select><br>
      <!---<select type="text" class="box" name="payment_type" placeholder="enter payment type">
            <option></option>
            <option value="M-Pesa">M-Pesa</option>
            <option value="Bank Account">Bank Account</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
      </select><br>---->
      <input type="submit" value="Update complain" name="update_complain" class="btn">
      <a href="admin(Complains).php" class="btn">Go back!</a>
   </form>
   <?php
    };
   ?>
</div>

</div>

</body>
</html>