<?php
require("db.php");

// Get the pet ID from the URL
if (isset($_GET['pet'])) {
    $petDetailQuery = "
        SELECT 
            Pets.*, 
            breeds.breed_name,
            animaltype.type_name,
            statuses.status_name,
            sources.source_name
        FROM Pets
        INNER JOIN breeds ON breeds.breed_id = Pets.breed_id
        INNER JOIN animaltype ON animaltype.type_id = breeds.type_id
        INNER JOIN statuses ON statuses.status_id = Pets.status_id
        LEFT JOIN sources ON sources.source_id = Pets.source_id
        WHERE Pets.animal_id = ?
    ";

    $petId = $_GET['pet'];

    // Prepare the query
    $stmt = $db->prepare($petDetailQuery);
    $stmt->bind_param("i", $petId);
    $stmt->execute();
    $petResult = $stmt->get_result();
    
    // Check if any pet was found
    if ($petResult->num_rows > 0) {
        $pet = $petResult->fetch_assoc();
    } else {
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
    <script src="./js/script.js"></script>
    <title>Pet Details</title>
    <link rel="stylesheet" href="css/index.css">
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
                <p><strong>Status:</strong> <?= htmlspecialchars($pet['status_name']) ?></p>
                <p><strong>Sex:</strong> <?= htmlspecialchars($pet['sex']) ?></p>

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
