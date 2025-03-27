function renderPagination(totalPages, currentPage, formData) {
    let paginationHTML = '';
    for (let i = 0; i < totalPages; i++) {
        const pageLink = `${window.location.pathname}?${formData}&page=${i}`;
        paginationHTML += `<a href="${pageLink}" class="ajax-page" data-page="${i}" ${i === currentPage ? 'style="font-weight: bold;"' : ''} > ${i} |</a>`;
    }
    $('.paging').html(paginationHTML);

}


$("document").ready(function() {
    // handler for form submit
    $('.filter-form').submit(function(event) {
        event.preventDefault();
        const formData = $(this).serialize() + `&page=0`;
        history.pushState(null, '', `index.php?${formData}`);


        alert("call in submit form click")

        $.ajax({
            type: 'GET',
            url: 'filter_pets.php',
            data: formData,
            success: function (response) {
                
                const data = JSON.parse(response);
                $('.pet-grid').fadeOut(100, function () {
                    $(this).html(data.html).fadeIn(100);    
                });
               
                renderPagination(data.totalPages, data.currentPage, formData);

            },
            error: function () {
                alert('Error fetching pet');
            }
        })
    });


    // handler for ajax page click 
    $(document).on('click', '.ajax-page', function(event) {
        event.preventDefault();
        const page = $(this).data('page');
        alert("call in ajax page click");

        const formData = $('.filter-form').serialize() + `&page=${page}`;
        history.pushState(null, '', `index.php?${formData}`);

        $.ajax({
            type: 'GET',
            url: 'filter_pets.php',
            data: formData,
            success: function (response) {
                const data = JSON.parse(response);
                $('.pet-grid').fadeOut(100, function () {
                    $(this).html(data.html).fadeIn(100);
                });
                renderPagination(data.totalPages, data.currentPage, formData);
            }
        });
    })

    
    // handler for server side page click 
    $(document).on('click', '.server-page', function(event) {
        event.preventDefault();
        const page = $(this).data('page');
        alert("call in server page click");

        const formData = $('.filter-form').serialize() + `&page=${page}`;
        history.pushState(null, '', `index.php?${formData}`);

        $.ajax({
            type: 'GET',
            url: 'filter_pets.php',
            data: formData,
            success: function (response) {
                const data = JSON.parse(response);
                $('.pet-grid').fadeOut(100, function () {
                    $(this).html(data.html).fadeIn(100);
                });
                renderPagination(data.totalPages, data.currentPage, formData);
            }
        });
    })

});

