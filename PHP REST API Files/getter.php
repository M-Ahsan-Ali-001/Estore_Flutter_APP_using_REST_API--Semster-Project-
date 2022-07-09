<?php
include "config.php";

$item=$_POST['getter'];
$price="P_";
$sid="sid_";
$price.=$item;
$sid.=$item;
#$item='Fruits';

$sql="SELECT * FROM $item ";
$array=array();
$qur=sqlsrv_query($conn,$sql);
#$fetch=sqlsrv_fetch_Array($qur);
#$ft=sqlsrv_get_field($qur,1);

while($row=sqlsrv_fetch_Array($qur,SQLSRV_FETCH_ASSOC))
{
    $array[]=$row;
    //print(json_encode($row));
    //echo (json_encode($row['Fruits']));

}
echo (json_encode($array));
#echo $array;

?>
