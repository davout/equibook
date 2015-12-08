#= require datepicker-fr

$.current_locale = $('html').attr('lang')

$.datepicker.log = (msg) ->
  console.log(msg)

default_opts = {}

# Add localisation properties
$.extend(default_opts, $.datepicker.regional[$.current_locale], {
  onSelect: (date_text, inst) ->
    showOn: 'button'
    buttonText: 'prout'
    selected_date = $(this).datepicker('getDate')
    if selected_date != null
      date_str = $.datepicker.formatDate('yy-mm-dd', selected_date)
      date_str = date_str + ' ' + ('0' + selected_date.getHours()).slice(-2)
      date_str = date_str + ':' + ('0' + selected_date.getMinutes()).slice(-2)
      $('#' + this.id.replace('_pretty', '')).val(date_str)

  controlType: 'select'
})

$.datepicker.setDefaults(default_opts)

$('input.datepicker').datepicker(default_opts)
$('input.datetimepicker').datetimepicker(default_opts)

