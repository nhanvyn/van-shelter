<?php
// Description: This page shows bookmarked pets. When user unbookmark a pet in this page, the entire pet card will be removed 
require('db.php');
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

require('helpers.php');

$user_id = $_SESSION['user_id'];
$bookmarked_pet_ids = getUserBookmarkedPetIds($db, $user_id);

// Fetch all bookmarked pets 
if (count($bookmarked_pet_ids) > 0) {
    $question_marks = implode(',', array_fill(0, count($bookmarked_pet_ids), '?'));
    $query = "SELECT Pets.*, breeds.breed_name, animaltype.type_name, statuses.status_name 
              FROM Pets 
              INNER JOIN breeds ON breeds.breed_id = Pets.breed_id
              INNER JOIN animaltype ON animaltype.type_id = breeds.type_id
              INNER JOIN statuses ON statuses.status_id = Pets.status_id
              WHERE Pets.animal_id IN ($question_marks)";

    $stmt = $db->prepare($query);
    $types = str_repeat('i', count($bookmarked_pet_ids));
    $stmt->bind_param($types, ...$bookmarked_pet_ids);
    $stmt->execute();
    $petResult = $stmt->get_result();
} else {
    $petResult = null; 
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Saved Pets</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">  <!-- icon library - source: https://cdnjs.com/libraries/font-awesome -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>    
    <script src="./js/home.js"></script>
</head>
<body>
    <?php include('components/navbar.php'); ?>
    <div class="container saved-pet-sec">
        <h2>Saved Pets</h2>
        <div class="pet-grid">
            <?php
            if ($petResult && $petResult->num_rows > 0) {
                include('components/pet_cards.php'); 
            } else {
                echo "<p>You haven't bookmarked any pets yet.</p>";
            }
            ?>
        </div>
    </div>
</body>
</html>
