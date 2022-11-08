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
    
    <div style="margin: 4 auto" class="form-box">
    
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
    

        <!------------Login Form-------------->
        <form id="login" action="" method="post" class="input-group">              
                  <input type="email" id="Email" name="Email" placeholder="Email" class="input-field"></p>
                  <input type="password" id="password" name="password" placeholder="Password" class="input-field"></p>
              </form>
          </div>
      </div>
  </body>
  </html>