<?php 
session_start();
if(!isset($_SESSION['username']))
	header('location:login.php');
 ?>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h2>Hello,<?php echo $_SESSION['username']; ?></h2>
<a href="logout.php">Logout</a>
</body>
</html>