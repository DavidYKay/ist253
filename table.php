<html>
<body>
<?php

include "settings.php";

$username = $db_user; 
$password = $db_password; 
$database = $db_database; 

mysql_connect(localhost,$username,$password);
@mysql_select_db($database) or die( "Unable to select database");
$query  = "SELECT * FROM CUSTOMER";
$result = mysql_query($query);

$num = mysql_numrows($result);

mysql_close();
?>
<table border = "0" cellspacing = "2" cellpadding = "2">
<tr>
<th><font face = "Arial, Helvetica, sans-serif">Value1</font></th>
<th><font face = "Arial, Helvetica, sans-serif">Value2</font></th>
<th><font face = "Arial, Helvetica, sans-serif">Value3</font></th>
<th><font face = "Arial, Helvetica, sans-serif">Value4</font></th>
<th><font face = "Arial, Helvetica, sans-serif">Value5</font></th>
</tr>

<?php
$i = 0;
while ($i < $num) {

    $f1 = mysql_result($result,$i,"field1");
    $f2 = mysql_result($result,$i,"field2");
    $f3 = mysql_result($result,$i,"field3");
    $f4 = mysql_result($result,$i,"field4");
    $f5 = mysql_result($result,$i,"field5");
?>

<tr>
<td><font face = "Arial, Helvetica, sans-serif"><?php echo $f1; ?></font></td>
<td><font face = "Arial, Helvetica, sans-serif"><?php echo $f2; ?></font></td>
<td><font face = "Arial, Helvetica, sans-serif"><?php echo $f3; ?></font></td>
<td><font face = "Arial, Helvetica, sans-serif"><?php echo $f4; ?></font></td>
<td><font face = "Arial, Helvetica, sans-serif"><?php echo $f5; ?></font></td>
</tr>

<?php
    $i++;
}
?>
</body>
</html>
