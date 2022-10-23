<?php
 
require("connection.php");

session_start();
$user_id=$_SESSION['user_id'];
 if(!isset($_SESSION['user_id'])){
    header('location:../Account/Account.php');
 }

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

  $sql = "SELECT * FROM tbl_order WHERE user_id='$user_id'";

  $result= $conn->query($sql);

if (isset($_GET["shop now"])) {
 $id=$GET["shop now"];
 $sql= "SELECT * FROM tbl_order WHERE user_id='$user_id'";
}
$conn->close();
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Invoice</title>
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
	<link rel="stylesheet" href="dashing.css"></head>
<body>
	<?php include 'sidebar(Cart).php'; ?>

	<section id="content">
    <!-- NAVBAR -->
   
<div>
				<button type="button" onclick="window.location.href='cart.php';">BACK TO CART</button>
	        </div>
	<div class="invoice_container">
		
		<div class="customer_container">
			<div>
				<h2>BILLING TO : </h2>
				<h4>
<?php echo"  "; echo $_SESSION['first_name']; echo" "; echo $_SESSION['last_name']?>					
				</h4>
			</div>
			
		</div>
		<div class="product_container">
			<table class="item_table" border="1" cellspacing="0">
				<tr>
            <th>order id</th>
            <th>user id</th>
            <th>total_products</th>
            <th>order_amount</th>
            <th>order_status</th>
            <th>Date Ordered</th>
            <th>Payment Mode</th>
			</tr>
			<?php
				require_once("invoice.php");
				 foreach($result as $key =>$value)
				{
					?>
				<tr>
					<td><?php echo $value['order_id']; ?></td>
                    <td><?php echo $value['user_id']; ?></td>
                    <td><?php echo $value['total_products']; ?></td>
                    <td>Ksh<?php echo $value['order_amount']; ?>/-</td>
                    <td><?php echo $value['order_status']; ?></td>
                    <td><?php echo $value['created_at']; ?></td>
                    <td><?php echo $value['payment_type']; ?></td>
				</tr>
				<?php
					}    
            
				?>
			
			</table>
		</div>
		
	</div>
</body>
</html>        