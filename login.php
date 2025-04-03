<?php
session_start();

require('db.php');
include('components/navbar.php'); 

// Init variables
$email = $password = "";
$email_err = $password_err = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validating email
    if (empty(trim($_POST["email"]))) {
        $email_err = "Please enter your email.";
    } else {
        $email = trim($_POST["email"]);
    }

    // Validating password
    if (empty(trim($_POST["password"]))) {
        $password_err = "Please enter your password.";
    } else {
        $password = trim($_POST["password"]);
    }

    // Check for errors before querying the database
    if (empty($email_err) && empty($password_err)) {
        // Prepare a select statement to get user data by email
        $sql = "SELECT id, name, email, password FROM users WHERE email = ?";

        if ($stmt = $db->prepare($sql)) {
            // Bind the email parameter
            $stmt->bind_param("s", $email);

            // Execute the query
            $stmt->execute();
            $stmt->store_result();

            // Check if the email exists
            if ($stmt->num_rows == 1) {
                // Bind the result variables
                $stmt->bind_result($id, $name, $email, $hashed_password);

                // Fetch the result
                if ($stmt->fetch()) {
                    // Check if the password is correct
                    if (password_verify($password, $hashed_password)) {
                        // Password is correct, start a session and store user info
                        session_regenerate_id(true); // Regenerate session ID to prevent session fixation attacks
                        $_SESSION['user_id'] = $id;
                        $_SESSION['user_name'] = $name;
                        $_SESSION['user_email'] = $email;

                        // Redirect to dashboard
                        header("location: index.php"); 
                        exit;
                    } else {
                        $password_err = "The password you entered is incorrect.";
                    }
                }
            } else {
                $email_err = "No account found with that email.";
            }

            $stmt->close();
        }
    }

    $db->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/auth.css">
</head>
<body>
    <div class="container auth-sec">
        <h2>Login</h2>
        <p>Please enter your credentials to login.</p>

        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control" value="<?php echo $email; ?>" required>
                <span class="help-block"><?php echo $email_err; ?></span>
            </div>    

            <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control" required>
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Login">
            </div>
            <p>Don't have an account? <a href="register.php">Register here</a>.</p>
        </form>
    </div>
</body>
</html>
