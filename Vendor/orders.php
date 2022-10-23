<?php

require("../Admin/connection.php");
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
 ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EVERMALL SELLER DASHBOARD</title>    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="dashing.css">
</head>
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
<body>
    <?php include 'sidebar(Orders).php'; ?>
    <!--Sidebar ended-->

    <!--Page Content-->

    <section id="content">
    <!-- NAVBAR -->
   <?php include 'header.php'; ?>



        <div class="card-header">
            <!--<h1>ORDER LIST</h1>--->
            
            <button type="button" onclick="window.location.href='orders.php';">All</button>
            <button type="button" onclick="window.location.href='pending.php';">Pending</button>
            <button type="button" onclick="window.location.href='orderconfirmed.php';">Confirmed</button>
            <button type="button" onclick="window.location.href='orderpickup.php';">Pickup</button>
            <button type="button" onclick="window.location.href='ordercompleted.php';">Completed</button>
            <button type="button" onclick="window.location.href='cancelledorders.php';">Cancelled</button>
        </div>
        <table class="table" style= "width: 100%">
            <thead>
                <th>Order#</th>
                <th>Order Date</th>
                <th>Ref.Code</th>
                <th>Total Amount</th>
                <th>Order Status</th>
                <th>Action</th>
            </thead>
        
                <tbody>
                    <?php
                require_once("orderView.php");
                 foreach($result as $key =>$value)
                {
                    ?>
                    <tr>
                        <td><?php echo $value["id"] ?></td>
                        <td><?php echo $value["date_created"] ?></td>
                        <td><?php echo $value["code"] ?></td>
                        <td><?php echo $value["total_amount"] ?></td>
                        <td>
                            <?php 
                                switch($value['status']){
                                    case 0:
                                        echo '<span class="badge badge-secondary bg-gradient-secondary px-3 rounded-pill">Pending</span>';
                                        break;
                                    case 1:
                                        echo '<span class="badge badge-primary bg-gradient-primary px-3 rounded-pill">Confirmed</span>';
                                        break;
                                    case 2:
                                        echo '<span class="badge badge-info bg-gradient-info px-3 rounded-pill">Packed</span>';
                                        break;
                                    case 3:
                                        echo '<span class="badge badge-warning bg-gradient-warning px-3 rounded-pill">Out for Delivery</span>';
                                        break;
                                    case 4:
                                        echo '<span class="badge badge-success bg-gradient-success px-3 rounded-pill">Delivered</span>';
                                        break;
                                    case 5:
                                        echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Cancelled</span>';
                                        break;
                                    default:
                                        echo '<span class="badge badge-light bg-gradient-light border px-3 rounded-pill">N/A</span>';
                                        break;
                                }
                            ?>
                        </td>
                         <!--<td> <a href="productpage.php?edit=<?php echo $value['id']; ?>"  onClick="edit(this);" title="Edit" >  <input type="image" src="Images/edit.png" title="Edit"> </a></td>

                        <td><a href="productpage.php?delete=<?php echo $value['id']; ?>" onclick="return confirm('are your sure you want to delete this?');" title="Delete" ><input type="image" src="Images/trash.png" title="Trash">  </a></td>-->

                        <td>
                            <button type="button" class="btn btn-flat border btn-light btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                Action
                            <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu" role="menu">
                                <a class="dropdown-item view_data" href="javascript:void(0)" data-id="<?= $row['id'] ?>" data-code="<?= $row['code'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
                            </div>
                        </td>
                    </tr>
                <?php
                    }    
            
                ?>
                </tbody>
            </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('.view_data').click(function(){
            uni_modal("View Order Details - <b>"+($(this).attr('data-code'))+"</b>","orders/view_order.php?id="+$(this).attr('data-id'),'mid-large')
        })
        $('table').dataTable();
    })
</script>
</section>
</body>
</html>