 <?php
	
require("connection.php");

session_start();

$user_id=$_SESSION['user_id'];

if(!isset($_SESSION['first_name'])){
   header('location:../Account/Account.php');
}
if(!isset($_SESSION['last_name'])){
    header('location:../Account/Account.php');
 }
 if(!isset($_SESSION['user_id'])){
    header('location:../Account/Account.php');
 }

	if(isset($_GET['delete'])){
$delete=$_GET['delete'];

// sql to delete a record
$sql = "DELETE FROM tbl_product WHERE product_id=".$delete."";

if ($conn->query($sql) === TRUE) {
  $message[]= 'Product has been deleted!';
    } else {
        $message[]= 'Product cannot be deleted!';
    };
};
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>EVERMALL SELLER DASHBOARD</title>	
	<style>
     button {
        display: inline-block;
        background-color: burlywood;
        border-radius: 5px;
        border: 4px double #cccccc;
        color: teal;
        text-align: center;
        font-size: 15px;
        padding: 10px;
        width: 110px;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
        -o-transition: all 0.5s;
        transition: all 0.5s;
        cursor: pointer;
        margin: 5px;
      }

    </style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="dashing.css">
	<link rel="stylesheet" href="../Admin/Admin.css">
</head>

<body>
	 <?php include 'sidebar.php'; ?>
	<!--Sidebar ended-->

	<!--Page Content-->

	<section id="content">
    <!-- NAVBAR -->
   <?php include 'header.php'; ?>
<!--Main Body-->
			<!-- main Section -->
			<div>
				<button type="button" onclick="window.location.href='addnewproduct.php';">Add New</button>
	        </div>
			
<!---<h1>AVAILABLE PRODUCTS</h1>---->
		
		<table class="table" style= "width: 100%">
			<thead>
            <th>product id</th>
            <th>vendor id</th>
            <th>product image</th>
            <th>product name</th>
            <th>product description</th>
            <th>product price</th>
            <th>subcategory name</th>
            <th>category name</th>
            <th>available quantity</th>
            <th>product keywords</th>
            <th>action</th>
			</thead>
			<tbody>
				<?php
				require_once("productsView.php");
				 foreach($result as $key =>$value)
				{
					?>
					<tr>
					<td><?php echo $value['product_id']; ?></td>
                    <td><?php echo $value['vendor_id']; ?></td>
                    <td><img src="../Admin/uploaded_image/<?php echo $value['product_image']; ?>" height="100" alt=""></td><!------>
                    <td><?php echo $value['product_name']; ?></td>
                    <td><?php echo $value['product_description']; ?></td>
                    <td>Ksh<?php echo $value['unit_price']; ?>/-</td>
                    <td><?php echo $value['subcategory_name']; ?></td>
                    <td><?php echo $value['category_name']; ?></td>
                    <td><?php echo $value['available_quantity']; ?></td>
                    <td><?php echo $value['product_keywords']; ?></td>

						<td> 
						<a href="productpage.php?edit=<?php echo $value['product_id']; ?>"  onClick="edit(this);" title="Edit" class="btn"><!--<input type="image" src="Images/edit.png" title="Edit">--->edit</a>
                        <a href="productpage.php?delete=<?php echo $value['product_id']; ?>" onclick="return confirm('are your sure you want to delete this?');" title="Delete" class="btn"><!---input type="image" src="Images/trash.png" title="Trash">-->delete</a>
					    </td>
						
					</tr>
					<?php
					}    
            
				?>
			</tbody>
			
		</table>
	</div>
	
<section class="edit-form-container">
	<?php
   
   if(isset($_GET['edit']))
   {
   	require("connection.php");
      $edit_id = $_GET['edit'];
      $edit_query = mysqli_query($conn, "SELECT * FROM `tbl_product` WHERE product_id='$edit_id'");
      if(mysqli_num_rows($edit_query) > 0){
         while($fetch_edit = mysqli_fetch_assoc($edit_query)){
   ?>

	<form action="productupdate.php" method="post" enctype="multipart/form-data">
	<link rel="stylesheet" href="updateprod.css"> 
            <h3>UPDATE PRODUCT</h3>
			<input type="text" name="name" id="name" value="<?php echo $fetch_edit['product_name']; ?>" class="input-box" placeholder="Product Name" required>
			<textarea name="description" id="description" value="" class="input-box" placeholder="Product Description" required><?php echo $fetch_edit['product_description']; ?></textarea>
			<select type="text" class="input-box" name="subcategory_name">
            <option value="<?php //echo $row['subcategory_name']; ?>" disabled selected hidden>enter subcategory name</option>
            <option value="Formal">Formal</option>
            <option value="Casual">Casual</option>
            <option value="Sports">Sports</option>
            <option value="Dogs">Dogs</option>
            <option value="Cats">Cats</option>
            <option value="Others">Others</option>
       </select><br>
      <select type="text" class="input-box" name="category_name">
            <option value="<?php //echo $row['category_name']; ?>" disabled selected hidden>enter category name</option>
            <option value="Men">Men</option>
            <option value="Women">Women</option>
            <option value="Children">Children</option>
            <option value="Pets">Pets</option>
      </select><br>
            <!--<p>Product Image:</p>--->
            <input type= "file" name="image" class="input-box" required>
            <input type="text" name="price" id="price"  value="<?php echo $fetch_edit['unit_price']; ?>"class="input-box" placeholder="Product Price" required>
			<input type="int" placeholder="Available quantity" name="available_quantity" value="<?php echo $fetch_edit['available_quantity']; ?>" class="input-box">
            <input type="text" placeholder="Product keywords" name="product_keywords" value="<?php echo $fetch_edit['product_keywords']; ?>" class="input-box">
            <input type="submit" value="update the product" name="update" class="btn">
			<a href="productpage.php" class="btn">Go back!</a>
            <input type="hidden" name="product_id" value="<?php echo $fetch_edit['product_id'];?>">
			<!--<select name="Category" id="category" class="input-box" placeholder="Category" required>
			<?php                 
                /*$sql = "SELECT id, name FROM `category_list`";
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
                endwhile;*/ 
            ?>
            </select>---->
            <!--<label for="status" class="control-label">Status</label>
      <select name="status" id="status" class="input-box" placeholder="Status" value="<?php ///echo $fetch_edit['status']; ?>" required>
               <option value="1" <?php //echo isset($status) && $status == 1 ? 'selected' : '' ?>>Active</option>
               <option value="0" <?php //echo isset($status) && $status == 0 ? 'selected' : '' ?>>Inactive</option>
        </select>--->
            <!--<p><a href="productpage.php">CANCEL</a></p>--->  
</form>
<?php
            };
         };
         echo "<script>document.querySelector('.edit-form-container').style.display = 'flex';</script>";
      };
   ?>

</section>

</section>
</body>
</html>