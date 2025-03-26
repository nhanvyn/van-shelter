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

$baseQuery = "FROM Pets
              INNER JOIN breeds ON breeds.breed_id = Pets.breed_id
              INNER JOIN animaltype ON animaltype.type_id = breeds.type_id
              INNER JOIN statuses ON statuses.status_id = Pets.status_id
              WHERE 1=1";   

$params = [];
$types = "";


if (!empty($type_ids)) {
    $question_marks = array_fill(0, count($type_ids), '?');
    $placeholder_str = implode(",", $question_marks);
    $baseQuery  .= " AND animaltype.type_id IN ($placeholder_str)";
    $params = array_merge($params, $type_ids);
    $types = str_repeat("i", count($type_ids));
} 
if (!empty($breed_id)) {
    $baseQuery  .= " AND breeds.breed_id = ?"; 
    $params[] = $breed_id;
    $types .= "i";
}
if ($name) {
    $baseQuery  .= " AND Pets.name LIKE ?";
    $params[] = "%" . $name . "%";
    $types .= "s";
}
if (!empty($sex)) {
    $baseQuery  .= " AND Pets.sex = ?";
    $params[] = $sex;
    $types .= "s";
}
if (!empty($color)) {
    $baseQuery  .= " AND Pets.color LIKE ?";
    $params[] = "%" . $color . "%";
    $types .= "s";
}
if (!empty($age)) {
    $baseQuery  .= " AND Pets.age_category = ?";
    $params[] = $age;
    $types .= "s";
}

if (!empty($status_id)) {
    $baseQuery  .= " AND Pets.status_id = ?";
    $params[] = $status_id;
    $types .= "i";
}

if (!empty($source_id)) {
    $baseQuery  .= " AND Pets.source_id = ?";
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


// Constructing count query and filtered pet query from base query 
$countQuery = "SELECT COUNT(*) " . $baseQuery;
$fullQuery = "SELECT Pets.*, breeds.breed_name, animaltype.type_name, statuses.status_name " . $baseQuery;

if ($sort === "oldest") {
    $fullQuery .= " ORDER BY Pets.date_impounded ASC";
} else {
    $fullQuery .= " ORDER BY Pets.date_impounded DESC";
}


// Prepare, execute count query  
$stmtCount = $db->prepare($countQuery);
if (!$stmtCount) {
    http_response_code(500);
    echo "Database error: " . $db->error;
    exit;
}
if ($params) {
    $stmtCount->bind_param($types, ...$params);
}
$stmtCount->execute();
$countResult = $stmtCount->get_result();
$totalPets = $countResult->fetch_row()[0];
$LIMIT = 9; 
$totalPages = ceil($totalPets/$LIMIT);
$page = isset($_GET['page']) ? max(0, intval($_GET['page'])) : 0; // max() makes sure user cannot pass negative number
$OFFSET = $page* $LIMIT;




// prepare and execute filtered pet query
$fullQuery .= " LIMIT $LIMIT OFFSET $OFFSET";
$stmt = $db->prepare($fullQuery);
if (!$stmt) {
    http_response_code(500);
    echo "Database error: " . $db->error;
    exit;
}


// ------------code for debugging-----------
// echo "<pre>";
// echo "Query: $fullQuery\n";
// echo "Types: $types\n";
// echo "Params: ";
// print_r($params);
// echo "</pre>";
// ------------code for debugging-----------

if ($params) {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$petResult = $stmt->get_result();

// ------------code for debugging-----------
// echo "<pre>Results:\n";
// while ($row = $petResult->fetch_assoc()) {
//     print_r($row);
// }
// echo "</pre>";
// ------------code for debugging-----------

?>


<?php
    // Sending back data to client 

    ob_start(); // this will capture all outputs from this point until ob_get_clean()
    
    // ------------code for debugging-----------
    // echo "<pre>";
    // echo "Query: $fullQuery\n";
    // echo "Types: $types\n";
    // echo "Params: ";
    // print_r($params);
    // echo "</pre>";
    // ------------code for debugging-----------

    
    include('components/pet_card.php'); // render all cards 
    $cardsHtml = ob_get_clean(); 
    echo json_encode([
        'html' => $cardsHtml,
        'totalPages' => $totalPages,
        'currentPage' => $page
    ]);

 
?>



