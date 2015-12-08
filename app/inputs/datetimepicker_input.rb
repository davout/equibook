class DatetimepickerInput < DatepickerInput

  def pretty_format_string
    I18n.t('time.formats.default')
  end

end

