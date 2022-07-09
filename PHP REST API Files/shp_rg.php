<?php

include "config.php";


#$name = sqlsrv_real_escape_string($_POST['u_nm']);
#$pass = sqlsrv_real_escape_string($_POST['passs']);

$name=$_POST['unm'];
$para=[$_POST['unm'],$_POST['id'],$_POST['pass'],$_POST['email']];

$check="SELECT * From Shop_owners where u_nm='$name'";
$fet=sqlsrv_query($conn,$check);
$f=sqlsrv_fetch($fet);
if ($f == false)
{
  $query="INSERT INTO Shop_owners(u_nm,store_id,pass,emails) VALUES(?,?,?,?)";
  $reslt=sqlsrv_query($conn,$query,$para);
   if ($reslt>0)
   {
    echo "YOUR ID has been made!";
   }
}
else
 {
echo "YOU cannot use this username!";

 }
?>
