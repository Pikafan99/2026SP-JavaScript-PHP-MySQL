<?php

/*

Class: SP191SP-01
Your Name:
Date:

*/

error_reporting(E_ALL);
ini_set('display_errors', 1);

// Define the captions array
$captions = array(
    "International Space Station fourth expansion [2024]",
    "Assembling the International Space Station [2024]",
    "The Atlantis docks with the ISS [2024]"
);

// Database connection details
$host = 'localhost'; // or your host
$username = ''; // your database username
$password = ''; // your database password
$dbname = ''; // your database name

// Create connection
$conn = mysqli_connect($host, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Loop through the captions array and insert each item into the database
for ($i = 0; $i < count($captions); $i++) {
    $cmd = "INSERT INTO captions (caption, create_dt) VALUES ('".$captions[$i]."', sysdate())";
    
    if (mysqli_query($conn, $cmd)) {
        echo "New record created successfully: " . $captions[$i] . "<br>";
    } else {
        echo "Error: " . $cmd . "<br>" . mysqli_error($conn);
    }
}

// Close connection
mysqli_close($conn);
?>
