// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function () {

    $(".player").mb_YTPlayer();

});
tab1 = $('#favorites')
$(document).ready(function() {
$(".btn-pref .btn ").click(function () {
    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    if ($(this) == $("#stars")) {
      console.log("inside 1")
    $("#tab1").removeClass("fade in").addClass("fade in active");
    $("#tab2").removeClass("fade in active").addClass("fade in")
    $("#tab3").removeClass("fade in active").addClass("fade in")
    } // instead of this do the below
    else if ($(this) == $("#favorites")) {
      console.log("inside 2")
      $("#tab1").removeClass("fade in active").addClass("fade in");
      $("#tab2").removeClass("fade in").addClass("fade in active")
      $("#tab3").removeClass("fade in active").addClass("fade in");
    } // instead of this do the below
    else {
      console.log($(this))
    }
    $(this).removeClass("btn-default").addClass("btn-primary");

});
});
