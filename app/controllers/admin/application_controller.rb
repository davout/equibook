class Admin::ApplicationController < ApplicationController

  before_filter :ensure_admin

  layout 'admin'

  def ensure_admin
    (current_user && current_user.admin?) || redirect_to(root_path)
  end

  def set_title
    @title = "CavaConnect admin"
  end

end
