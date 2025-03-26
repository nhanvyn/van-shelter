function renderPagination(totalPages, currentPage) {
    let paginationHTML = '';
    for (let i = 0; i < totalPages; i++) {
        paginationHTML += `<a href="#" class="ajax-page" data-page="${i}"> ${i}|</a>`;
    }
    $('.paging').html(paginationHTML);

}


$("document").ready(function() {
    $('.filter-form').submit(function(event) {
        event.preventDefault();
        const formData = $(this).serialize();
        // history.replaceState(null, '', `?${formData}`);
        // alert("call in submit form click")

        $.ajax({
            type: 'GET',
            url: 'filter_pets.php',
            data: formData,
            success: function (response) {
                
                const data = JSON.parse(response);
                $('.pet-grid').fadeOut(100, function () {
                    $(this).html(data.html).fadeIn(100);    
                });
               
                renderPagination(data.totalPages, data.currentPage);

            },
            error: function () {
                alert('Error fetching pet');
            }
        })
    });



    $(document).on('click', '.ajax-page', function(event) {
        event.preventDefault();
        const page = $(this).data('page');
        // alert("call in ajax page click");

        const formData = $('.filter-form').serialize() + `&page=${page}`;
        // history.replaceState(null, '', `?${formData}`);
        $.ajax({
            type: 'GET',
            url: 'filter_pets.php',
            data: formData,
            success: function (response) {
                const data = JSON.parse(response);
                $('.pet-grid').fadeOut(100, function () {
                    $(this).html(data.html).fadeIn(100);
                });
                renderPagination(data.totalPages, data.currentPage);
            }
        });
    })

});

