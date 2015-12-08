#= require datepicker-fr

$.current_locale = $('html').attr('lang')

$.datepicker.log = (msg) ->
  console.log(msg)

default_opts = {}

# Add localisation properties
$.extend(default_opts, $.datepicker.regional[$.current_locale], {
  dateFormat: 'yy-mm-dd'
  timeFormat: 'HH:mm'
  onSelect: (date_text, inst) ->

    # Currently selected date object
    console.log($(this).datepicker('getDate'))

  controlType: 'select'
})

$.datepicker.setDefaults(default_opts)

console.log(default_opts)


$('.picker_trigger').click ->
  hidden_elt = $('#' + this.id.replace('_pretty', ''))
  #hidden_elt.left = 0
  #hidden_elt.top = 0
  console.log($(this).offset())

  console.log(hidden_elt)

  hidden_elt.offset = ->
    $(this).offset()

  console.log(hidden_elt.offset())
  hidden_elt.datepicker('show')

$('input.datepicker').datepicker(default_opts)
$('input.datetimepicker').datetimepicker(default_opts)

