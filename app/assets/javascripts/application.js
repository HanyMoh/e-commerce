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

//= require jquery2
//= require jquery_ujs
//= require moment
//= require bootstrap-datetimepicker
//= require jquery_nested_form
//= require jquery.timepicker.js
//= require shared/underscore-min
//= require shared/bootstrap.min
//= require smooth-scroll.min
//= require shared/jquery.mCustomScrollbar.concat.min
//= require select2.full.min
//= require shared/bootstrap-datepicker.min
//= require shared/jquery.nice-select.min
//= require timedropper.min
//= require jquery.zoom.min
//= require shared/jquery.barrating.min
// require sweetalert.min
//= require bootstrap-sprockets
//= require vendor/jquery.bootstrap-touchspin.min
//= require vendor/jquery.nice-select.min
//= require vendor/multiple-select
//= require vendor/swiper.min
//= require vendor/wow.min

$(document).ready(function() {
  $('#id_of_search').keypress(function(e) {
    if (e.which == 13) {
      $(this).closest('form').submit();
    }
  });
});
