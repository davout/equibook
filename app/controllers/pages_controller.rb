class PagesController < ApplicationController

  skip_before_action :authenticate_user!

  def landing
    # This doesn't work apparently
    redirect_to(horses_path) if current_user
  end

end

