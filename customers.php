<?php

include "include.php";

$mysqli = new mysqli( $db_host, $db_user, $db_password, $db_database);

echo "<strong>Appliances & Customers</strong>";
echo "<br />";
echo "<br />";
//three-way join
if ($result = $mysqli->query(
    "SELECT *
    FROM CUSTOMER 
    ORDER BY CustomerAccountNo ASC"
)) {
    //Print the result set into a table
    prettyPrint($result);
}
$mysqli->close(); 

//Add buttons in footer
readfile("footer.html");
?>

