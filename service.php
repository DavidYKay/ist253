<?php

include "include.php";

$mysqli = new mysqli( $db_host, $db_user, $db_password, $db_database);

echo "<strong>Customers and their Plans, sorted by rate and type</strong>";
echo "<br />";
echo "<br />";
//three-way join
if ($result = $mysqli->query(
"SELECT SERVICE_PLAN.SerPlanType, SERVICE_PLAN.SerPlanRate, CUSTOMER.CustomerLName, CUSTOMER.CustomerFName
FROM SERVICE_PLAN, CUSTOMER_PRODUCT, CUSTOMER
WHERE SERVICE_PLAN.SerPlanNo = CUSTOMER_PRODUCT.SerPlanNo AND CUSTOMER_PRODUCT.CustomerAccountNo = CUSTOMER.CustomerAccountNo
ORDER BY SerPlanRate"
)) {
    //Print the result set into a table
    prettyPrint($result);
}
$mysqli->close(); 

//Add buttons in footer
readfile("footer.html");
?>

