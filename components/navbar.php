<!-- Navigation Bar -->
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/navbar.css">

<div class="navbar">
     <!-- Logo on the left -->
     <div class="logo">
        <a href="index.php">
            <img src="images/logo.png" alt="Logo">
        </a>
    </div>
    <ul>
        <li><a href="index.php">Home</a></li>

        <?php if (!isset($_SESSION['user_id'])): ?>
            <!-- If the user is not logged in, show Login and Register links -->
            <li><a href="login.php">Login</a></li>
            <li><a href="register.php">Register</a></li>
        <?php else: ?>
            <!-- If the user is logged in, show Profile, Saved Pets, Notification and Logout links -->
            <li><a href="profile.php">Profile</a></li>

            <li><a href="bookmarked_pets.php">Saved Pets</a></li>

            <li class="notification-container">
                <a href="#" id="notificationIcon">
                    <span class="icon-container">
                        <i class="fa-solid fa-bell" style="color: white;"></i>
                        <span id="notificationDot" class="red-dot" style="display: none;"></span>
                    </span>
                    <span class="notif-label">Notification</span>
                </a>
                <div class="notification-dropdown" id="notificationDropdown"  style="display: none;">
                    <div class="dropdown-header">Notifications</div>
                    <ul id="notificationList">
                        <!-- notification item will be dynamically injected here -->
                    </ul>
                </div>
            </li>

            <li><a href="logout.php">Logout</a></li>
        <?php endif; ?>
    </ul>
</div>