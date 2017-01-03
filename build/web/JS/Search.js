$("#box").on('keyup', function () {
    var matcher = new RegExp($(this).val(), 'gi');
    $('.product').show().not(function () {
        return matcher.test($(this).find('.prodtitle').text())
    }).hide();
});

