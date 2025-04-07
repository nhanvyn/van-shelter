<?php
require("db.php");
session_start();
require("helpers.php");

// handle update request from admin
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_SESSION['role']) && $_SESSION['role'] === 'admin') {
    $newStatusId = $_POST['status_id'] ?? '';
    $petId = $_POST['pet_id'] ?? '';

    if (!empty($petId) && !empty($newStatusId)) {
        $petDetail = getPetDetail($db, $petId);
        if ($petDetail && $petDetail['status_id'] != $newStatusId){
            // status update and user notification push
            $oldStatusName = getStatusNameById($db, $petDetail['status_id']);
            $newStatusName = getStatusNameById($db, $newStatusId);
            if (updatePetStatus($db, $petId, $newStatusId)) {
                $message = "Status for pet '" . $petDetail['name'] . "' changed from '" . $oldStatusName . "' to '" . $newStatusName . "'.";
                notifyBookmarkedUsers($db, $petId, $message);
            }
    
        }
    }
}


// fetch all possible statuses for admin
$statuses = [];
if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin') {
    $statusQuery = "SELECT status_id, status_name FROM statuses ORDER BY status_name";
    $statusResult = $db->query($statusQuery);
    while ($row = $statusResult->fetch_assoc()) {
        $statuses[] = $row;
    }
}


// Get the pet ID from the URL
if (isset($_GET['pet'])) {
    $petId = $_GET['pet'];
    $pet = getPetDetail($db, $petId);

    if (!$pet) {
        echo "Pet not found!";
        exit;
    }
} else {
    echo "Pet ID not specified!";
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./js/home.js"></script>
    <title>Pet Details</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/pet_detail.css">

</head>

<body>
    <main>
        <div class="pet-detail-container">
            <div class="pet-detail-card">
                <!-- Back to Pets Button (X in the top-right corner) -->
                <a href="index.php" class="back-button">X</a>

                <div class="pet-detail-content">
                    <!-- Left Side (Icon and Name) -->
                    <div class="pet-detail-left">
                        <!-- Animal Icon Section (Bigger Icon) -->
                        <div class="pet-icon">
                            <?php if ($pet['type_name'] === 'Dog'): ?>
                                <span class="icon">🐶</span>
                            <?php elseif ($pet['type_name'] === 'Cat'): ?>
                                <span class="icon">🐱</span>
                            <?php else: ?>
                                <span class="icon">🐦</span>
                            <?php endif; ?>
                        </div>

                        <h2><?= htmlspecialchars($pet['name']) ?></h2>
                    </div>

                    <!-- Right Side (Descriptions) -->
                    <div class="pet-detail-right">
                        <p><strong>Type:</strong> <?= htmlspecialchars($pet['type_name']) ?></p>
                        <p><strong>Breed:</strong> <?= htmlspecialchars($pet['breed_name']) ?></p>
                        <p><strong>Age:</strong> <?= htmlspecialchars($pet['age_category']) ?></p>
                        <p><strong>Impound Date:</strong> <?= htmlspecialchars($pet['date_impounded']) ?></p>
                        <div>
                            <!-- Handle different display mode if user is admin or normal user -->
                            <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
                                <strong>Status:</strong> 
                                <form method="POST" class="status-row">
                                    <input type="hidden" name="pet_id" value="<?= $pet['animal_id'] ?>">
                                    <select name="status_id">
                                        <?php foreach ($statuses as $status): ?>
                                            <option value="<?= $status['status_id'] ?>"
                                                <?= $status['status_name'] === $pet['status_name'] ? 'selected' : '' ?>>
                                                <?= htmlspecialchars($status['status_name']) ?>
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                    <button type="submit">Save Change</button>
                                </form>
                            <?php else: ?>
                                <p><strong>Status:</strong> <?= htmlspecialchars($pet['status_name']) ?></p>
                            <?php endif; ?>
                        </div>


                        <?php if (!empty($pet['source_name'])): ?>
                            <p><strong>Source:</strong> <?= htmlspecialchars($pet['source_name']) ?></p>
                        <?php else: ?>
                            <p><strong>Source:</strong> Not available</p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>


        </div>
    </main>
</body>

</html>