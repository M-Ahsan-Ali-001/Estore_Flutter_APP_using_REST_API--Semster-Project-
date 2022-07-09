<?php
include "config.php";


$para=[$_POST['itms'],$_POST['pr'],$_POST['stat'],$_POST['u_nam'],$_POST['addrs'],$_POST['st_id']];
#$para=['apple orange  kivi', '3450','pending','user','islamabad'];

$sql="Insert into prev_ord VALUES(?,?,?,?,?,?); ";
$qur=sqlsrv_query($conn,$sql,$para);

#echo $array;

?>
