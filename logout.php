<?php
session_start();  

// Destroy all session variables to log the user out
session_unset();
// Destroy the session
session_destroy();  

// Redirect to the homepage (index.php) after logging out
header("location: index.php");
// Ensure no further code is executed
exit;  
?>
