<?php
include "config.php";

$choice=$_POST['dl'];
$id=$_POST['id'];
$cat=$_POST['cato'];
$f_nm=$cat."_t";
$f_pr="P_".$cat;
$f_id="sid_".$cat;


    $sql="DELETE FROM $cat WHERE $f_id='$id' AND $f_nm='$choice'";
    $qu=sqlsrv_query($conn,$sql);
    echo("done");


?>
