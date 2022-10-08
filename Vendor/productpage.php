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
$sql = "DELETE FROM product_list WHERE id=".$delete."";

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
	<meta name="viewport" content="with=device-width, initial-scle=1.0">
	<meta charset="utf-8">
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
	<section id="sidebar">
		<a href=" class="brand">
			<a href="../Index/Index.php">
			<img src="../Evermall(Black).png" width="200px">
			</a>
       </a>

		<ul class="side-menu top">
			<li class="active">
			<a href="dashboard.php">
			<i class="fa fa-bars"></i>
		    <span class="text">Dashboard</span>
		    </a></li>


			<li>
			<a href="productpage.php">
		    <i class="fa fa-tag"></i>
		    <span class="text"> Products</span>
		    </a></li>

			<li>
			<a href="orders.php">
			<i class="fa fa-bell"></i>
			<span class="text">Orders</span>
		    </a></li>

		    <li>
			<a href="Cart.php">
			<i class="fa fa-shopping-basket"></i>
			<span class="text">Cart</span>
		    </a></li>

		    <!--<li>
			<a href="">
			<i class="fa fa-thumbs-up"></i>
			<span class="text">Review &amp; Ratings</span>
		    </a></li>

		    <li>
			<a href="">
			<i class="fa fa-gears"></i>
			<span class="text">Settings</span>
		    </a></li>

		    <li>
			<a href="">
			<i class="fa fa-user"></i>
			<span class="text">Customer Dashboard</span>
		    </a></li>---->

		    <li>
		<a href="../Account/Logout.php" class="logout">
          <i class="fa fa-user"></i>
          <span class="text">Logout</span>
        </a>
      </li>

		</ul>
	</section>
	<!--Sidebar ended-->

	<!--Page Content-->

	<section id="content">
    <!-- NAVBAR -->
    <nav>
     
      <i class="fa fa-bars"></i>
      <a href="#" target="_blank" class="nav-link">View Your Store</a>

      <form action="#">
        <div class="form-input">
          <input type="search" placeholder="Search...">
          <button type="submit" class="search-btn">
            <i class='fa fa-arrow-right' ></i></button>
        </div>
      </form>	

<?php

$select = mysqli_query($conn, "SELECT * FROM tbl_users");

?>

			<ul>
			<li class="profile">
			<a href="javascript:void(0)" class="nav-link"><i class="fa fa-user"> </i><?php echo"  "; echo $_SESSION['first_name']; echo" "; echo $_SESSION['last_name']?></a>
    <!--<div class="dropdown-content">
      <a href="#">Account</a><br>
      <a href="../Account/Logout.php">Logout</a>
  </div>--->
</li>
</ul>

</nav>	
<!--Main Body-->
			<!-- main Section -->
			<div>
				<button type="button" onclick="window.location.href='addnewproduct.php';">Add New</button>
	        </div>
			
<!---<h1>AVAILABLE PRODUCTS</h1>---->
		
		<table class="table" style= "width: 100%">
			<thead>
				<th>Product id</th>
				<th>Name</th>
				<th>Description</th>
				<th>Image</th>
				<th>Price</th>
				<th>Status</th>
				<th>Action</th>
			</thead>
			<tbody>
				<?php
				require_once("productsView.php");
				 foreach($result as $key =>$value)
				{
					?>
					<tr>
						<td><?php echo $value["id"] ?></td>
						<td><?php echo $value["name"] ?></td>
						<td><?php echo $value["description"] ?></td>
						<td>
						<img src="./image/<?php echo $value['image_path']; ?>" height="100">
					    </td>
						<td>Ksh <?php echo $value["price"] ?>/-</td>

						<td><?php echo $value["status"] ?></td>

						<td> 
						<a href="productpage.php?edit=<?php echo $value['id']; ?>"  onClick="edit(this);" title="Edit" class="btn"><!--<input type="image" src="Images/edit.png" title="Edit">--->edit</a>
                        <a href="productpage.php?delete=<?php echo $value['id']; ?>" onclick="return confirm('are your sure you want to delete this?');" title="Delete" class="btn"><!---input type="image" src="Images/trash.png" title="Trash">-->delete</a>
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
   
   if(isset($_GET['edit'])){
   	require("connection.php");
      $edit_id = $_GET['edit'];
      $edit_query = mysqli_query($conn, "SELECT * FROM `product_list` WHERE id = $edit_id");
      if(mysqli_num_rows($edit_query) > 0){
         while($fetch_edit = mysqli_fetch_assoc($edit_query)){
   ?>

	<form action="productupdate.php" method="post" enctype="multipart/form-data">
		<link rel="stylesheet" href="updateprod.css">

            <h3>UPDATE PRODUCT</h3>

            <select name="Category" id="category" class="input-box" placeholder="Category" required>
            <?php 
                
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

            <input type="text" name="name" id="name" value="<?php echo $fetch_edit['name']; ?>" class="input-box" placeholder="Product Name" required>

            <textarea name="description" id="description" rows="4" cols="60" value="<?php echo $fetch_edit['description']; ?>" class="input-box" placeholder="Description" required></textarea>

            <p>Product Image:</p>
            <input type= "file" name="image" class="input-box" required>

            <input type="text" name="price" id="price"  value="<?php echo $fetch_edit['price']; ?>"class="input-box" placeholder="Unit_Price" required>

            <label for="status" class="control-label">Status</label>
      <select name="status" id="status" class="input-box" placeholder="Status" value="<?php echo $fetch_edit['status']; ?>" required>
               <option value="1" <?php echo isset($status) && $status == 1 ? 'selected' : '' ?>>Active</option>
               <option value="0" <?php echo isset($status) && $status == 0 ? 'selected' : '' ?>>Inactive</option>
        </select>

            
            <input type="date" name="updatetime" id="updatetime"  class="input-box" required>
      
            <input type="submit" value="update the product" name="update" class="btn">
			<a href="productpage.php" class="btn">Go back!</a>
      
            <input type="hidden" name="id" value=<?php echo $edit_id;?>>

            <p><a href="productpage.php">CANCEL</a></p>
     



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