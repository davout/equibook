# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.activity .photograph-heap li img').each( ->
  random_angle = Math.random() * 10 - 5
  $(this).css({
    'transform':  'rotate(' + random_angle + 'deg)',
    'z-index':    Math.floor(Math.random() * 100)
  })
)
