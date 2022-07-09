<?php
include "config.php";

$id=$_POST['id'];
$itm=$_POST['itm'];
$st=$_POST['status'];

  $sql="UPDATE prev_ord SET stat='$st' where store_id='$id' AND ordr='$itm' ";
  $qu=sqlsrv_query($conn,$sql);

 ?>
