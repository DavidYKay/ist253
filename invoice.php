<?php

include "include.php";

$mysqli = new mysqli( $db_host, $db_user, $db_password, $db_database);

//Return a summary of a person's invoices for the year

//Customer
//Customer_Product

//Invoice_Service
//Service_Plan
//Invoice


if ($result = $mysqli->query(
    //"SELECT *
    //FROM INVOICE i INNER JOIN INVOICE_SERVICE is
    //    ON i.CustomerAccountNo = is.CustomerAccountNo JOIN PRODUCT s
    //    ON is.ProdSerNo = s.ProdSerNo
    //ORDER BY i.invoice ASC"
    "SELECT *
    FROM INVOICE i INNER JOIN INVOICE_SERVICE is
        ON i.InvNo = is.InvNo JOIN PRODUCT s
        ON is.SerPlanNo = s.SerPlanNo
    WHERE serPlanNo = 1
    ORDER BY i.invoice ASC"
)) {
    //Print the result set into a table
    prettyPrint($result);
}
$mysqli->close(); 

//Add buttons in footer
readfile("footer.html");
?>
