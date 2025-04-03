<?php
session_start(); 
require("db.php");
include('components/navbar.php');

// Get current user data
$user_id = $_SESSION['user_id'];
$sql = "SELECT name, email, password FROM users WHERE id = ?";
$stmt = $db->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($name, $email, $stored_password);
$stmt->fetch();
$stmt->close();

// Initialize variables for form data
$new_name = $new_email = $new_password = "";
$name_err = $email_err = $password_err = "";

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate and update name
    if (empty(trim($_POST["name"]))) {
        $name_err = "Name is required.";
    } else {
        $new_name = trim($_POST["name"]);
    }

    // Validate and update email
    if (empty(trim($_POST["email"]))) {
        $email_err = "Email is required.";
    } else {
        $new_email = trim($_POST["email"]);
    }

    // Change the password (optional)
    if (!empty(trim($_POST["password"]))) {
        $new_password = trim($_POST["password"]);
        if (strlen($new_password) < 6) {
            $password_err = "Password must be at least 6 characters.";
        } else {
            // Hash the new password
            $new_password = password_hash($new_password, PASSWORD_DEFAULT);
        }
    }

    // If there are no errors, update the user details in the database
    if (empty($name_err) && empty($email_err) && empty($password_err)) {
        // Prepare the update query
        $sql = "UPDATE users SET name = ?, email = ?, password = ? WHERE id = ?";
        $stmt = $db->prepare($sql);
        
        // Bind the parameters: Update password only if it's not empty
        if (empty($new_password)) {
            $stmt->bind_param("sssi", $new_name, $new_email, $stored_password, $user_id); // Use current password if not updating it
        } else {
            $stmt->bind_param("sssi", $new_name, $new_email, $new_password, $user_id); // Update the password with new hashed password
        }

        // Execute the update query
        if ($stmt->execute()) {
            $_SESSION['user_name'] = $new_name;  // Update session with new name
            $_SESSION['user_email'] = $new_email;  // Update session with new email
            header("Location: profile.php");  // Redirect to profile page to see updated info
            exit;
        } else {
            echo "Something went wrong. Please try again.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title> 
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/profile.css">

</head>

<body>
    <div class="profile-form">
        <h2>Profile 🧍</h2>
        <form action="profile.php" method="post">
            <!-- Name Field -->
            <div class="form-group <?php echo (!empty($name_err)) ? 'has-error' : ''; ?>">
                <label for="name">Name</label>
                <input type="text" name="name" class="form-control" value="<?php echo $name; ?>" required>
                <span class="help-block"><?php echo $name_err; ?></span>
            </div>

            <!-- Email Field -->
            <div class="form-group <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control" value="<?php echo $email; ?>" required>
                <span class="help-block"><?php echo $email_err; ?></span>
            </div>

            <!-- New Password Field  -->
            <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label for="password">New Password (Leave it blank to keep the current password)</label>
                <input type="password" name="password" class="form-control">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <input type="submit" value="Save Changes" class="submit-btn">
            </div>

            <p><a href="index.php">Go back to Home</a></p>
        </form>
    </div>
</body>

</html>
