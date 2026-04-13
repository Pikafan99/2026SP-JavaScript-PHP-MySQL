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
$username = 'root'; // your database username
$password = ''; // your database password
$dbname = ''; // your database name

// Create connection
$conn = mysqli_connect($host, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Loop through the captions array and delete each item in the table based on the caption item text
for ($i = 0; $i < count($captions); $i++) {
    $cmd = "REPLACE THIS TEXT WITH THE DELETE QUERY TO DELETE ONLY THE THREE CAPTION ITEMS YOU ADDED IN PROJECT 3";
    
    if (mysqli_query($conn, $cmd)) {
        echo "The record was successfully deleted for the caption: " . $captions[$i] . "<br>";
    } else {
        echo "Error: " . $cmd . "<br>" . mysqli_error($conn);
    }
}

// Close connection
mysqli_close($conn);
?>
