<?php


require_once('../Admin/connections.php');


$sql="SELECT * FROM tbl_product";
$all_product = $conn->query($sql);


?>

<html>
    <head>
        <title>Evermall Product page</title>
        <link rel="stylesheet" href="product2.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
         <link rel="stylesheet" href="../Index/index.css" > 
		
		
</head>
<body>

<!-------Navigation Bar----->
<header>
			
			<ul>
			<a href="../Index/Index.php">
            <li><img src="../Evermall(White).png" width="300px"></li>
            </a>

			<li><b> <a href="../Index/Index.php"><i class="fa fa-home"></i> HOME </a></b>

			<li><b> <a href="#"> ABOUT </a></b>
<ul>
	<li><a href="#"> Our Team </a></li>
	<li><a href="#"> Mission and Vision</a></li>
	<li><a href="#"> Engage with Us  </a></li>
</ul>
			</li>
			<li><b> <a href="#"> CATEGORY </a></b>
<ul>
	<li><a href="#">Health and Beauty </a></li>
	<li><a href="#"> Home and Office </a></li>
	<li><a href="#">Fashion </a></li>
		<li><a href="#">Sports </a></li>
			<li><a href="#">Garden and Outdoor </a></li>
				<li><a href="#">Baby Products </a></li>
				<li><a href="#">Electricals</a></li>

	</ul>
		</li>
			<li><b> <a href="#"> NEW ARRIVALS </a></b>
            <ul>
            	<li><a href="#"> COMING SOON... </a></li>
            </ul>
			</li>
	 <li><b> <a href="../Account/Account.php"><i class="fa fa-user"></i> ACCOUNT </a></b>
        <ul>
	       <li><a href="../Vendor/productpage.php"> Vendor </a></li>
	       <li><a href="../Vendor/Cart.php"> Cart </a></li>
        </ul>
	 </li>
	<li id="contact"><b> <a href="#"> CONTACT US  </a></b></li>
</ul>
</header>

<!-------Body------>
<div class="container">
        <div class="crazydeals">
        <h1> Products </h1>
        <hr/>
        </div>
        <div class="row">
            
		<?php
		while($row=mysqli_fetch_assoc($all_product)){
		?><div class="col-md-3">
            <div class="product-top">
            <img src="../Admin/uploaded_image/<?php echo $row["product_image"]; ?>" width="200px" height="200px"alt = "product image">
            <div class="overlay" >
                <button type="button" class="btn btn-secondary" title="Quick shop">
                    <i class="fa fa-eye"></i></button>
                   
                    <button type="button" class="btn btn-secondary" title="Add to Cart">
                    <i class="fa fa-shopping-cart"></i></button>

            </div>
</div>

<div class="product-bottom text-center">
<i class="fa fa-star" ></i>
<i class="fa fa-star"></i>
<i class="fa fa-star" ></i>
<i class="fa fa-star" ></i>
<i class="fa fa-star-half-o" ></i>
<i class="fa fa-star-o"></i>
<h3><?php echo $row["product_name"]; ?></h3>
<h5> Ksh.<?php echo $row["unit_price"]; ?></h5>

</div>

</div>
<?php
};
?>




</div>
</div>

<!------------FOOTER------------------>
<br><div class="footer">
	<div class="footer-col"> 
	   <img class="image" src="../Evermall(White).png" width="0px">
	     <p> <i>We are an online store serving you with all quality products from different brands around the world. <br> 
	     We have all you need to make life comfortable  from original beauty products, clothes,office equipment and many more.<br>Our aim is to provide the best and bring things closer to you and easier to purchase by the click of a button.<br>We have partnered with 
	     at least 100 brands from Nike, Gucci, Louis Vouton , even thrifting apparels and many more renown brands.</i> </p>
	</div>
	<div class=" footer-col">
	    <h4> <b>COMPANY </b></h4>
	   <ul>
	       <p><u> Pick-UP LOCATIONs</u> </p>
		   <p> Lyric House, First floor,Kimathi Street, CBD  </p>
		   <p>Sawa Mall, 2nd floor,Tom Mboya CBD </p>
		   <p>Sarit Center 14th floor, Westlands  </p>
		   <p>Yaya Center, Third Floor </p>
	   </ul>
	</div>
			 
	<div class="footer-col">
	    <h4> <b>CONTACT US</b></h4>
	        <div class="social-links">
			   <a href="#"><i class="fab fa-facebook-f"></i></a>
			   <a href="#"><i class="fab fa-instagram"></i></a>
			   <a href="#"><i class="fab fa-twitter"></i></a>
               <a href="#"><i class="fab fa-whatsapp"></i></a>
			   <a href="#"><i class="fab fa-pinterest"></i></a>	   
			   <a href="#"><i class="fab fa-linkedin-in"></i></a><br>
			   <p class="email-id"> evermallgoods.co.ke</p>
			   <h5> +254-709543732</h5> <BR>	
				<div class="col">		
					<h5>Newsletter</h5>	
     				<form>
						<i class="far fa-envelope"></i>
						<input type="email" placeholder="Enter your email address" required> 
						<button type="submit"><i class="fas fa-arrow-right"></i></button>
						<p><i><b>Subscribe here to be notified on upcoming sales and events.</b></i></p>
					</form>
				</div>	   				   
		   </div>
	 </div> 
	<p><a href="#"> Terms of Use </a></p>
	<p><a href="#">Privacy Policy  </a></p>  

<div>
     <hr>
     <p class="Copyright"> <i>&#169; 2022 EVERMALL</i></p>
</div>
</div>

</body>
</html>