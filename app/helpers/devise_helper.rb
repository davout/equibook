module DeviseHelper

  include ApplicationHelper

  def devise_error_messages!
    error_messages!(resource)
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end

