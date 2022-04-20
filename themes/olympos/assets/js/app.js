(function ($) {
    $('#MoviesFilter').on('change', 'input, select', function(){
        var $form = $(this).closest('form');
        $form.request();
    });
})(jQuery)
