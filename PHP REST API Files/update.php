<?php
include "config.php";

$name=$_POST['newnm'];
$pass=$_POST['ppp'];
$user=$_POST['user'];

$check="SELECT * From Logins where u_name='$name'";
$fet=sqlsrv_query($conn,$check);
$f=sqlsrv_fetch($fet);
if ($f == false)
{
  $sql="UPDATE logins SET u_name='$name',passw='$pass' where u_name='$user' ";
  $qu=sqlsrv_query($conn,$sql);
  echo ("YOUR ACCOUNT HAS BEEN UPDATED");
}
else
 {
echo "YOU cannot use this username!";

 }






#if($s)
#{

#  echo "yes";
#}
#else

#{echo "fail";
#}


?>
