$(document).ready(function () {

    'use strict';


    /*
        --------------------------------------------------------------------------
        Nasnav JS
        --------------------------------------------------------------------------
    */
    
    var clicked = false;
    var $header = $('header'),
        $mobileMenu = $('.mobile-menu');
    $header.find('#toggle-menu-btn').click(function () {
        var $this = $(this);
        $this.toggleClass('active');
        if (!clicked) {
            clicked = true;
            $mobileMenu.toggleClass('active');
            setTimeout(function () {
                clicked = false;
            });
        }
    });

    $(document).on('click', function (e) {
        var clickover = $(e.target);
        if (!clickover.closest('header').length && $('.mobile-menu').hasClass('active') && !clicked) {
            $('.mobile-menu').removeClass('active');
            $('#toggle-menu-btn').removeClass('active');
        }
    });
    $(window).scroll(function () {
        $('.barcode .iphone').scrollTop(function () {
            $(".barcode .scan").stop().animate({
                "top": ($(window).scrollTop() / 4) + "px"
            });
        });
    })

    $(window).on('load', function () {
        $('.pageloader .spinner').fadeOut(2000, function () {
            $('.pageloader').fadeOut();
        });
    });


    $('.points .steps li').on('click', function () {
        $(this).addClass('active').siblings().removeClass('active');
    });

    $('#store').click(function () {
        $('.item img').attr('src', 'images/nasorg/points-1.png');
    });
    $('#scan').click(function () {
        $('.item img').attr('src', 'images/nasorg/points-2.png');
    });
    $('#view').click(function () {
        $('.item img').attr('src', 'images/nasorg/points-3.png');
    });

    $('.mobile-wrapper .points-info .steps ul li').on('click', function () {
        $(this).addClass('active').siblings().removeClass('active');
    });

    $('.mobile-wrapper .points-info .steps #store').click(function () {
        $('.mobile-wrapper .points-info .item img').attr('src', 'images/nasorg/mobile/6.png');
    });
    $('.mobile-wrapper .points-info .steps #scan').click(function () {
        $('.mobile-wrapper .points-info .item img').attr('src', 'images/nasorg/mobile/7.png');
    });
    $('.mobile-wrapper .points-info .steps #view').click(function () {
        $('.mobile-wrapper .points-info .item img').attr('src', 'images/nasorg/mobile/8.png');
    });


    /*
        --------------------------------------------------------------------------
        End Nasnav JS
        --------------------------------------------------------------------------
    */


});
