class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale, :authenticate_user!, :set_title

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def set_title
    @title = "EquiBook"
  end

  def after_sign_in_path_for(resource)
    # Make sure we won't be redirecting users to the sign in page after they correctly
    # authenticate with Facebook
    omniauth_origin = request.env['omniauth.origin'] unless (request.env['omniauth.origin'] == new_user_session_url)

    omniauth_origin || stored_location_for(resource) || horses_path
  end

end
