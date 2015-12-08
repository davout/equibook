class DatepickerInput < SimpleForm::Inputs::Base

  def input(wrapper_options)
    input_html_options[:class] << wrapper_options[:class]
    input_html_options[:value] = pretty_field_value
    @builder.text_field("#{attribute_name}_pretty", input_html_options) + \
    @builder.hidden_field(attribute_name)
  end

  def raw_format_string
    '%Y-%m-%d'
  end

  def pretty_format_string
    I18n.t('date.formats.default')
  end

  def pretty_field_value
    field_value(pretty_format_string)
  end

  def field_value(format_str)
    @builder.object.send(attribute_name) && 
      localize(@builder.object.send(attribute_name), format: format_str)
  end

end
