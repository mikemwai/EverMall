<?php
$conn = mysqli_connect("localhost","root","","ecommerce");//enter name of the database here
if($conn == false){
die("ERROR:Could not connect.".mysqli_connect_error());
}

$db=$conn;
$tablename="tbl_complain";  //enter name of the table here
  //these column names can change depending on the way they are named in the database
$columns=['complain_id','user_id','complain','responce',];
$fetchData= fetch_data($db,$tablename,$columns);
function fetch_data($db,$tablename,$columns){
    if(empty($db)){
        $msg="Database connection error";
    }elseif(empty($columns)||!is_array($columns)){
        $msg="columns Name must be defined in an indexed array";   
     }elseif(empty($tablename)){
        $msg="table name is empty";
     }else{

        $columnName=implode(",",$columns);
//enter order by ***** according to the db
        $query="SELECT $columnName FROM $tablename ORDER BY complain_id ASC";
        $result=$db->query($query);

        if($result==true){
            if($result->num_rows>0){
                $row=mysqli_fetch_all($result,MYSQLI_ASSOC);
                $msg=$row;
            }else{
                $msg="No Data Found";
            }
        }else{
            $msg=mysqli_error($db);
        }
     }
     return $msg;
}

?>