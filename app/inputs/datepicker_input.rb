class DatepickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)

    input_html_options[:class] << wrapper_options[:class]
    input_html_options[:class] << :picker_trigger
    input_type = self.class.to_s.underscore.split(/_/)[0].to_sym
    input_html_options[:class] -= [input_type]
    input_html_options[:value] = nil

    @builder.text_field("#{attribute_name}_pretty", input_html_options) + \
    @builder.text_field(attribute_name, class: ['hidden-picker', :invisible, input_type], value: field_value)
  end

  def format_string
    '%Y-%m-%d'
  end

  def field_value
    localize(@builder.object.send(attribute_name), format: format_string)
  end

end
