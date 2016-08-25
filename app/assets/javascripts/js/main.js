jQuery(window).on("load resize scroll",function(e){
    "use strict";

/* ===========================================================
-------------------------- Blog filter -----------------------
=========================================================== */
var jQuerycontainer = jQuery('#masonry')
jQuerycontainer.isotope({
    layoutMode: 'masonry',
    transitionDuration: '.8s',
    hiddenStyle: {
        opacity: 0,
        transform: 'perspective(100em) scale(0.2) rotateX(180deg)'
    },
    visibleStyle: {
        opacity: 1,
        transform: 'perspective(100em) scale(1) rotateX(0)'
    },
    masonry: {
        columnWidth: '.masonry'
    }
});
jQuery('.filters a').on("click", function(){
    jQuery('.select-filter').removeClass('select-filter');
    jQuery(this).parent('li').addClass('select-filter');
    var selector = jQuery(this).attr('data-filter');
    jQuerycontainer.isotope({ filter: selector });
    return false;
});
});

jQuery(document).ready(function() {
    "use strict";
/* ===========================================================
----------------------- Page Preloader -----------------------
=========================================================== */
jQuery(window).load(function() {
    jQuery('.preloader').fadeOut();
    jQuery('#wrapper').css('opacity', '1').fadeIn();
});
/* ===========================================================
-------------------------- Side Menu -------------------------
=========================================================== */
jQuery("#menu-toggle").click(function(e) {
    e.preventDefault();
    jQuery("#wrapper").toggleClass("toggled");
});

jQuery('.drilldown').drilldown();

/* ===========================================================
------------------------- Page Banner ------------------------
=========================================================== */
var bannerheight = jQuery(window).height();
var blogimage = jQuery(window).height()/2 + 80;
jQuery('.page-header,.post-image').css('height',bannerheight);
jQuery('.post-image.half').css('height',blogimage);

jQuery(window).resize(function(){
    jQuery('.page-header,.post-image').css('height',bannerheight);
    jQuery('.post-image.half').css('height',blogimage);
});

/* ===========================================================
--------------------- Embed Youtube video --------------------
=========================================================== */
jQuery(".yt_container").prettyEmbed({
// videoID: 'BFVROcHReU0',
previewSize: "hd",
customPreviewImage: "",
showInfo: false,
showControls: true,
loop: false,
colorScheme: "dark",
showRelated: false,
useFitVids: true
});

/* ===============================================
--------------------- Fitvids --------------------
=============================================== */
jQuery(".video-thumb").fitVids();

/* ===========================================================
--------------------- Embed Vimeo video ----------------------
=========================================================== */
jQuery('.video-thumb').smartVimeoEmbed();

/* ======================================================
--------------------- Sticky Sidebar --------------------
======================================================= */

jQuery('.main-sidebar').theiaStickySidebar({
    additionalMarginTop: 30
});
/* =======================================================
--------------------- Owl post slider --------------------
======================================================= */
jQuery(".owl-post").owlCarousel({
navigation : false, // Show next and prev buttons
slideSpeed : 300,
paginationSpeed : 400,
singleItem:true,
autoPlay:true,
responsiveRefreshRate:700
});

/* ===================================================
--------------------- Flex Slider --------------------
==================================================== */
jQuery('.home-slide').flexslider({
    animation: "fade",
    slideDirection: "horizontal",
    directionNav: true,
    touch: true,
    slideshow: true,
    prevText: ["<i class='fa fa-angle-left'></i>"],
    nextText: ["<i class='fa fa-angle-right'></i>"],
});

/* ================================================================
--------------------- Breadcrumb Banner SLider --------------------
================================================================ */
jQuery("#breadcrumb-banner.backstretched").backstretch(["images/1.jpg", "images/3.jpg", "images/5.jpg", ], {
    duration: 6000,
    fade: 1200
});

/* =================================================
--------------------- Scroll up --------------------
================================================= */
jQuery.scrollUp({
scrollName: 'scrollUp', // Element ID
scrollDistance: 300, // Distance from top/bottom before showing element (px)
scrollFrom: 'top', // 'top' or 'bottom'
scrollSpeed: 300, // Speed back to top (ms)
easingType: 'linear', // Scroll to top easing (see http://easings.net/)
animation: 'fade', // Fade, slide, none
animationSpeed: 200, // Animation in speed (ms)
scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
//scrollTarget: false, // Set a custom target element for scrolling to the top
scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
scrollTitle: false, // Set a custom <a> title if required.
scrollImg: false, // Set true to use image
activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
zIndex: 2147483647 // Z-Index for the overlay
});

/* ===========================================================
--------------------- Working Contact Form -------------------
=========================================================== */
var submitContact = jQuery('#submit-message'),
message = jQuery('#msg');

submitContact.on('click', function(e){
    e.preventDefault();

    var jQuerythis = jQuery(this);

    jQuery.ajax({
        type: "POST",
        url: 'contact.php',
        dataType: 'json',
        cache: false,
        data: jQuery('#contact-form').serialize(),
        success: function(data) {

            if(data.info !== 'error'){
                jQuerythis.parents('form').find('input[type=text],input[type=email],textarea,select').filter(':visible').val('');
                message.hide().removeClass('success').removeClass('error').addClass('success').html(data.msg).fadeIn('slow').delay(3000).fadeOut('slow');
            } else {
                message.hide().removeClass('success').removeClass('error').addClass('error').html(data.msg).fadeIn('slow').delay(3000).fadeOut('slow');
            }
        }
    });
});
});
