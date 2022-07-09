<?php
include "config.php";

$user=$_POST['cato'];
#$user="fruits";
#$id="pl-7806";
$id=$_POST['id'];
$sid="sid_".$user;

$sql="SELECT * FROM $user where $sid='$id' ";

$query=sqlsrv_query($conn,$sql);
$arr=array();
while($row=sqlsrv_fetch_array($query,SQLSRV_FETCH_ASSOC)){

$arr[]=$row;


}

echo(json_encode($arr));

?>
