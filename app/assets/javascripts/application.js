// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery-1.7.min
//= require jquery_ujs
//= require jquery.easing.1.3
//= require tms-0.3
//= require tms_presets
//= require cufon-yui
//= require jquery.slides.min
//= require Coolvetica_400.font
//= require Kozuka_M_500.font
//= require cufon-replace

$(window).load(function(){
  $("#header-subcontent").fadeIn('fast');
  $("section#page").fadeIn('fast');
	$('#slides1').slidesjs({
    width: 940,
    height: 280,
    navigation: true,
    start: 1,
    play: {
      auto: true,
    	pauseOnHover: true,
    	interval: 5000
    }
  });

	$('#slides2').slidesjs({
    width: 575,
    height: 70,
    navigation: true,
    start: 1,
    play: {
      auto: true,
    	pauseOnHover: true,
    	interval: 3000
    }
  });

  $("nav#menu ul li a[href='/reserver-un-court']").on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    window.open("https://adoc.app.fft.fr/adoc/", "_blank");
  });
  $("nav#menu ul li a[href='reserver-un-court/index.html']").on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    window.open("https://adoc.app.fft.fr/adoc/", "_blank");
  });
})
