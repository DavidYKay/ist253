<?php

include "include.php";

$mysqli = new mysqli( $db_host, $db_user, $db_password, $db_database);

echo "<strong>Total Owed, Historically</strong>";
echo "<br />";
echo "<br />";

//three-way join
if ($result = $mysqli->query(
    "SELECT 
    CUSTOMER.CustomerFName, CUSTOMER.CustomerLName,
    INVOICE.InvNo, ((1 + INVOICE.SalesTax) * SERVICE_PLAN.SerPlanRate) As 'Total'
    FROM SERVICE_PLAN, INVOICE_SERVICE, INVOICE, CUSTOMER_PRODUCT, CUSTOMER
    WHERE SERVICE_PLAN.SerPlanNo = INVOICE_SERVICE.SerPlanNo AND INVOICE_SERVICE.InvNo = INVOICE.InvNo AND CUSTOMER_PRODUCT.SerPlanNo = INVOICE_SERVICE.SerPlanNo AND CUSTOMER.CustomerAccountNo = CUSTOMER_PRODUCT.CustomerAccountNo
    ORDER BY Total DESC"
)) {
    //Print the result set into a table
    prettyPrint($result);
}
$mysqli->close(); 

//Add buttons in footer
readfile("footer.html");
?>
