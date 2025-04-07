function renderPagination(totalPages, currentPage, formData) {
    // Util function for display the pages and bold the page that user has navigated to 
    let paginationHTML = '';
    for (let i = 0; i < totalPages; i++) {
        const pageLink = `${window.location.pathname}?${formData}&page=${i}`;
        paginationHTML += `<a href="${pageLink}" class="ajax-page" data-page="${i}" ${i === currentPage ? 'style="font-weight: bold;"' : ''} > ${i} |</a>`;
    }
    $('.paging').html(paginationHTML);

}

function fetchNotifications() {
    // Util function for getting all old and new notifications about bookmarked pets status
    $.ajax({
        type: 'GET',
        url: 'get_notifications.php',
        dataType: 'json',
        success: function (data) {
            if (data.notifications && data.notifications.length > 0) {
                $('#notificationList').html(''); 
                data.notifications.forEach(notif => {
                    const newLabel = notif.is_read ? '' : '<span class="new-label">New</span>';
                    $('#notificationList').append(`
                        <li data-id="${notif.id}">
                            <div class="notif-content">
                                <span class="notif-message">${notif.message}</span>
                                <span class="notif-meta">
                                    <span class="timestamp">${notif.timestamp}</span>
                                    ${newLabel}
                                </span>
                            </div>
                        </li>
                    `);
                });

                // Update header to show count
                $('.dropdown-header').text(`Notifications (${data.unread} new of ${data.total})`);
                // Toggle red dot
                $('#notificationDot').toggle(data.unread > 0);
            } else {
                // If there is no notification
                $('#notificationList').html('<li>No notifications</li>');
                $('.dropdown-header').text('Notifications (0)');
                $('#notificationDot').hide();
            }
        }
    });
}


$(document).ready(function() {
    // Handler for form submit
    $('.filter-form').submit(function(event) {
        event.preventDefault();
        const formData = $(this).serialize() + `&page=0`;
        history.pushState(null, '', `index.php?${formData}`);
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
               
                renderPagination(data.totalPages, data.currentPage, formData);

            },
            error: function () {
                // alert('Error fetching pet');
            }
        })
    });


    // Handler for ajax page click 
    $(document).on('click', '.ajax-page', function(event) {
        event.preventDefault();
        const page = $(this).data('page');
        // alert("call in ajax page click");

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
        // alert("call in server page click");

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

   
    

    // handlere for bookmark click
    $(document).on('click', '.bookmark-icon', function () {
        const icon = $(this);
        const petCard = icon.closest('.pet-card');
        const petId = petCard.data('pet-id');

        // Optimistically toggle icon UI for user feedback

        if (icon.closest('.home-pet-sec').length) {
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

                    }
                },
                error: function () {
                    // Rollback icon if error
                    icon.toggleClass('fa-regular fa-solid');
                    alert('Error saving bookmark.');
                }
            });
        }


        if (icon.closest('.saved-pet-sec').length) {
            // Optimistically toggle icon UI for user feedback
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
        }
    });

    // fetch all notfication once the doc is read
    fetchNotifications();
    // after that polling every 5 seconds to check for new notifications
    setInterval(fetchNotifications, 5000);

    $('#notificationIcon').on('click', function (event) {
        event.preventDefault();
        $('#notificationDropdown').toggle();
        $('#notificationDot').hide(); // Hide red dot
    
        // Mark all as read when user toggled notification off 
        const isNowVisible = $('#notificationDropdown').is(':visible')
        if (!isNowVisible) {
            const topId = $('#notificationList li').first().data('id');
            // alert(`Closed topid = ${topId}`)
            if (topId) {
                $.post('mark_notifications_read.php', { top_id: topId });
            }
        } 
    });

});

