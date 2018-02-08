<?php
	error_reporting(E_ALL);
	ini_set('display_errors', '1');

	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "BD_COCHES";
	$matricula = $_POST["matricula"];
 	$seguro = $_POST["seguro"];
	$marca = $_POST["marca"];
	$modelo = $_POST["modelo"];
	$color = $_POST["color"];
	$itv = $_POST["itv"];
    $propietario = $_POST["propietario"];
    
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	$sql =  "INSERT INTO VEHICULO VALUES('$matricula','$seguro','$marca','$modelo','$color','$itv','$propietario');";
	//$sql = "INSERT INTO Table2 VALUES (null,'asdasd','fsdfas','sdfsad','0','12')";
	if ($conn->query($sql) === TRUE) {
	    echo "New record created successfully";
	} else {
	    echo "Error: " . $sql . "<br>" . $conn->error;
	}
	$conn->close();
?>
