<?php

include "include.php";

$mysqli = new mysqli( $db_host, $db_user, $db_password, $db_database);

echo "<strong>Most Used Parts</strong>";
echo "<br />";
echo "<br />";
//three-way join
if ($result = $mysqli->query(
    "SELECT TEST_RESULTS.PartNo, INVENTORY.PartName, INVENTORY.ProdType, INVENTORY.PartAvail, COUNT(TEST_RESULTS.PartNo) As 'Parts Needed'
    FROM TEST_RESULTS
    LEFT JOIN INVENTORY
    ON TEST_RESULTS.PartNo = INVENTORY.PartNo
    WHERE TEST_RESULTS.PartNo is NOT NULL
    Group By PartNo"
)) {
    //Print the result set into a table
    prettyPrint($result);
}
$mysqli->close(); 

//Add buttons in footer
readfile("footer.html");
?>
