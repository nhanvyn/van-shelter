<?php
$dbhost = "localhost";
$dbuser = "root"; 
$dbpass = "";
$dbname = "van_shelter";
$db = new mysqli($dbhost, $dbuser, $dbpass, $dbname);

if ($db->connect_error) {
    exit("Database connection failed: " . $db->connect_error);
}
?>