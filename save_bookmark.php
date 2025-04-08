<?php
require('db.php');
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'User not logged in']);
    exit;
}

$user_id = $_SESSION['user_id'];
$pet_id = $_POST['pet_id'] ?? '';

if (empty($pet_id)) {
    echo json_encode(['success' => false, 'message' => 'Invalid pet ID']);
    exit;
}

// Check if bookmark already exists
$query = "SELECT id FROM bookmarks WHERE user_id = ? AND pet_id = ?";
$stmt = $db->prepare($query);
$stmt->bind_param('ii', $user_id, $pet_id);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    // If bookmark exists, delete it
    $stmt->close();
    $toBeDeleted = $db->prepare("DELETE FROM bookmarks WHERE user_id = ? AND pet_id = ?");
    $toBeDeleted->bind_param('ii', $user_id, $pet_id);
    $toBeDeleted->execute();
    echo json_encode(['success' => true, 'action' => 'removed']);
} else {
    // Add new bookmark
    $stmt->close();
    $ins = $db->prepare("INSERT INTO bookmarks (user_id, pet_id) VALUES (?, ?)");
    $ins->bind_param('ii', $user_id, $pet_id);
    $ins->execute();
    echo json_encode(['success' => true, 'action' => 'added']);
}
