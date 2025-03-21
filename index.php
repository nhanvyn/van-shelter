<?php
require("db.php");
$breedQuery = "SELECT breed_id, breed_name FROM breeds ORDER BY breed_id ASC;";
$typeQuery = "SELECT * FROM animaltype ORDER BY type_id ASC;";
$statusQuery = "SELECT * FROM statuses ORDER BY status_name ASC;";
$sourceQuery = "SELECT * FROM sources ORDER BY source_id ASC;";
$sexQuery = "SELECT DISTINCT sex FROM Pets ORDER BY sex DESC;";
$ageQuery = "SELECT DISTINCT age_category FROM Pets";


$breedResult = $db->query($breedQuery);
$typeResult = $db->query($typeQuery);
$statusResult = $db->query($statusQuery);
$sourceResult = $db->query($sourceQuery);
$sexResult = $db->query($sexQuery);
$ageResult = $db->query($ageQuery);





// $breedResult = $db->query($query);



?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vancouver Shelter</title>
    <link rel="stylesheet" href="./css/index.css">
</head>



<?php
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    
}
?>



<body>
    <main>
        <div class="container">
            <form class="filter-form">
                <div class="search-filter">
                    <div class="top">
                        <label>Types:</label>
                        <div class="type-sec">
                            <?php while ($row = $typeResult->fetch_assoc()) { ?>
                            
                                <div>
                                    <input type="checkbox" value="<?= $row['type_id'] ?>">
                                    <label><?= $row['type_name'] ?></label>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <div class="breed-drop-down">
                                <label for="breeds">Choose a breed:</label>
                                
                                <select name="breeds" id="breeds">
                                    <option value="">None</option>
                                    <?php while ($row = $breedResult->fetch_assoc()) { ?>
                                        <option value="<?= $row['breed_name'] ?>">
                                            <?= $row['breed_name'] ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="name-field">
                                <label for="name">Name: </label>
                                <input type="text" id="name">
                            </div>


                            <div class="sex-drop-down">
                                <label for="sex">Sex:</label>
                                <select name="sex" id="sex">
                                    <option value="any">Any</option>
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
                                <input type="text" id="color">
                            </div>
                            <div class="age-drop-down">
                                <label for="age">Age group:</label>
                                <select name="age_category" id="age_category">
                                    <option value="Any">Any</option>
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
                                    <option value="Any">Any</option>

                                    <?php while ($row = $statusResult->fetch_assoc()) { ?>
                                        <option value="<?= $row['status_name'] ?>">
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
                                    <option>Any</option>
                                    <?php while ($row = $sourceResult->fetch_assoc()) { ?>
                                            <option value="<?= $row['source_name'] ?>">
                                                <?= $row['source_name'] ?>
                                            </option>
                                    <?php } ?>
                                </select>
                            </div>


                            <div class="date-drop-down">
                                <label for="date">Within Past:</label>
                                <select name="date" id="date">
                                    <option value="1 year"> 1 year </option>
                                </select>
                            </div>

                            <div class="sort-drop-down">
                                <label for="sort">Sort By:</label>
                                <select name="sort" id="sort">
                                    <option value="Date Impound">Date Impound</option>
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
                <div class="pet-card">
                    <div class="pet-card-header">
                        <h2>Name: Bulma </h2>
                        <p>🐱</p>
                    </div>
                    <p>Type: Cat  </p> 
                    <p>Age: Puppy</p>
                    <p>Impound Date: 01-01-2021</p>
                    <p>Status: Adoptable</p>
                    <p>Color: Yellow & White</p>
                    <button class="view-details">View Details</button>
                </div>
    
                <div class="pet-card">
                    <div class="pet-card-header">
                        <h2>Name: Bulma </h2>
                        <p>🐱</p>
                    </div>
                    <p>Type: Cat  </p> 
                    <p>Age: Puppy</p>
                    <p>Impound Date: 01-01-2021</p>
                    <p>Status: Adoptable</p>
                    <p>Color: Yellow & White</p>
                    <button class="view-details">View Details</button>
                </div>
    
                <div class="pet-card">
                    <div class="pet-card-header">
                        <h2>Name: Bulma </h2>
                        <p>🐱</p>
                    </div>
                    <p>Type: Cat  </p> 
                    <p>Age: Puppy</p>
                    <p>Impound Date: 01-01-2021</p>
                    <p>Status: Adoptable</p>
                    <p>Color: Yellow & White</p>
                    <button class="view-details">View Details</button>
                </div>

                
           </div>


            
        </div>
    </main>
</body>

</html>