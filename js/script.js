$("document").ready(function() {
    $('.filter-form').submit(function(event) {
        event.preventDefault();
        const formData = $(this).serialize();
        $.ajax({
            type: 'GET',
            url: 'filter_pets.php',
            data: formData,
            success: function (response) {
                $('.pet-grid').fadeOut(100, function () {
                    $(this).html(response).fadeIn(100);
                });
            },
            error: function () {
                alert('Error fetching pet');
            }
        })
    });

});