<?php
include "config.php";

$n=$_POST['unam'];
$p=$_POST['pass'];
$q="SELECT * FROM Logins WHERE u_name='$n' and passw='$p'";
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
