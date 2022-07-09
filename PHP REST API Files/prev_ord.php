<?php

include "config.php";
$u_nam=$_POST['unam'];
#$u_nam='ahsan';


$SQL="SELECT ordr,prc,stat,store_id from prev_ord where u_name='$u_nam'";
$array=array();

$qu=sqlsrv_query($conn,$SQL);
while($row=sqlsrv_fetch_Array($qu,SQLSRV_FETCH_ASSOC)){
    $array[]=$row;

}
echo (json_encode($array));



?>
