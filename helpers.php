<?php
function getUserBookmarkedPetIds(mysqli $db, int $user_id): array {
    $ids = [];
    $stmt = $db->prepare("SELECT pet_id FROM bookmarks WHERE user_id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $ids[] = $row['pet_id'];
    }
    $stmt->close();
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