<?php

include "settings.php";

echo "Migration\n";
/* Connect to a MySQL server */

function customer() {
	//read in from test
	$mysqli = new mysqli( $db_host, $db_user, $db_password, 'test');
	$mysqli->select_db('test');

	if (mysqli_connect_errno()) {
		printf("Can't connect to MySQL Server. Errorcode: %s\n", mysqli_connect_error());
		exit;
	}

	/* Send a query to the server */
	#if ($result = $mysqli->query('SELECT Name, Population FROM City ORDER BY Population DESC LIMIT 5')) {
	if ($result = $mysqli->query('SELECT * FROM CUSTOMER')) {

		print("Customers are:\n");
		echo "<br />";
		//Array
		$customers = array();
		/* Fetch the results of the query */
		#while( $row = $result->fetch_assoc() ){
		while( $row = $result->fetch_array() ){
			//printf("%s (%s)\n", $row['Name'], $row['Population']);
			array_push($customers, $row);
		}
		/* Destroy the result set and free the memory used for it */
		$result->close();
		//Switch over to ours
		$mysqli->select_db($db_database);

		if ($stmt = $mysqli->prepare("INSERT INTO CUSTOMER 
			(CustomerAccountNo, CustomerLName, CustomerFName, CustomerAddress, CustomerCity, CustomerState, CustomerZip, CustomerPhone)
			VALUES (?, ?, ?, ?, ?, ?, ?)")
		) {
			echo "Statement: $stmt";
			echo "<br />";
			foreach ($customers as $row) {
				printf("%s (%s)\n", $row[0], $row[1]);
				echo "<br />";
				$stmt->bind_param('issssss', $row); 
				//sssd', $code, $language, $official, $percent
				$stmt->execute(); 
			}
		} else {
			echo "Statement FAIL: $stmt";
			echo "<br />";
		}
	}
	$mysqli->close(); 
}


customer();

/* Close the connection */
?>
