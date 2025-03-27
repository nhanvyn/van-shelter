<?php
require("db.php");
session_start(); 


// Query and setup for server side pagination
$countQuery = "SELECT COUNT(*) as counts FROM pets;";
$countResult = $db->query($countQuery);
$totalPets = $countResult->fetch_assoc()['counts'];
$LIMIT = 9;
$totalPages = ceil($totalPets / $LIMIT);
$page = isset($_GET['page']) ? max(0, intval($_GET['page'])) : 0; // max() makes sure user cannot pass negative number
$OFFSET = $page* $LIMIT;

// Query for pre-populating filter's fields
$breedQuery = "SELECT breed_id, breed_name FROM breeds ORDER BY breed_id ASC;";
$typeQuery = "SELECT * FROM animaltype ORDER BY type_id ASC;";
$statusQuery = "SELECT * FROM statuses ORDER BY status_name ASC;";
$sourceQuery = "SELECT * FROM sources ORDER BY source_id ASC;";
$sexQuery = "SELECT DISTINCT sex FROM Pets ORDER BY sex DESC;";
$ageQuery = "SELECT DISTINCT age_category FROM Pets";
$petQuery = "SELECT 
  Pets.*, 
  breeds.breed_name,
  animaltype.type_id,
  animaltype.type_name,
  statuses.status_name
FROM Pets
INNER JOIN statuses ON statuses.status_id = Pets.status_id 
INNER JOIN breeds ON breeds.breed_id = Pets.breed_id
INNER JOIN animaltype ON animaltype.type_id = breeds.type_id
ORDER BY Pets.date_impounded DESC
LIMIT $LIMIT OFFSET $OFFSET; ";

$breedResult = $db->query($breedQuery);
$typeResult = $db->query($typeQuery);
$statusResult = $db->query($statusQuery);
$sourceResult = $db->query($sourceQuery);
$sexResult = $db->query($sexQuery);
$ageResult = $db->query($ageQuery);
$petResult = $db->query($petQuery);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./js/script.js"></script>
    <title>Vancouver Shelter</title>
    <link rel="stylesheet" href="./css/index.css">
</head>

<body>
    <!-- Navigation Bar -->
    <?php include('components/navbar.php'); ?>

    <main>
        <div class="container">
            <form class="filter-form">
                <div class="search-filter">
                    <div class="top">
                        <label>Types:</label>
                        <div class="type-sec">
                            <?php while ($row = $typeResult->fetch_assoc()) { ?>
                                <div>
                                    <input type="checkbox" name="checkBoxes[]" value="<?= $row['type_id'] ?>">
                                    <label><?= $row['type_name'] ?></label>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <div class="breed-drop-down">
                                <label for="breeds">Choose a breed:</label>
                                <select name="breed" id="breed">
                                    <option value="">Any</option>
                                    <?php while ($row = $breedResult->fetch_assoc()) { ?>
                                        <option value="<?= $row['breed_id'] ?>">
                                            <?= $row['breed_name'] ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="name-field">
                                <label for="name">Name: </label>
                                <input type="text" id="name" name="name">
                            </div>

                            <div class="sex-drop-down">
                                <label for="sex">Sex:</label>
                                <select name="sex" id="sex">
                                    <option value="">Any</option>
                                    <?php while ($row = $sexResult->fetch_assoc()) { ?>
                                        <option value="<?= $row['sex'] ?>">
                                            <?= $row['sex'] ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="middle">
                            <div class="color-field">
                                <label for="color">Color: </label>
                                <input type="text" id="color" name="color">
                            </div>
                            <div class="age-drop-down">
                                <label for="age">Age group:</label>
                                <select name="age_category" id="age_category">
                                    <option value="">Any</option>
                                    <?php while ($row = $ageResult->fetch_assoc()) { ?>
                                        <option value="<?= $row['age_category'] ?>">
                                            <?= $row['age_category'] ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="status-drop-down">
                                <label for="status">Status:</label>
                                <select name="status" id="status">
                                    <option value="">Any</option>
                                    <?php while ($row = $statusResult->fetch_assoc()) { ?>
                                        <option value="<?= $row['status_id'] ?>">
                                            <?= $row['status_name'] ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="right">
                            <div class="source-drop-down">
                                <label for="source">Sources:</label>
                                <select name="source" id="source">
                                    <option value="">Any</option>
                                    <?php while ($row = $sourceResult->fetch_assoc()) { ?>
                                        <option value="<?= $row['source_id'] ?>">
                                            <?= $row['source_name'] ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="date-drop-down">
                                <label for="within">Within Past:</label>
                                <select name="within" id="within">
                                    <option value="">Any</option>
                                    <option value="30 days">30 days</option>
                                    <option value="3 month">3 month</option>
                                    <option value="6 month">6 month</option>
                                    <option value="1 year">1 year</option>
                                </select>
                            </div>

                            <div class="sort-drop-down">
                                <label for="sort-option">Sort By Impound Date:</label>
                                <select name="sort-option" id="sort-option">
                                    <option value="">None</option>
                                    <option value="oldest">Oldest</option>
                                    <option value="newest">Newest</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="submit-sec"><button type="submit" class="submit-btn">Search</button></div>
                </div>
            </form>
        </div>

        <div class="container pet-sec">
            <div class="pet-grid">
                <?php include('components/pet_card.php'); ?>
            </div>

            <div class="paging">
                <?php for ($i = 0; $i < $totalPages; $i++): ?>
                        <a href="index.php?page=<?= $i?>"> <?= $i?>| </a>
                <?php endfor; ?>
            </div>
        </div>
    </main>
</body>

</html>
