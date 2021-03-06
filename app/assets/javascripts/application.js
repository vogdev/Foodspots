// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap-material-design
//= require jquery_ujs
//= require data-confirm-modal
//= require turbolinks
//= require_tree .
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});
window.setTimeout(function() {
    $(".alert").fadeTo(2000, 500).slideUp(500, function(){
        $(this).remove(); 
    });
}, 4000);

// turbolinks:load makes this function runs in every page 
$(document).on('turbolinks:load', function() {
  $('#lunch-search').click(function (){
    if ($( window ).width() < 768) {
      $('#lunch-search').attr('data-toggle', 'collapse');
    }else if($( window ).width() > 767) {
      $('#lunch-search').removeAttr("data-toggle");
    };
   $('.search-bar').addClass("open");
   $('.search-bar').find('input[type="text"]').focus();
  }); 
  
  $('.close-search').click(function (){
   $('.search-bar').removeClass("open")
  });
  // remove the search bar if user clicked on Esc
  $(".search-bar").on('keyup', function (e) {
    if (e.keyCode == 27) {
     $('.search-bar').removeClass("open")
    }
  });

// console.log( "ready!" );
});