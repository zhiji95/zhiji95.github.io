$(function () {

    "use strict";

    //===== Prealoder

    $(window).on('load', function (event) {
        $('#preloader').delay(500).fadeOut(500);
    });


    //===== Sticky

    $(window).on('scroll', function (event) {
        var scroll = $(window).scrollTop();
        if (scroll < 10) {
            $(".navigation").removeClass("sticky");
        } else {
            $(".navigation").addClass("sticky");
        }
    });



    //===== Mobile Menu 

    $(".navbar-toggler").on('click', function () {
        $(this).toggleClass('active');
    });

    $(".navbar-nav a").on('click', function () {
        $(".navbar-toggler").removeClass('active');
    });
    var subMenu = $(".sub-menu-bar .navbar-nav .sub-menu");

    if (subMenu.length) {
        subMenu.parent('li').children('a').append(function () {
            return '<button class="sub-nav-toggler"> <i class="ion ion-ios-arrow-down"></i> </button>';
        });

        var subMenuToggler = $(".sub-menu-bar .navbar-nav .sub-nav-toggler");

        subMenuToggler.on('click', function () {
            $(this).parent().parent().children(".sub-menu").slideToggle();
            return false
        });

    }

    //===== Search 

    $('.search-open').on('click', function () {
        $('.search-box').addClass('open')
    });

    $('.search-close-btn').on('click', function () {
        $('.search-box').removeClass('open')
    });



    //===== Shopping Cart 

    $('.shopping-cart-open').on('click', function () {
        $('.shopping-cart-canvas').addClass('open')
        $('.overlay').addClass('open')
    });

    $('.shopping-cart-close').on('click', function () {
        $('.shopping-cart-canvas').removeClass('open')
        $('.overlay').removeClass('open')
    });
    $('.overlay').on('click', function () {
        $('.shopping-cart-canvas').removeClass('open')
        $('.overlay').removeClass('open')
    });



    //===== Isotope Project 1

    $('.container').imagesLoaded(function () {
        var $grid = $('.grid').isotope({
            // options
            transitionDuration: '1s'
        });

        // filter items on button click
        $('.project-menu ul').on('click', 'li', function () {
            var filterValue = $(this).attr('data-filter');
            $grid.isotope({
                filter: filterValue
            });
        });

        //for menu active class
        $('.project-menu ul li').on('click', function (event) {
            $(this).siblings('.active').removeClass('active');
            $(this).addClass('active');
            event.preventDefault();
        });
    });


    //===== banner animation slick slider

    function mainSlider() {
        var BasicSlider = $('.banner-active');
        BasicSlider.on('init', function (e, slick) {
            var $firstAnimatingElements = $('.banner-area:first-child').find('[data-animation]');
            doAnimations($firstAnimatingElements);
        });
        BasicSlider.on('beforeChange', function (e, slick, currentSlide, nextSlide) {
            var $animatingElements = $('.banner-area[data-slick-index="' + nextSlide + '"]').find('[data-animation]');
            doAnimations($animatingElements);
        });
        BasicSlider.slick({
            autoplay: false,
            autoplaySpeed: 10000,
            dots: false,
            fade: true,
            arrows: true,
            prevArrow: '<span class="prev"><i class="pe-7s-angle-left"></i></span>',
            nextArrow: '<span class="next"><i class="pe-7s-angle-right"></i></span>',
            responsive: [
                {
                    breakpoint: 1100,
                    settings: {
                        dots: false,
                        arrows: false
                    }
                }
            ]
        });

        function doAnimations(elements) {
            var animationEndEvents = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
            elements.each(function () {
                var $this = $(this);
                var $animationDelay = $this.data('delay');
                var $animationType = 'animated ' + $this.data('animation');
                $this.css({
                    'animation-delay': $animationDelay,
                    '-webkit-animation-delay': $animationDelay
                });
                $this.addClass($animationType).one(animationEndEvents, function () {
                    $this.removeClass($animationType);
                });
            });
        }
    }
    mainSlider();

    //===== Brand Active slick slider
    $('.brand-active').slick({
        dots: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 3000,
        arrows: false,
        speed: 3000,
        slidesToShow: 5,
        slidesToScroll: 2,
        responsive: [
            {
                breakpoint: 1201,
                settings: {
                    slidesToShow: 5,
                }
        },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 4,
                }
        },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 3,
                }
        },
            {
                breakpoint: 576,
                settings: {
                    slidesToShow: 2,
                }
        }
      ]
    });


    //===== seller Active slick slider
    $('.seller-active').slick({
        dots: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 5000,
        arrows: true,
        prevArrow: '<span class="prev"><i class="pe-7s-angle-left"></i></span>',
        nextArrow: '<span class="next"><i class="pe-7s-angle-right"></i></span>',
        speed: 1500,
        slidesToShow: 4,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1201,
                settings: {
                    slidesToShow: 4,
                }
        },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 3,
                }
        },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2,
                }
        },
            {
                breakpoint: 576,
                settings: {
                    slidesToShow: 1,
                }
        }
      ]
    });




    //===== customer Active slick slider
    $('.customer-active').slick({
        dots: true,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 5000,
        arrows: false,
        speed: 1500,
        slidesToShow: 2,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1201,
                settings: {
                    slidesToShow: 2,
                }
        },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 2,
                }
        },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                }
        }
      ]
    });


    //====== Magnific Popup\
    
    $('.product-details-thumb').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.blog-thumb-list'
    });
    $('.blog-thumb-list').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        asNavFor: '.product-details-thumb',
        dots: false,
        arrows: false,
        centerMode: true,
        focusOnSelect: true,
        centerPadding: '0px',
    });


    //====== Magnific Popup

    $('.video-popup').magnificPopup({
        type: 'iframe'
        // other options
    });


    //===== Magnific Popup

    $('.image-popup').magnificPopup({
        type: 'image',
        gallery: {
            enabled: true
        }
    });


    //===== Back to top

    // Show or hide the sticky footer button
    $(window).on('scroll', function (event) {
        if ($(this).scrollTop() > 600) {
            $('.back-to-top').fadeIn(200)
        } else {
            $('.back-to-top').fadeOut(200)
        }
    });


    //Animate the scroll to yop
    $('.back-to-top').on('click', function (event) {
        event.preventDefault();

        $('html, body').animate({
            scrollTop: 0,
        }, 1500);
    });


    //===== niceSelect js
    $('select').niceSelect();




    //===== product quantity

    $('.add').click(function () {
        if ($(this).prev().val()) {
            $(this).prev().val(+$(this).prev().val() + 1);
        }
    });
    $('.sub').click(function () {
        if ($(this).next().val() > 1) {
            if ($(this).next().val() > 1) $(this).next().val(+$(this).next().val() - 1);
        }
    });





    //===== 









});
