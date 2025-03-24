<!-- resuable pet-card components for first time opening webpage and subsequent ajax calls -->


<?php while ($row = $petResult->fetch_assoc()): ?>
    <div class="pet-card" data-pet-id="<?= $row['animal_id'] ?>">
        <div class="pet-card-header">
            <h2><?= !empty($row['name']) ? htmlspecialchars($row['name']) : 'No name' ?></h2>
            <p>
                <?php if ($row['type_name'] === 'Dog'): ?>🐶
                <?php elseif ($row['type_name'] === 'Cat'): ?>🐱
                <?php else: ?>🐦<?php endif; ?>
            </p>
        </div>
        <p>Type: <?= htmlspecialchars($row['type_name']) ?></p>
        <p>Age: <?= htmlspecialchars($row['age_category']) ?></p>
        <p>Impound Date: <?= htmlspecialchars($row['date_impounded']) ?></p>
        <p>Status: <?= htmlspecialchars($row['status_name']) ?></p>
        <p>Color: <?= htmlspecialchars($row['color']) ?></p>
        <button class="view-details"
                onclick="window.location.href='pet_details.php?pet=<?= $row['animal_id'] ?>'">
            View Details
        </button>
    </div>
    
<?php endwhile; ?>

