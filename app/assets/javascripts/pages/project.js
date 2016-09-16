$(document).ready( function() {
    $(".like").on("ajax:success", function (e, data, status, xhr) {
        $(this).children('i').addClass('fa-heart').removeClass('fa-heart-o');
    });
});
