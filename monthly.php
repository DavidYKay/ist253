<?php

include "include.php";

$mysqli = new mysqli( $db_host, $db_user, $db_password, $db_database);

echo "<strong>Active Monthly Plans, Sorted by Product Type</strong>";
echo "<br />";
echo "<br />";
//three-way join
if ($result = $mysqli->query(
    "SELECT * FROM SERVICE_PLAN, CUSTOMER_PRODUCT, PRODUCT 
    WHERE SERVICE_PLAN.SerPlanNo = CUSTOMER_PRODUCT.SerPlanNo AND CUSTOMER_PRODUCT.ProdSerNo = PRODUCT.ProdSerNo
    ORDER BY PRODUCT.ProdType"
)) {
    //Print the result set into a table
    prettyPrint($result);
}
$mysqli->close(); 

//Add buttons in footer
readfile("footer.html");
?>

