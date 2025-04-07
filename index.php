<?php
// index.php
// Description: Handles server-side rendering of the pet list and pagination.
// This includes the following scenarios:
// 1. When the user visits the homepage for the first time.
// 2. When the user opens a link containing filtering criteria (e.g., pasted URL with query parameters).

require("db.php");
session_start(); 
require('helpers.php');


// Get pets that are bookmarked by user
$bookmarked_pet_ids = [];
if (isset($_SESSION['user_id'])) {
    $bookmarked_pet_ids = getUserBookmarkedPetIds($db, $_SESSION['user_id']);
}

// Extract filter values from $_GET.
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

// Build a SQL base that will be used to construct filter query and count query 
$baseQuery = "FROM Pets
              INNER JOIN breeds ON breeds.breed_id = Pets.breed_id
              INNER JOIN animaltype ON animaltype.type_id = breeds.type_id
              INNER JOIN statuses ON statuses.status_id = Pets.status_id
              WHERE Pets.animal_id IS NOT NULL";

$params = [];
$types = "";


// Apply filters
if (!empty($type_ids)) {
    $question_marks = array_fill(0, count($type_ids), '?');
    $placeholder_str = implode(",", $question_marks );
    $baseQuery  .= " AND animaltype.type_id IN ($placeholder_str)";
    $params = array_merge($params, $type_ids);
    $types = str_repeat("i", count($type_ids));
}
if (!empty($breed_id)) {
    $baseQuery .= " AND breeds.breed_id = ?";
    $params[] = $breed_id;
    $types .= "i";
}
if (!empty($name)) {
    $baseQuery .= " AND Pets.name LIKE ?";
    $params[] = "%" . $name . "%";
    $types .= "s";
}
if (!empty($sex)) {
    $baseQuery .= " AND Pets.sex = ?";
    $params[] = $sex;
    $types .= "s";
}
if (!empty($color)) {
    $baseQuery .= " AND Pets.color LIKE ?";
    $params[] = "%" . $color . "%";
    $types .= "s";
}
if (!empty($age)) {
    $baseQuery .= " AND Pets.age_category = ?";
    $params[] = $age;
    $types .= "s";
}
if (!empty($status_id)) {
    $baseQuery .= " AND Pets.status_id = ?";
    $params[] = $status_id;
    $types .= "i";
}
if (!empty($source_id)) {
    $baseQuery .= " AND Pets.source_id = ?";
    $params[] = $source_id;
    $types .= "i";
}
if (!empty($within)) {
    if ($within === "30 days") {
        $baseQuery  .= " AND Pets.date_impounded >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)";
    } elseif ($within === "3 month") {
        $baseQuery  .= " AND Pets.date_impounded >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)";
    } elseif ($within === "6 month") {
        $baseQuery  .= " AND Pets.date_impounded >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)";
    } elseif ($within === "1 year") {
        $baseQuery  .= " AND Pets.date_impounded >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)";
    }
}


// Execute count query to get number of pets
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


// Query for filters
$breedResult = $db->query("SELECT breed_id, breed_name FROM breeds ORDER BY breed_id ASC;");
$typeResult = $db->query("SELECT * FROM animaltype ORDER BY type_id ASC;");
$statusResult = $db->query("SELECT * FROM statuses ORDER BY status_name ASC;");
$sourceResult = $db->query("SELECT * FROM sources ORDER BY source_id ASC;");
$sexResult = $db->query("SELECT DISTINCT sex FROM Pets ORDER BY sex DESC;");
$ageResult = $db->query("SELECT DISTINCT age_category FROM Pets");

// View for index.php 
include('index_view.php');
?>
