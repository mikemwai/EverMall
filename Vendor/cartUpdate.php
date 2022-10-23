<?php
require("connection.php");

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

//add itemin shopping cart
if (isset($_GET["shop now"])) {

$productName=$_POST['productName'];
	$productPrice=$_POST['productprice'];
	$filename=$_POST["productimg"];
	$quantity=1;

	//Mysqli query to get details of the item from db using product id
	$results = $mysqli->query("SELECT product_name,unit_price FROM tbl_product WHERE product_id ='$id' LIMIT 1");
	$obj = $results->fetch_object();

	if($results{//we have the product information
	//prepare array for the session variable

	$new_product = array(array('name'=>$obj->product_name, 'code'=>$product_id ,'image'=>$obj->image, 'Quantity'=>$quantity, 'Price'=>$obj->price));

	if(isset($_SESSION["cart_session"])) //if we have the session
		{
			$found = false; //set found item to false
			
			foreach ($_SESSION["cart_session"] as $cart_itm) //loop through session array
			{
				if($cart_itm["code"] == $Product_id){ //the item exist in array

					$product[] = array('name'=>$cart_itm["name"], 'code'=>$cart_itm["code"], 'Quantity'=>$quantity, 'Price'=>$cart_itm["price"]);
					$found = true;
				}else{
					//item doesn't exist in the list, just retrive old info and prepare array for session var
					$product[] = array('name'=>$cart_itm["name"], 'code'=>$cart_itm["code"], 'Price'=>$cart_itm["Price"], 'Quantity'=>$cart_itm["Quantity"]);
				}
			}
			if($found == false) //we didn't find item in array
			{
				//add new user item in array
				$_SESSION["cart_session"] = array_merge($product, $new_product);
			}else{
				//found user item in array list, and increased the quantity
				$_SESSION["cart_session"] = $product;
			}}else{
			//create a new session var if does not exist
			$_SESSION["cart_session"] = $new_product;
		}

	}
	}
	
	//redirect back to original page
	header('Location:'.$return_url);
})