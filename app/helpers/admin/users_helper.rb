module Admin::UsersHelper

  def fb_image_column(user, _column)
    user.fb_image && image_tag(user.fb_image, title: user.name, alt: user.name, class: 'fb_avatar')
  end

end
