<?php
$conn=mysqli_connect("localhost","root","","ecommerce");
if($conn == false){
    die("ERROR:Could not connect.".mysqli_connect_error());
}
if(isset($_POST["reset-pass"]))
{
    $email=$_POST['Email'];
    $query=" SELECT * from tbl_users WHERE email='$email' ";
    $r=mysqli_query($conn,$query);

    if(empty($email)){
        echo "Field is empty";
    }else{
        if(mysqli_num_rows($r)>0){
            $token = uniqid(md5(time()));
            $insert_query="INSERT INTO forgot_password (email,token) VALUES ('$email','$token')";
            $res=mysqli_query($conn,$insert_query);

            $to = $email;
            $subject = "Password reset link";
            $msg = 'Click <a href="reset.php?token='.$token.'">here</a>to reset your password';

            $message = "Email: " .$email. "\n\n"." ".$msg;

            $headers = "MIME-Version: 1.0"."\r\n";
            $headers .='Content-type: text/html; charset=UTF-8'."\r\n";
            $headers .="From: joylete.nyarangi@strathmore.edu";

            if(mail($to,$subject,$message,$headers)){
                echo "Password link is sent to your email";
                header('location:../Account/Account.php');
            }else{
                echo "Failed to send";
            }
            $to_email = $email;




            //echo "Click <a href='reset.php?token=$token'>here</a>to reset your password ";
        }else{
            echo "User not Found";
        }
    }

}
?>
