<?php

include "include.php";

function newCustomer($fname, $lname, $stadd, $stadd2, $city, $state, $zip, $phone) {
	//read in from test
	$mysqli = new mysqli( $db_host, $db_user, $db_password, 'test');
	$mysqli->select_db('test');

	if (mysqli_connect_errno()) {
		printf("Can't connect to MySQL Server. Errorcode: %s\n", mysqli_connect_error());
		exit;
	}

	/*
	#if ($result = $mysqli->query('SELECT Name, Population FROM City ORDER BY Population DESC LIMIT 5')) {
	if ($result = $mysqli->query('SELECT * FROM CUSTOMER')) {

		print("Customers are:\n");
		echo "<br />";
		//Array
		$customers = array();
		#while( $row = $result->fetch_assoc() ){
		while( $row = $result->fetch_array() ){
			//printf("%s (%s)\n", $row['Name'], $row['Population']);
			array_push($customers, $row);
		}
		$result->close();
		//Switch over to ours
		$mysqli->select_db($db_database);
     */

    if ($stmt = $mysqli->prepare("INSERT INTO `CUSTOMER` 
        (CustomerLName, CustomerFName, CustomerAddress, CustomerCity, CustomerState, CustomerZip, CustomerPhone)
        VALUES ('?', '?', '?', '?', '?', '?', '?')")
    ) {
        $address = $stadd . "\n" . $stadd2;
        #$stmt->bind_param('sssssss', $fname, $lname, $address, $city, $state, $zip, $phone);
        $stmt->bind_param('sssssss', $fname, $lname, $address, $city, $state, $zip, $phone);
        //sssd', $code, $language, $official, $percent
        $stmt->execute(); 
        echo "Statement SUCCESS";
    } else {
        echo "Statement FAIL: $stmt";
        echo "<br />";
    }
        $mysqli->close(); 
}

echo "Hello, " . $_POST['element_1'] . "!";
echo "<br/>";

$fname  = $_POST['element_1'];
$lname  = $_POST['element_2'];

$stadd  = $_POST['element_3_1'];
$stadd2 = $_POST['element_3_2'];
$city   = $_POST['element_3_3'];
$state  = $_POST['element_3_4'];
$zip    = $_POST['element_3_5'];

$phone  = $_POST['element_4_1'] .  $_POST['element_4_2'] .  $_POST['element_4_3'];

if ($fname && $lname) {
    newCustomer($fname, $lname, $stadd, $stadd2, $city, $state, $zip, $phone);
}

?>
