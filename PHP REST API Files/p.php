<?php

include "config.php";
$conn = new mysqli("localhost","root","data");


#$name = sqlsrv_real_escape_string($_POST['u_nm']);
#$pass = sqlsrv_real_escape_string($_POST['passs']);

$name=$_POST['u_nm'];
$para=[$_POST['u_nm'],$_POST['passs']];

$check="SELECT * From Logins where u_name='$name'";
$fet=$conn->query($check);
$f=$fet->fetch_assoc();
if ($f == false)
{
  $query="INSERT INTO LOGIN(u_name,passw) VALUES(?,?)";
  $reslt=$conn->query($query,$para);
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
