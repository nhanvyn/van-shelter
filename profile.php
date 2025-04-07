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
$new_name = $new_email = $new_password = $current_password = "";
$name_err = $email_err = $password_err = $current_password_err = "";

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if (isset($_POST['checkBoxes'])) {
        // Save the selected pet types in session
        $_SESSION['preferred_pet_types'] = $_POST['checkBoxes'];
    }
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

    // Validate and check current password for password change
    if (!empty(trim($_POST["password"]))) {
        if (empty(trim($_POST["current_password"]))) {
            $current_password_err = "Please enter your current password.";
        } else {
            $current_password = trim($_POST["current_password"]);
            if (!password_verify($current_password, $stored_password)) {
                $current_password_err = "The current password you entered is incorrect.";
            }
        }
        // Change the password (optional)
        if (empty($current_password_err) && strlen(trim($_POST["password"])) >= 6) {
            $new_password = trim($_POST["password"]);
            $new_password = password_hash($new_password, PASSWORD_DEFAULT);
        }
    }

    // Save user preferences (checkboxes for pet types)
    if (isset($_POST['pet_types'])) {
        $_SESSION['preferred_pet_types'] = $_POST['pet_types']; // Save preferences in session
    }

    // If no errors, update user details in database
    if (empty($name_err) && empty($email_err) && empty($password_err) && empty($current_password_err)) {
        $sql = "UPDATE users SET name = ?, email = ?, password = ? WHERE id = ?";
        $stmt = $db->prepare($sql);
        if (empty($new_password)) {
            $stmt->bind_param("sssi", $new_name, $new_email, $stored_password, $user_id);
        } else {
            $stmt->bind_param("sssi", $new_name, $new_email, $new_password, $user_id);
        }

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

            <!-- Current Password Field -->
            <div class="form-group <?php echo (!empty($current_password_err)) ? 'has-error' : ''; ?>">
                <label for="current_password">Current Password</label>
                <input type="password" name="current_password" class="form-control" required>
                <span class="help-block"><?php echo $current_password_err; ?></span>
            </div>

            <!-- New Password Field -->
            <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label for="password">New Password (Leave it blank to keep the current password)</label>
                <input type="password" name="password" class="form-control">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>

            <!-- Pet Type Preferences (Checkboxes) -->
            <div class="form-group">
                <label for="pet_types">Preferred Pet Types</label>
                <div>
                    <input type="checkbox" name="pet_types[]" value="Dog" <?php echo (in_array('Dog', $_SESSION['preferred_pet_types'] ?? [])) ? 'checked' : ''; ?>> Dog
                    <input type="checkbox" name="pet_types[]" value="Cat" <?php echo (in_array('Cat', $_SESSION['preferred_pet_types'] ?? [])) ? 'checked' : ''; ?>> Cat
                    <input type="checkbox" name="pet_types[]" value="Bird" <?php echo (in_array('Bird', $_SESSION['preferred_pet_types'] ?? [])) ? 'checked' : ''; ?>> Bird
                </div>
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
