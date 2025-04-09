<?php
require('db.php');
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

require('helpers.php');

$user_id = $_SESSION['user_id'];
$bookmarked_pet_ids = getUserBookmarkedPetIds($db, $user_id);

// If user has no bookmarks, show message
$recommendations = [];

if (!empty($bookmarked_pet_ids)) {
    // Get distinct breed IDs from bookmarked pets
    $placeholders = implode(',', array_fill(0, count($bookmarked_pet_ids), '?'));
    $sql = "SELECT DISTINCT breed_id FROM Pets WHERE animal_id IN ($placeholders)";
    $stmt = $db->prepare($sql);
    $types = str_repeat('i', count($bookmarked_pet_ids));
    $stmt->bind_param($types, ...$bookmarked_pet_ids);
    $stmt->execute();
    $result = $stmt->get_result();

    $breed_ids = [];
    while ($row = $result->fetch_assoc()) {
        $breed_ids[] = $row['breed_id'];
    }

    // Fetch up to 5 pets for each breed (excluding already bookmarked ones)
    foreach ($breed_ids as $breed_id) {
        $placeholders = implode(',', array_fill(0, count($bookmarked_pet_ids), '?'));
        // placeholder will later contain the pet_ids that have already been bookmarked 
        $sql = "SELECT Pets.*, breeds.breed_name, animaltype.type_name, statuses.status_name 
                FROM Pets
                INNER JOIN breeds ON breeds.breed_id = Pets.breed_id
                INNER JOIN animaltype ON animaltype.type_id = breeds.type_id
                INNER JOIN statuses ON statuses.status_id = Pets.status_id
                WHERE Pets.breed_id = ? AND Pets.animal_id NOT IN ($placeholders)
                LIMIT 5";

        $param_types = 'i' . str_repeat('i', count($bookmarked_pet_ids));
        $stmt = $db->prepare($sql);
        $stmt->bind_param($param_types, $breed_id, ...$bookmarked_pet_ids);
        $stmt->execute();
        $result = $stmt->get_result();

        while ($row = $result->fetch_assoc()) {
            $recommendations[] = $row;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Recommended Pets</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>    
    <script src="./js/home.js"></script>
</head>
<body>
    <?php include('components/navbar.php'); ?>
    <div class="container saved-pet-sec">
        <h2>Recommended Pets</h2>
        <div class="pet-grid">
            <?php
            if (!empty($recommendations)) {
                foreach ($recommendations as $pet) {
                    include('components/pet_card_single.php'); 
                }
            } else {
                echo "<p>Start bookmarking pets to receive recommendations based on similar breeds.</p>";
            }
            ?>
        </div>
    </div>
</body>
</html>
