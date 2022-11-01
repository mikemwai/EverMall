<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Form </title>
   </head>
   <style >
      body{
         background-image: radial-gradient(teal,grey);
     
      }
   </style>
   <body>
      <center>
         <form style="padding-top: 150px;  " action="MpesaTest.php" method="POST">
            <fieldset style="width: 500px; height: 300px; background-color: ghostwhite; border: 2px solid #eee; border-radius:30px; ">
               <label style="padding-top: 200px;color:burlywood;">Pay Online</label>
               <br>
               <input class="input2" type="number" name="amount" placeholder="Enter Amount" style="margin-top: 60px; padding: 10px; border: 2px solid #eee; border-radius:10px;  width:90%;">
               <br><br>
               <input type="number" type="number" name="phone_number" placeholder="enter Phone number" style="padding: 10px; margin:10px 0; border: 2px solid #eee; border-radius:10px;  width:90%;">
               <br><br>
               <button class="button" style="color: white; background-color: orange; border: 2px solid #eee; border-radius:10px; width:90%; height:20%; ">
                  <a href="express-stk.php"> Make Payment Now</a>
             
               </button>
            </fieldset>
         </form>
      </center>
      </div>
   </body>
</html>