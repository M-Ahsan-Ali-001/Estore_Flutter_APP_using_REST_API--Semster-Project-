<?php
include "config.php";
$email=$_POST['email'];
$name=$_POST['name'];
$pass=$_POST['pass'];

$sql=" UPDATE logins SET passw='$pass' WHERE u_name='$name' AND emails='$email' ";
  $qu=sqlsrv_query($conn,$sql);



?>
