<?php
require 'db.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['notifications' => []]);
    exit;
}

$userId = $_SESSION['user_id'];

$stmt = $db->prepare("
    SELECT id, message, is_read, created_at 
    FROM notifications 
    WHERE user_id = ? 
    ORDER BY created_at DESC 
");


$stmt->bind_param('i', $userId);
$stmt->execute();
$result = $stmt->get_result();

$notifications = [];
$unreadCount = 0;

while ($row = $result->fetch_assoc()) {
    if (!$row['is_read']) $unreadCount++;

    $notifications[] = [
        'id' => $row['id'],
        'message' => $row['message'],
        'is_read' => (bool)$row['is_read'],
        'timestamp' => date('M j, H:i', strtotime($row['created_at']))
    ];
}

echo json_encode([
    'notifications' => $notifications,
    'total' => count($notifications),
    'unread' => $unreadCount
]);
