module ApplicationHelper

  def error_messages!(resource)
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation" class="alert alert-danger">
      <h3>#{sentence}</h3>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def user_link(user)
    link_to(user.name, '#')
  end

end
