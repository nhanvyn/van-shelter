<!-- index_view.php
Description: This is the view template used by index.php. It renders the list of pets and pre-selects form fields (e.g., filters) based on the values present in the URL query parameters.
-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>    
    <script src="./js/home.js"></script>
    <title>Vancouver Shelter</title>
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/paging.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">  <!-- icon library - source: https://cdnjs.com/libraries/font-awesome -->
</head>

<body>
    <!-- Navigation Bar -->
    <?php include('components/navbar.php'); ?>

    <main>
        <div class="container">
            <form class="filter-form" method="GET" action="index.php">
                <div class="search-filter">

                    <div class="top">
                        <label>Types:</label>
                        <div class="type-sec">
                            <?php while ($row = $typeResult->fetch_assoc()): ?>
                                <div>
                                    <?php
                                    $checked = in_array($row['type_id'], $type_ids ?? []) ? 'checked' : '';
                                    ?>
                                    <input type="checkbox" name="checkBoxes[]" value="<?= $row['type_id'] ?>" <?= $checked ?>>
                                    <label><?= $row['type_name'] ?></label>
                                </div>
                            <?php endwhile; ?>
                        </div>
                    </div>

                    <div class="bottom">
                        <div class="left">
                            <div class="breed-drop-down">
                                <label for="breeds">Choose a breed:</label>
                                <select name="breed" id="breed">
                                    <option value="">Any</option>
                                    <?php while ($row = $breedResult->fetch_assoc()) : ?>
                                        <?php
                                        $selected = ($row['breed_id'] == $breed_id) ? 'selected' : ''
                                        ?>
                                        <option value="<?= $row['breed_id'] ?>" <?=$selected?>>
                                            <?= $row['breed_name'] ?>
                                        </option>
                                    <?php endwhile; ?>
                                </select>
                            </div>

                            <div class="name-field">
                                <label for="name">Name: </label>
                                <input type="text" id="name" name="name" value="<?= htmlspecialchars($name) ?>">
                            </div>

                            <div class="sex-drop-down">
                                <label for="sex">Sex:</label>
                                <select name="sex" id="sex">
                                    <option value="">Any</option>
                                    <?php while ($row = $sexResult->fetch_assoc()) : ?>
                                        <?php
                                        $selected = ($row['sex'] == $sex) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $row['sex'] ?>" <?= $selected ?>>
                                            <?= $row['sex'] ?>
                                        </option>
                                    <?php endwhile; ?>
                                </select>
                            </div>
                        </div>
                        <div class="middle">
                            <div class="color-field">
                                <label for="color">Color: </label>
                                <input type="text" id="color" name="color" value = "<?= htmlspecialchars($color)?>">
                            </div>
                            <div class="age-drop-down">
                                <label for="age">Age group:</label>
                                <select name="age_category" id="age_category">
                                    <option value="">Any</option>
                                    <?php while ($row = $ageResult->fetch_assoc()) : ?>
                                        <?php
                                        $selected = ($row['age_category'] == $age) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $row['age_category'] ?>" <?=$selected?>>
                                            <?= $row['age_category'] ?>
                                        </option>
                                    <?php endwhile; ?>
                                </select>
                            </div>

                            <div class="status-drop-down">
                                <label for="status">Status:</label>
                                <select name="status" id="status">
                                    <option value="">Any</option>
                                    <?php while ($row = $statusResult->fetch_assoc()) : ?>
                                        <?php
                                        $selected = ($row['status_id'] == $status_id) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $row['status_id'] ?>" <?= $selected ?>>
                                            <?= $row['status_name'] ?>
                                        </option>
                                    <?php endwhile; ?>
                                </select>
                            </div>
                        </div>
                        <div class="right">
                            <div class="source-drop-down">
                                <label for="source">Sources:</label>
                                <select name="source" id="source">
                                    <option value="">Any</option>
                                    <?php while ($row = $sourceResult->fetch_assoc()) : ?>
                                        <?php
                                        $selected = ($row['source_id'] == $source_id) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $row['source_id'] ?>" <?= $selected ?>>
                                            <?= $row['source_name'] ?>
                                        </option>
                                    <?php endwhile; ?>
                                </select>
                            </div>

                            <div class="date-drop-down">
                                <label for="within">Within Past:</label>
                                <select name="within" id="within">
                                    <option value="">Any</option>
                                    <?php
                                    $options = ["30 days", "3 month", "6 month", "1 year"];
                                    foreach ($options as $opt) {
                                        $selected = ($opt == $within) ?  'selected' : '';
                                        echo "<option value=\"$opt\" $selected>$opt</option>";
                                    }
                                    ?>
                                </select>
                            </div>

                            <div class="sort-drop-down">
                                <label for="sort-option">Sort By Impound Date:</label>
                                <select name="sort-option" id="sort-option">
                                    <option value="">None</option>
                                    <option value="oldest" <?= ($sort === "oldest") ? 'selected' : '' ?>>Oldest</option>
                                    <option value="newest" <?= ($sort === "newest") ? 'selected' : '' ?>>Newest</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="submit-sec"><button type="submit" class="submit-btn">Search</button></div>
                </div>
            </form>
        </div>

        <div class="container home-pet-sec">
            <div class="pet-grid">
                <?php include('components/pet_cards.php'); ?>
            </div>

            <div class="paging">
                <?php 
                $baseCriterias = $_GET;
                ?>
                <?php for ($i = 0; $i < $totalPages; $i++): ?>
                        <?php
                        $baseCriterias['page'] = $i;
                        $url = 'index.php?' . http_build_query($baseCriterias);
                        $active = ($page == $i) ? 'style="font-weight: bold;"' : '';
                        ?>
                        <a href="<?= $url?>" class="server-page" data-page="<?= $i?>"> <?= $i?>| </a>
                <?php endfor; ?>
            </div>
        </div>
    </main>
</body>

</html>