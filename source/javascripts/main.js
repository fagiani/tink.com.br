//= require jquery/dist/jquery
//= require popper.js/dist/umd/popper
//= require bootstrap/dist/js/bootstrap
//= require scrollmagic/scrollmagic/minified/ScrollMagic.min
//= require scrollmagic/scrollmagic/minified/plugins/debug.addIndicators.min


$(function() {
  var controller = new ScrollMagic.Controller();
  new ScrollMagic.Scene({
    offset: 90,
    triggerHook: 0,
    triggerElement: "body"
  }).setClassToggle(".topbar", "topbar-white")
  // .addIndicators()
  .addTo(controller);
});
