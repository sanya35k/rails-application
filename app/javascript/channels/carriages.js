$(document).on('turbolinks:load', function () {
    console.log('123');
    $('.seats').hide();
    show_carriage_attr($('#carriage_type').val());

    $('#carriage_type').on('change', function (e) {
        $(".seats input").val("");
        $('.seats').hide();
        show_carriage_attr(e.target.value);
    });

    function show_carriage_attr(type) {
        switch (type) {
            case 'DefaultCarriage':
                $('#sitting_seats').hide();
                $('#top_seats').show();
                $('#bottom_seats').show();
                $('#side_top_seats').show();
                $('#side_bottom_seats').show();
                break;
            case 'CoupeCarriage':
                $('#sitting_seats').hide();
                $('#top_seats').show();
                $('#bottom_seats').show();
                $('#side_top_seats').hide();
                $('#side_bottom_seats').hide();
                break;
            case 'PremiumCarriage':
                $('#sitting_seats').hide();
                $('#top_seats').hide();
                $('#bottom_seats').show();
                $('#side_top_seats').hide();
                $('#side_bottom_seats').hide();
                break;
            case 'SittingCarriage':
                $('#sitting_seats').show();
                $('#top_seats').hide();
                $('#bottom_seats').hide();
                $('#side_top_seats').hide();
                $('#side_bottom_seats').hide();
                break;
        }
    };
})