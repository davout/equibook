class RichtextInput < SimpleForm::Inputs::Base

  def input(wrapper_options)
    input_html_options[:class] << wrapper_options[:class]
    input_html_options[:class] << 'text'

    @builder.text_area(attribute_name, input_html_options)
  end

end

