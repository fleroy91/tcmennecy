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
	$('#slides1').slidesjs({
    width: 940,
    height: 280,
    navigation: true,
    start: 1,
    play: {
      auto: true,
    	pauseOnHover: true,
    	interval: 3500
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
    	interval: 2000
    }
  });

	nb_images = 4;
	index = parseInt(Math.random() * nb_images) + 1;
  $("body").css({
  	"background-image": "url('/assets/fond" + index + ".jpeg')"
  });
})
