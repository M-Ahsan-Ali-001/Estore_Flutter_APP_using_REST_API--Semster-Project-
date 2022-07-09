<?php
include "config.php";

$n=$_POST['unam'];
$p=$_POST['pass'];
$q="SELECT * FROM Shop_owners WHERE u_nm='$n' and pass='$p'";
$run=sqlsrv_query($conn,$q);
$fett=sqlsrv_fetch($run);

#echo($fet);


if ($fett==false)
	{
    echo("fal");
}



  else
  {

    echo("True");

  }






?>
