<?php
include "config.php";

$user=$_POST['user'];

$sql="DELETE FROM logins Where u_name='$user'";

$query=sqlsrv_query($conn,$sql);

ehco("DONE");


?>
