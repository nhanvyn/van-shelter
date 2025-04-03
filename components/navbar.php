<!-- Navigation Bar -->
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/navbar.css">

<div class="navbar">
    <ul>
        <li><a href="index.php">Home</a></li>

        <?php if (!isset($_SESSION['user_id'])): ?>
            <!-- If the user is not logged in, show Login and Register links -->
            <li><a href="login.php">Login</a></li>
            <li><a href="register.php">Register</a></li>
        <?php else: ?>
            <!-- If the user is logged in, show Profile and Logout links -->
            <li><a href="profile.php">Profile</a></li>
            <li><a href="bookmarked_pets.php">Saved Pets</a></li>
            <li><a href="logout.php">Logout</a></li>
        <?php endif; ?>
    </ul>
</div>
