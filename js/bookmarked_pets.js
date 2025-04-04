$(document).ready(function() {
   
    $(document).on('click', '.bookmark-icon', function () {
    const icon = $(this);
    const petCard = icon.closest('.pet-card');
    const petId = petCard.data('pet-id');

    // Optimistically toggle icon UI
    icon.toggleClass('fa-regular fa-solid');

    $.ajax({
        type: 'POST',
        url: 'save_bookmark.php',
        data: { pet_id: petId },
        success: function (response) {
            const res = JSON.parse(response);
            if (!res.success) {
                // go back to default icon if failed
                icon.toggleClass('fa-regular fa-solid');
                alert('failed to set the bookmark');
            } else {
                petCard.fadeOut(200, function () {
                    $(this).remove();
                });
            }
        },
        error: function () {
            // Rollback icon if error
            icon.toggleClass('fa-regular fa-solid');
            alert('Error saving bookmark.');
        }
    });
});

});

