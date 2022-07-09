<?php
include "config.php";

$name=$_POST['u_nm'];

$cat=$_POST['cato'];
$item=$_POST['itm'];
$ct=$cat."_t";

$prc=$_POST['prc'];
$id=$_POST['id'];
#$cat="Fruits";
$cat_p="P_".$cat;

$cat_sid="sid_".$cat;
$para=[$item,$prc,$id];
#$qu="DELETE from store_items where $cat is NULL";
#$run=sqlsrv_query($conn,$qu);
$query="INSERT INTO $cat($ct,$cat_p,$cat_sid) VALUES(?,?,?) ";
$reslt=sqlsrv_query($conn,$query,$para);

$para2=[$name,$cat];
$query2="INSERT INTO own_cat(u_nm,catog) VALUES(?,?)";
$reslt1=sqlsrv_query($conn,$query2,$para2);
?>
