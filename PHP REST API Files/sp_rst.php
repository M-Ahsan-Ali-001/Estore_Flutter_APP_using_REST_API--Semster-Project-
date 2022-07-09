<?php
include "config.php";
$email=$_POST['email'];
$name=$_POST['name'];
$pass=$_POST['pass'];

$sql=" UPDATE Shop_owners SET pass='$pass' WHERE u_nm='$name' AND emails='$email' ";
  $qu=sqlsrv_query($conn,$sql);



?>
