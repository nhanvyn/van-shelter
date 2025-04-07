<?php

// index.php
// Description: Handles server-side rendering of the pet list and pagination.
// This includes the following scenarios:
// 1. When the user visits the homepage for the first time.
// 2. When the user opens a link containing filtering criteria (e.g., pasted URL with query parameters).

error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();  // Start the session
require('helpers.php');  // Include your helper functions
require("db.php");  // Include your database connection

// Get the user's preferred pet types from the session (from profile)
$preferred_pet_types = isset($_SESSION['preferred_pet_types']) ? $_SESSION['preferred_pet_types'] : [];

// Get pets that are bookmarked by the user
$bookmarked_pet_ids = [];
if (isset($_SESSION['user_id'])) {
    $bookmarked_pet_ids = getUserBookmarkedPetIds($db, $_SESSION['user_id']);
}

// Extract filter values from $_GET (for sorting, pagination, etc.)
$type_ids = $_GET['checkBoxes'] ?? [];
$breed_id = $_GET['breed'] ?? '';
$name = $_GET['name'] ?? '';
$sex = $_GET['sex'] ?? '';
$color = $_GET['color'] ?? '';
$age = $_GET['age_category'] ?? '';
$status_id = $_GET['status'] ?? '';
$source_id = $_GET['source'] ?? '';
$within = $_GET['within'] ?? '';
$sort = $_GET['sort-option'] ?? '';
$page = isset($_GET['page']) ? max(0, intval($_GET['page'])) : 0;

$LIMIT = 9;
$OFFSET = $page * $LIMIT;

// Base query and params for filtering
$baseQuery = "FROM Pets
              INNER JOIN breeds ON breeds.breed_id = Pets.breed_id
              INNER JOIN animaltype ON animaltype.type_id = breeds.type_id
              INNER JOIN statuses ON statuses.status_id = Pets.status_id
              WHERE Pets.animal_id IS NOT NULL";

$params = [];
$types = "";

// Apply the user's personalized pet preferences if available
if (!empty($preferred_pet_types)) {
    $question_marks = array_fill(0, count($preferred_pet_types), '?');
    $placeholder_str = implode(",", $question_marks);
    $baseQuery .= " AND animaltype.type_name IN ($placeholder_str)";
    $params = array_merge($params, $preferred_pet_types);
    $types = str_repeat("s", count($preferred_pet_types));
}

// Apply additional filters (e.g., breed, name, color, etc.)
if (!empty($type_ids)) {
    $question_marks = array_fill(0, count($type_ids), '?');
    $placeholder_str = implode(",", $question_marks);
    $baseQuery  .= " AND animaltype.type_id IN ($placeholder_str)";
    $params = array_merge($params, $type_ids);
    $types .= str_repeat("i", count($type_ids));
}

// Execute count query to get the number of pets
$countQuery = "SELECT COUNT(*) " . $baseQuery;
$stmtCount = $db->prepare($countQuery);
if ($params) $stmtCount->bind_param($types, ...$params);
if (!$stmtCount->execute()) {
    exit("Error executing count query: " . $stmtCount->error);
}
$countResult = $stmtCount->get_result();
$totalPets = $countResult->fetch_row()[0];
$totalPages = ceil($totalPets / $LIMIT);

// Execute fetch query to get all pet results
$fullQuery = "SELECT Pets.*, breeds.breed_name, animaltype.type_name, statuses.status_name " . $baseQuery;
$fullQuery .= ($sort === "oldest") ? " ORDER BY Pets.date_impounded ASC" : " ORDER BY Pets.date_impounded DESC";
$fullQuery .= " LIMIT $LIMIT OFFSET $OFFSET";
$stmt = $db->prepare($fullQuery);
if ($params) $stmt->bind_param($types, ...$params);
if (!$stmt->execute()) {
    exit("Error executing fetch query: " . $stmt->error);
}
$petResult = $stmt->get_result();

// Query for filters (breeds, types, etc.)
$breedResult = $db->query("SELECT breed_id, breed_name FROM breeds ORDER BY breed_id ASC;");
$typeResult = $db->query("SELECT * FROM animaltype ORDER BY type_id ASC;");
$statusResult = $db->query("SELECT * FROM statuses ORDER BY status_name ASC;");
$sourceResult = $db->query("SELECT * FROM sources ORDER BY source_id ASC;");
$sexResult = $db->query("SELECT DISTINCT sex FROM Pets ORDER BY sex DESC;");
$ageResult = $db->query("SELECT DISTINCT age_category FROM Pets");

// View for index.php
include('index_view.php');
?>
