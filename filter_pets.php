<?php
require("db.php");


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

$query = "SELECT Pets.*, breeds.breed_name, animaltype.type_name, statuses.status_name
          FROM Pets
          INNER JOIN breeds ON breeds.breed_id = Pets.breed_id
          INNER JOIN animaltype ON animaltype.type_id = breeds.type_id
          INNER JOIN statuses ON statuses.status_id = Pets.status_id
          WHERE 1=1";

$params = [];
$types = "";


if (!empty($type_ids)) {
    $question_marks = array_fill(0, count($type_ids), '?');
    $placeholder_str = implode(",", $question_marks);
    $query .= " AND animaltype.type_id IN ($placeholder_str)";
    $params = array_merge($params, $type_ids);
    $types = str_repeat("i", count($type_ids));
} 
if (!empty($breed_id)) {
    $query .= " AND breeds.breed_id = ?"; 
    $params[] = $breed_id;
    $types .= "i";
}
if ($name) {
    $query .= " AND Pets.name LIKE ?";
    $params[] = "%" . $name . "%";
    $types .= "s";
}
if (!empty($sex)) {
    $query .= " AND Pets.sex = ?";
    $params[] = $sex;
    $types .= "s";
}
if (!empty($color)) {
    $query .= " AND Pets.color LIKE ?";
    $params[] = "%" . $color . "%";
    $types .= "s";
}
if (!empty($age)) {
    $query .= " AND Pets.age_category = ?";
    $params[] = $age;
    $types .= "s";
}

if (!empty($status_id)) {
    $query .= " AND Pets.status_id = ?";
    $params[] = $status_id;
    $types .= "i";
}

if (!empty($source_id)) {
    $query .= " AND Pets.source_id = ?";
    $params[] = $source_id;
    $types .= "i";
}


if (!empty($within)) {
    if ($within === "30 days") {
        $query .= " AND Pets.date_impounded >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)";
    } elseif ($within === "3 month") {
        $query .= " AND Pets.date_impounded >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)";
    } elseif ($within === "6 month") {
        $query .= " AND Pets.date_impounded >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)";
    } elseif ($within === "1 year") {
        $query .= " AND Pets.date_impounded >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)";
    }
}


if ($sort === "oldest") {
    $query .= " ORDER BY Pets.date_impounded ASC";
} else {
    $query .= " ORDER BY Pets.date_impounded DESC";
}


$query .= " LIMIT 200";
$stmt = $db->prepare($query);
if (!$stmt) {
    http_response_code(500);
    echo "Database error: " . $db->error;
    exit;
}

// echo "<pre>";
// echo "Query: $query\n";
// echo "Types: $types\n";
// echo "Params: ";
// print_r($params);
// echo "</pre>";

if ($params) {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$petResult = $stmt->get_result();

// echo "<pre>Results:\n";
// while ($row = $petResult->fetch_assoc()) {
//     print_r($row);
// }
// echo "</pre>";


?>

<?php include('components/pet_card.php'); ?>
