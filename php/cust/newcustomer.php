<?php

include "include.php";

/*
 * Create a new customer based on parameters taken in from the web form
 */
function newCustomer($fname, $lname, $stadd, $stadd2, $city, $state, $zip, $phone) {
    //echo "Params received: ";
    //echo $fname . $lname . $stadd . $stadd2 . $city . $state . $zip . $phone;
	$mysqli = new mysqli( $db_host, $db_user, $db_password, 'test');
	$mysqli->select_db('test');

	if (mysqli_connect_errno()) {
		printf("Can't connect to MySQL Server. Errorcode: %s\n", mysqli_connect_error());
		exit;
	}

    //$stmt = $mysqli->prepare("INSERT INTO CUSTOMER (CustomerLName, CustomerFName, CustomerAddress, CustomerCity, CustomerState, CustomerZip, CustomerPhone) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt = $mysqli->prepare("INSERT INTO CUSTOMER (CustomerAccountNo, CustomerLName, CustomerFName, CustomerAddress, CustomerCity, CustomerState, CustomerZip, CustomerPhone) VALUES (null, ?, ?, ?, ?, ?, ?, ?)");
    $address = $stadd . "\n" . $stadd2;

    $array = array($lname, $fname, $address, $city, $state, $zip, $phone);
    foreach($array as $item) {
        echo "$item <br />";
    }
    $stmt->bind_param('sssssss', $lname, $fname, $address, $city, $state, $zip, $phone);
    //sssd', $code, $language, $official, $percent
    if ($stmt->execute()) {
        echo "Statement SUCCESS";
        echo "<br/>";
    } else {
        echo "Statement FAIL ";
        $error = $stmt->sqlstate;

        echo "Reason: $error";
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

readfile("../footer.html");

?>
