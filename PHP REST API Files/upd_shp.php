<?php
include "config.php";

$name=$_POST['newnm'];
$pass=$_POST['ppp'];
$user=$_POST['user'];

$check="SELECT * From Shop_owners where u_nm='$name'";
$fet=sqlsrv_query($conn,$check);
$f=sqlsrv_fetch($fet);
if ($f == false)
{
  $sql="UPDATE Shop_owners SET u_nm='$name',pass='$pass' where u_nm='$user' ";
  $qu=sqlsrv_query($conn,$sql);
  echo ("YOUR ACCOUNT HAS BEEN UPDATED");
}
else
 {
echo "YOU cannot use this username!";

 } ?>
