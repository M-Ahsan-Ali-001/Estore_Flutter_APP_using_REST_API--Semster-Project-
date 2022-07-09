<?php

include "config.php";


#$name = sqlsrv_real_escape_string($_POST['u_nm']);
#$pass = sqlsrv_real_escape_string($_POST['passs']);

$name=$_POST['u_nm'];
$mail=$_POST['email'];
$para=[$_POST['u_nm'],$_POST['passs'],$_POST['email']];

$check="SELECT * From Logins where u_name='$name' OR emails='$mail'";
$fet=sqlsrv_query($conn,$check);
$f=sqlsrv_fetch($fet);
if ($f == false)
{
  $query="INSERT INTO Logins(u_name,passw,emails) VALUES(?,?,?)";
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
