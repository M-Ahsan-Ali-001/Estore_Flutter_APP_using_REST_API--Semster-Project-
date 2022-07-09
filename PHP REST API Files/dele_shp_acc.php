<?php
include "config.php";

$user=$_POST['user'];

$sql="DELETE FROM Shop_owners Where store_id='$user'";

$query=sqlsrv_query($conn,$sql);

$sql="DELETE FROM fruits Where sid_fruits='$user'";

$query=sqlsrv_query($conn,$sql);

$sql="DELETE FROM Vegs Where sid_Vegs='$user'";

$query=sqlsrv_query($conn,$sql);


$sql="DELETE FROM elec Where sid_elec='$user'";

$query=sqlsrv_query($conn,$sql);

$sql="DELETE FROM dairy Where sid_dairy='$user'";

$query=sqlsrv_query($conn,$sql);


$sql="DELETE FROM phone Where sid_phone='$user'";

$query=sqlsrv_query($conn,$sql);

$sql="DELETE FROM cosm Where sid_cosm='$user'";

$query=sqlsrv_query($conn,$sql);

$sql="DELETE FROM console Where sid_console='$user'";

$query=sqlsrv_query($conn,$sql);

$sql="DELETE FROM cloth Where sid_cloth='$user'";

$query=sqlsrv_query($conn,$sql);

$sql="DELETE FROM car Where sid_car='$user'";

$query=sqlsrv_query($conn,$sql);


ehco("DONE");


?>
