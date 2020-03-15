$(document).ready(function () {

    'use strict';


    /*
        --------------------------------------------------------------------------
        Nasnav Users JS
        --------------------------------------------------------------------------
    */
 

    $(window).on('load', function () {
        $('.page-loader').fadeOut(1000, function () {
             new WOW().init();
        });
    });

    $('header .nav-items a').click(function(){
        $('html, body').animate({
            scrollTop: $( $(this).attr('href') ).offset().top
        }, 500);
        return false;
    });
    
    $('.nasnav-footer .quick-links a').click(function(){
        $('html, body').animate({
            scrollTop: $( $(this).attr('href') ).offset().top
        }, 500);
        return false;
    });


    $('.earn-points .steps li').on('click', function () {
        $(this).addClass('active').siblings().removeClass('active');
    });

    $('.earn-points .steps li:nth-child(1)').click(function () {
        if ($(this).hasClass('active')) {
            $('.earn-points .item img:nth-child(1)').fadeIn().siblings().fadeOut();
        }
    });
    $('.earn-points .steps li:nth-child(2)').click(function () {
        if ($(this).hasClass('active')) {
            $('.earn-points .item img:nth-child(2)').fadeIn().siblings().fadeOut();
        }
    });
    $('.earn-points .steps li:nth-child(3)').click(function () {
        if ($(this).hasClass('active')) {
            $('.earn-points .item img:nth-child(3)').fadeIn().siblings().fadeOut();
        }
    });

    $('.preivew-steps li a').on('click', function() {
        $(this).addClass('active').siblings().removeClass('active');
    })
    
    $('.preivew-steps li').on('click', function () {
        $(this).addClass('active-link').siblings().removeClass('active-link');
    })
    
    $('.preivew-steps li:nth-child(1) a').on('click', function (e) {
        if ($(this).hasClass('active')) {
            e.preventDefault();
            $('.virtual-experience .phone-wrapper img:nth-child(1)').fadeIn().siblings().fadeOut();
        }
    });

    $('.preivew-steps li:nth-child(2) a').on('click', function (e) {
        if ($(this).hasClass('active')) {
            e.preventDefault();
            $('.virtual-experience .phone-wrapper img:nth-child(2)').fadeIn().siblings().fadeOut();
        }
    });
    $('.preivew-steps li:nth-child(3) a').on('click', function (e) {
        if ($(this).hasClass('active')) {
            e.preventDefault();
            $('.virtual-experience .phone-wrapper img:nth-child(3)').fadeIn().siblings().fadeOut();
        }
    });
    $('.preivew-steps li:nth-child(4) a').on('click', function (e) {
        if ($(this).hasClass('active')) {
            e.preventDefault();
            $('.virtual-experience .phone-wrapper img:nth-child(4)').fadeIn().siblings().fadeOut();
        }
    });
    $('.preivew-steps li:nth-child(5) a').on('click', function (e) {
        if ($(this).hasClass('active')) {
            e.preventDefault();
            $('.virtual-experience .phone-wrapper img:nth-child(5)').fadeIn().siblings().fadeOut();
        }
    });


});
