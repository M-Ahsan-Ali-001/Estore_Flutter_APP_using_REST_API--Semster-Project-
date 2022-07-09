<?php
include "config.php";

$n=$_POST['unam'];
$p=$_POST['pass'];
$q="SELECT * FROM Shop_owners WHERE u_nm='$n' and pass='$p'";
$run=sqlsrv_query($conn,$q);
$fett=sqlsrv_fetch($run);

#echo($fet);


if ($fett==true)
  {

		$q1="SELECT store_id  FROM Shop_owners WHERE u_nm='$n' and pass='$p'";
		$r=sqlsrv_query($conn,$q);
		$fft=sqlsrv_fetch($r);
		$obj = sqlsrv_get_field( $r,2);
	echo ($obj);

  }





?>
