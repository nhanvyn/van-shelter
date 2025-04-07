<?php
function getUserBookmarkedPetIds(mysqli $db, int $user_id): array {
    $ids = [];
    // Prepare the SQL query
    $stmt = $db->prepare("SELECT pet_id FROM bookmarks WHERE user_id = ?");
    
    // Check if the prepare statement was successful
    if ($stmt === false) {
        die('Error preparing statement: ' . $db->error);  // Display detailed error
    }
    
    // Bind the parameters
    $stmt->bind_param("i", $user_id);
    
    // Execute the query
    if (!$stmt->execute()) {
        die('Error executing statement: ' . $stmt->error);  // Display execution error
    }

    // Get the result
    $result = $stmt->get_result();
    
    // Fetch the results
    while ($row = $result->fetch_assoc()) {
        $ids[] = $row['pet_id'];
    }
    
    // Close the statement
    $stmt->close();
    
    // Return the array of pet IDs
    return $ids;
}
?>
