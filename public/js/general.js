$(document).ready(function () {

    'use strict';

});

var lFollowX = 0,
    lFollowY = 0,
    x = 0,
    y = 0,
    friction = 1 / 30;

function moveBackground() {
    x += (lFollowX - x) * friction;
    y += (lFollowY - y) * friction;

    translate = 'translate(' + x + 'px, ' + y + 'px) scale(1.1)';

    $('.bg').css({
        '-webit-transform': translate,
        '-moz-transform': translate,
        'transform': translate
    });

    window.requestAnimationFrame(moveBackground);
}

$(window).on('mousemove click', function (e) {

    var lMouseX = Math.max(-100, Math.min(100, $(window).width() / 2 - e.clientX));
    var lMouseY = Math.max(-100, Math.min(100, $(window).height() / 2 - e.clientY));
    lFollowX = (20 * lMouseX) / 100; // 100 : 12 = lMouxeX : lFollow
    lFollowY = (10 * lMouseY) / 100;

});
moveBackground();

$(document).ready(function () {
    $('#brand').select2({
        placeholder: 'Brand',
        minimumResultsForSearch: -1

    });
    $('#price-from').select2({
        placeholder: 'price from',
        minimumResultsForSearch: -1
    });
    $('#price-to').select2({
        placeholder: 'price to',
        minimumResultsForSearch: -1
    });
    $('#popular').select2({
        placeholder: 'popular',
        minimumResultsForSearch: -1
    });
    $('.image-list li').on('click', function () {
        var srcImage = $(this).find('img').attr('src');
        var prevImage = $('.prev-image');
        prevImage.attr('src', srcImage)
        $('.zoom').trigger('zoom.destroy'); // remove zoom
        $('.zoom').zoom();

    })

    if ($(window).width() >= 786) {
        $('.mega-title').hover(function () {
            var subMenu = $(this).parent().find('.sub-menu');
            $('.sub-menu').removeClass('active')
            subMenu.addClass('active')
        })
    } else {
        $('.mega-title').click(function () {
            var subMenu = $(this).parent().find('.sub-menu');
            $('.sub-menu').removeClass('active')
            subMenu.addClass('active')
        })
    }
    // $('.department').on('click', function () {
    //     $('.mega-menu').fadeIn()
    // })
    if ($(window).width() >= 768) {
        $(document).click(function (e) {
            // show_alerts is the class of the link to display the popup
            if (!$(e.target).parents().andSelf().is('.mega-menu') && !$(e.target).parents().andSelf().is('.department-target') && !$(e.target).parents().andSelf().is('.left-side')) {
                // hide your popup
                $('.mega-menu').fadeOut()
            } else {
                $('.mega-menu').fadeIn()

            }
        });
    }
    $('.close-store').on('click', function () {
        $('.store').fadeOut()
    })
    $('.show-mobile-search').on('click', function () {
        $(this).find('i').toggleClass('fa-close');
        $(this).find('i').toggleClass('fa-bars');
        $('.center-side, .right-side').fadeToggle()
    })
    $('.close-mega').on('click', function () {
        $('.mega-menu').fadeOut()
    })
    $('.department').on('click', function () {
        $('.mega-menu').fadeIn()
    })

    $('.zoom').zoom();

    $('#rate-pr').barrating({
        theme: 'fontawesome-stars'
    });
    
});
$(window).on('resize', function () {
    if ($(window).width() >= 768) {
        $('.center-side, .right-side').fadeIn()
    }
})

//var scroll = new SmoothScroll('a[href*="#"]');

