<?php

/*

Class: SP191SP-01
Your Name:
Date:

*/
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP with JavaScript</title>
</head>
<body>
<article>
    <h2>International Space Station Images</h2>
    <div id="gallery"></div>
</article>
<?php
$caps = array();
$imgs = array();

// Database credentials
$servername = "localhost";  // Change this if your MySQL server is running on a different host
$username = "";          // Change this to your MySQL username
$password = "";              // Change this to your MySQL password, if applicable
$database = "web19101";      // Change this to the name of your database

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
} else {
    // Proceed with your database operations here
    $cmd = "SELECT a.caption, b.img_loc " .
           "FROM captions a " . // Added space after "captions"
           "INNER JOIN images b ON a.caption_id = b.caption_id " . // Added space after "images"
           "WHERE a.caption_id = b.caption_id";
    $result = mysqli_query($conn, $cmd);
    // Fetch data and store in arrays
    while ($row = mysqli_fetch_assoc($result)) {
        list($cap, $img) = array_values($row);
        $caps[] = $cap;
        $imgs[] = $img;
    }

    // Free result set
    mysqli_free_result($result);
}
?>
<h2>Captions Table</h2>
<table>
    <thead>
        <tr>
            <th>Number</th>
            <th>Caption</th>
        </tr>
    </thead>
    <tbody>
        <?php
        // Loop through the caps array and display each item in a table row
        
        mysqli_close($conn);
        ?>
    </tbody>
</table>
</body>
</html>
