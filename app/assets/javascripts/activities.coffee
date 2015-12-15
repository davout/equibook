# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.activity .photograph-heap li img').each( ->
  rNum = Math.random() * 12 - 6
  $(this).css({
    'transform':  'rotate('+rNum+'deg)',
    'z-index':    '' + Math.floor(Math.random() * 100)
  })
)
