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
