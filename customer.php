<?php

include "include.php";

$mysqli = new mysqli( $db_host, $db_user, $db_password, $db_database);

if ($result = $mysqli->query(
    "SELECT *
    FROM CUSTOMER c INNER JOIN CUSTOMER_PRODUCT cp
        ON c.CustomerAccountNo = cp.CustomerAccountNo JOIN PRODUCT p
        ON cp.ProdSerNo = p.ProdSerNo
    ORDER BY p.ProdSerNo ASC"
)) {
    prettyPrint($result);
}

$mysqli->close(); 
/* Close the connection */
?>
