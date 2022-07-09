<?php
include "config.php";

$n=$_POST['email'];
$p=$_POST['namee'];
$q="SELECT * FROM Shop_owners WHERE u_nm='$p' and emails='$n'";
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
