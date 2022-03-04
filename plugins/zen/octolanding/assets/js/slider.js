$(document).ready(function() {

    var slider = $("#Slider");
    slider.owlCarousel({
        nav: false,
        slideSpeed : 300,
        paginationSpeed : 400,
        items : 1,
        onChanged: callback,
    });

    function callback(event) {
        $('.descWrap .desc').hide();
        $('.descWrap .desc').eq(event.item.index).fadeIn(300);
    }
    // $('.sliderControl .next').click(function (){
    //     slider.trigger('next.owl.carousel');
    // });
    // $('.sliderControl .prev').click(function (){
    //     slider.trigger('prev.owl.carousel');
    // });
});