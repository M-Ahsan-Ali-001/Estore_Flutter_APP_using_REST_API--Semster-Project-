<?php
include "config.php";

$pro=$_POST['p_name'];
$new_name=$_POST['new_nm_pr'];
$price=$_POST['new_pr'];
$choice=$_POST['choice'];
$id=$_POST['id'];
$cat=$_POST['cat'];
$f_nm=$cat."_t";
$f_pr="P_".$cat;
$f_id="sid_".$cat;
if ($choice=="1"){


    $sql="UPDATE $cat SET $f_nm='$new_name' where $f_id='$id' ";
    $qu=sqlsrv_query($conn,$sql);
    echo("done");
}
else{
  $sql="UPDATE $cat SET $f_pr='$price' where $f_id='$id' ";
  $qu=sqlsrv_query($conn,$sql);

echo("done");
}

?>
