<?php
require 'db.php';
session_start();

if (!isset($_SESSION['user_id']) || !isset($_POST['top_id'])) exit;

$userId = $_SESSION['user_id'];
$topId = intval($_POST['top_id']); // sanitize input

$stmt = $db->prepare("UPDATE notifications SET is_read = 1 WHERE user_id = ? AND id <= ?");
$stmt->bind_param('ii', $userId, $topId);
$stmt->execute();