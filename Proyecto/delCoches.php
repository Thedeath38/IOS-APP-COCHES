<?php
	error_reporting(E_ALL);
	ini_set('display_errors', '1');

	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "BD_COCHES";
	$matricula = $_POST["matricula"];
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	$sql =  "DELETE FROM VEHICULO WHERE matricula='$matricula';";
	//$sql = "INSERT INTO Table2 VALUES (null,'asdasd','fsdfas','sdfsad','0','12')";
	if ($conn->query($sql) === TRUE) {
	    echo "New record created successfully";
	} else {
	    echo "Error: " . $sql . "<br>" . $conn->error;
	}
	$conn->close();
?>
