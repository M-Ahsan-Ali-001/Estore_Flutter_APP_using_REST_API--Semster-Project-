<?php
include "config.php";

$id=$_POST['id'];
$query="SELECT * FROM prev_ord where store_id='$id'";

$arr=array();
$run=sqlsrv_query($conn,$query);

while($row=sqlsrv_fetch_array($run,SQLSRV_FETCH_ASSOC)){

$arr[]=$row;



}

echo(json_encode($arr));


?>
