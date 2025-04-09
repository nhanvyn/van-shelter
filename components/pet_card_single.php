<!-- resuable single pet-card component  -->

<div class="pet-card" data-pet-id="<?= $pet['animal_id'] ?>">
    <div class="pet-card-header">
        <div class="left">
            <h2><?= !empty($pet['name']) ? htmlspecialchars($pet['name']) : 'No name' ?></h2>
            <p>
                <?php if ($pet['type_name'] === 'Dog'): ?>🐶
                <?php elseif ($pet['type_name'] === 'Cat'): ?>🐱
                <?php else: ?>🐦<?php endif; ?>
            </p>
        </div>
        <div class="right">
            <?php if (isset($_SESSION['user_id'])): ?>
                <?php
                $isBookmarked = in_array($pet['animal_id'], $bookmarked_pet_ids ?? []);
                $iconClass = $isBookmarked ? 'fa-solid' : 'fa-regular';
                ?>
                <i class="<?= $iconClass ?> fa-bookmark bookmark-icon"></i>
            <?php endif; ?>
        </div>
    </div>
    <p>Type: <?= htmlspecialchars($pet['type_name']) ?></p>
    <p>Breed: <?= htmlspecialchars($pet['breed_name']) ?></p>
    <p>Age: <?= htmlspecialchars($pet['age_category']) ?></p>
    <p>Impound Date: <?= htmlspecialchars($pet['date_impounded']) ?></p>
    <p>Status: <?= htmlspecialchars($pet['status_name']) ?></p>
    <p>Color: <?= htmlspecialchars($pet['color']) ?></p>
    <button class="view-details" onclick="window.location.href='pet_detail.php?pet=<?= $pet['animal_id'] ?>'">
        View Details
    </button>
</div>
