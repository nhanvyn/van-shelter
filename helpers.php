<?php
function getUserBookmarkedPetIds(mysqli $db, int $user_id): array {
    $ids = [];
    $stmt = $db->prepare("SELECT pet_id FROM bookmarks WHERE user_id = ?");
    
    // Check if the prepare statement was successful
    if ($stmt === false) {
        die('Error preparing statement: ' . $db->error);  // Display detailed error
    }
    
    $stmt->bind_param("i", $user_id);
    
    // Execute the query
    if (!$stmt->execute()) {
        die('Error executing statement: ' . $stmt->error);  // Display execution error
    }

    $result = $stmt->get_result();
    
    while ($row = $result->fetch_assoc()) {
        $ids[] = $row['pet_id'];
    }
    
    // Close the statement
    $stmt->close();
    
    // Return the array of bookmarked pet IDs
    return $ids;
}
    
function getPetDetail($db, $petId) {
    $query = "
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

    $stmt = $db->prepare($query);
    $stmt->bind_param("i", $petId);
    $stmt->execute();
    $result = $stmt->get_result();
    return $result->fetch_assoc(); 
}


function getStatusNameById($db, $statusId) {
    $stmt = $db->prepare("SELECT status_name FROM statuses WHERE status_id = ?");
    $stmt->bind_param("i", $statusId);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();
    return $result ? $result['status_name'] : 'Unknown';
}


function updatePetStatus($db, $petId, $newStatusId) {
    $stmt = $db->prepare("UPDATE Pets SET status_id = ? WHERE animal_id = ?");
    $stmt->bind_param("ii", $newStatusId, $petId);
    return $stmt->execute();
}


function notifyBookmarkedUsers($db, $petId, $message) {
    $bookmarkQuery = $db->prepare("SELECT user_id FROM bookmarks WHERE pet_id = ?");
    $bookmarkQuery->bind_param("i", $petId);
    $bookmarkQuery->execute();
    $bookmarkResult = $bookmarkQuery->get_result();

    $insert = $db->prepare("INSERT INTO notifications (user_id, pet_id, message) VALUES (?, ?, ?)");

    while ($row = $bookmarkResult->fetch_assoc()) {
        $insert->bind_param("iis", $row['user_id'], $petId, $message);
        $insert->execute();
    }
}

function getAnimalTypes(mysqli $db): array {
    $animalTypes = [];
    $result = $db->query("SELECT type_id, type_name FROM animaltype");
    while ($row = $result->fetch_assoc()) {
        $animalTypes[] = $row;
    }
    return $animalTypes;
}


function saveUserPreferences(mysqli $db, int $userId, array $typeIds): void {
    // Remove old preferences
    $delete = $db->prepare("DELETE FROM preferences WHERE user_id = ?");
    $delete->bind_param("i", $userId);
    $delete->execute();

    if (!empty($typeIds)) {
        $insert = $db->prepare("INSERT INTO preferences (user_id, type_id) VALUES (?, ?)");
        foreach ($typeIds as $typeId) {
            $typeId = (int)$typeId;
            $insert->bind_param("ii", $userId, $typeId);
            $insert->execute();
        }
    }
}

function getUserPreferences(mysqli $db, int $userId): array {
    $stmt = $db->prepare("SELECT type_id FROM preferences WHERE user_id = ?");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    $preferences = [];
    while ($row = $result->fetch_assoc()) {
        $preferences[] = $row['type_id'];
    }

    $stmt->close();
    return $preferences;
}


function appendPreferenceOrdering(&$query, &$params, &$types, $db, $user_id, $sort) {
    $preferredTypeIds = getUserPreferences($db, $user_id);
    
    if (!empty($preferredTypeIds)) {
        $placeholders = implode(",", array_fill(0, count($preferredTypeIds), "?"));
        $order = "FIELD(animaltype.type_id, $placeholders) DESC, Pets.date_impounded ";
        $order .= ($sort === "oldest") ? "ASC" : "DESC";

        $query .= " ORDER BY $order";
        $params = array_merge($preferredTypeIds, $params);
        $types = str_repeat("i", count($preferredTypeIds)) . $types;
    } else {
        $query .= ($sort === "oldest") ? " ORDER BY Pets.date_impounded ASC" : " ORDER BY Pets.date_impounded DESC";
    }
}