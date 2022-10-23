<?php

require("../Admin/connection.php");

session_start();
session_unset();
session_destroy();

header('location:Account.php');

?>