<?php
$conn=mysqli_connect("localhost","root","","ecommerce");
if($conn == false){
    die("ERROR:Could not connect.".mysqli_connect_error());
}

if(isset($_POST["Register"]))
{
  $fname=$_POST['first_name'];
  $lname=$_POST['last_name'];
  $email=$_POST['email'];
  $pwd=$_POST['password'];
  $sex=$_POST['gender'];

$sql="INSERT INTO tbl_users(first_name,last_name,email,password,gender) VALUES('$fname','$lname','$email','$pwd','$sex')";
$select=" SELECT * from tbl_users WHERE email='$email' && password='$pwd' ";

$result=mysqli_query($conn,$select);

if(mysqli_num_rows($result)>0)
{
    if(empty($fname) || empty($lname) || empty($email) || empty($pwd) || empty($sex))
    {
    $error[] = 'Please fill out all details!';
    }
    else
    {
    $error[]='User already exists!';
    }
}
else
{
    if(mysqli_query($conn,$sql))
   {
    header('location:../Account/Account.php');
   }
  else
   {
    $error[]='please fill out all details';
   }
}
};
?>

<?php
$conn= mysqli_connect("localhost","root","","ecommerce");
if ($conn==false){
    die("ERROR:Could not connect.".mysqli_connect_error());
}

session_start();

if (isset($_POST["Login"]))
{

   $email=$_POST['Email'];
   $pass=$_POST['password'];

   if(empty($email) || empty($pass))
   {
      $error[] = 'Please fill out all details!';
   }
   else
   {
   $sql=" SELECT * from tbl_users WHERE email='$email' && password='$pass' ";

   $result=mysqli_query($conn,$sql);

   if(mysqli_num_rows($result) > 0)
   {
    //$sql="SELECT * FROM tbl_users WHERE email='".$email."'AND password='".$pass."' limit 1";
    
    //$result=mysqli_query($conn,$sql);
    $row = mysqli_fetch_array($result);
    if($row['role'] == '1')
    {
      $_SESSION['first_name'] = $row['first_name'];
      $_SESSION['last_name'] = $row['last_name'];
      $_SESSION['user_id']=$row['user_id'];
       header('location:../Admin/admin.php');
    }
    elseif($row['role'] == '3')
    {
       $_SESSION['first_name'] = $row['first_name'];
       $_SESSION['last_name'] = $row['last_name'];
       $_SESSION['user_id']=$row['user_id'];
       header('location:../Vendor/dashboard.php'); 
    }
   }
   else
   {
      $error[] = 'Incorrect email or password!';
   }
   }
};
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width , initial-scale=1.0">
    <title>EverMall | Account</title>
    <link rel="stylesheet" href="Account.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<div style="margin: 0 auto" class="hero">
    <div class="header">
        <div class="container">
            <div class="navbar">
                <a href="../Index/Index.php">
                <div class="logo">
                    <img src="../Evermall(White).png" width="200px">
                </div>
                </a>

                <nav>
                <div class="nav-links" id="navLinks">
                <img src="../close.png" class="menu-icon"
                 onclick="hideMenu()">
                <ul id="MenuItems">
                    <li><a href="../Index/Index.php"><i class="fa fa-home"></i> Home</a></li>
                    <li><a href="../Shop/Shop.php">Shop</a></li>
                    <li><a href="../About/About.php">About</a></li>
                    <li><a href="../Contact%20Us/Contact.php">Contact</a></li>
                    <li><a href="../Account/Account.php"><i class="fa fa-user"></i> Account</a></li>
                    <li><a href="../Vendor/Cart.php"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                </ul>
                </div>
                </nav>

                <img src="../menu.png" class="menu-icon"
                 onclick="showMenu()">
            </div>
        </div>
    </div>
    
    <div style="margin: 0 auto" class="form-box">
    
        <div class="form-container">
            <?php
           if(isset($error))
           {
            foreach($error as $error)
            {
            echo '<span class="error-msg">'.$error.'</span>';
             };
           };
           ?>
        </div>       
    
        <div class="button-box">
            <div id="btn"></div>
            <button type="button" class="toggle-btn" onclick="login()">Log In</button>
            <button type="button" class="toggle-btn" onclick="register()">Register</button>
        </div>
        <!--<div class="social-icons">
            <img src="fb.png">
            <img src="tw.png">
            <img src="gp.png">
        </div>--->

        <!------------Login Form-------------->
        <form id="login" action="" method="post" class="input-group">              
                  <input type="email" id="Email" name="Email" placeholder="Email" class="input-field"></p>
                  <input type="password" id="password" name="password" placeholder="Password" class="input-field"></p>
                  <input type="submit" value="Login" name="Login" class="submit-btn"><br>
                   <!--<p>Forgotten Password?</p>
                   <a href="Account_update.php?edit=<?php //echo $row['user_id']; ?>">
                   <p>Reset Password</p>--->
                   </a>
                   <!---<p>Don't have an account? <a href="../Account/Registration.php">Register Now</a></p>--->
        </form>

        <!-----------Registration Form------->
        <form id="register" action="" method="post" class="input-group">    
             <input type="text" id="fname" name="first_name" placeholder="FirstName" class="input-field"><p>
             <input type="varchar" id="lname" name="last_name" placeholder="LastName" class="input-field"></p>
             <input type="email" id="Email" name="email" placeholder="Email" class="input-field"><p>
             <input type="password" id="password" name="password" placeholder="Password" class="input-field"></p>
             <input type="varchar" id="sex" name="gender" placeholder="Gender" class="input-field"></p>
             <!--<input type="checkbox" class="chech-box">I agree to the Terms and Conditions--->
   
             <input type="submit" value="Register" name="Register" class="submit-btn"><br></br>
       </form>

    </div>

</div>

<script>
    var x=document.getElementById("login");
    var y=document.getElementById("register");
    var z=document.getElementById("btn");
    function register()
    {
        x.style.left="-400px";
        y.style.left="50px";
        z.style.left="110px";
    }
    
    function login()
    {
        x.style.left="50px";
        y.style.left="450px";
        z.style.left="0px";
    }
</script>

<!--------------JavaScript for Toggle Menu----------------->
<script>
    var navLinks=document.getElementById("navLinks");
    function showMenu()
    {
        navLinks.style.right="0";
    }

    function hideMenu()
    {
        navLinks.style.right="-200px";
    }
</script>

</body>
</html>