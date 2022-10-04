<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>VENDOR DASHBOARD</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="vendorstyle.css">
</head>
<body>
	<div class="header">
	<div class="user-box">
            <p>username : <span><?php echo $_SESSION['user_name']; ?></span></p>
            <a href="logout.php" class="delete-btn">logout</a>
         </div>

</body>
</html>