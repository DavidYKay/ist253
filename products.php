
<?php

include "include.php";

$mysqli = new mysqli( $db_host, $db_user, $db_password, $db_database);

echo "<strong>Most Popular Appliances</strong>";
echo "<br />";
echo "<br />";
//three-way join
if ($result = $mysqli->query(
    "SELECT CUSTOMER_PRODUCT.ProdSerno, PRODUCT.ProdType, COUNT(CUSTOMER_PRODUCT.ProdSerno) As Partcount 
    FROM PRODUCT
    LEFT JOIN CUSTOMER_PRODUCT
    ON PRODUCT.ProdSerNo = CUSTOMER_PRODUCT.ProdSerNo
    Group By ProdSerNo"
)) {
    //Print the result set into a table
    prettyPrint($result);
}
$mysqli->close(); 

//Add buttons in footer
readfile("footer.html");
?>

