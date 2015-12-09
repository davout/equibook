class Admin::ApplicationController < ApplicationController

  before_filter :ensure_admin, :require_admin_assets

  layout 'admin'

  def ensure_admin
    (current_user && current_user.admin?) || redirect_to(root_path)
  end

  def set_title
    @title = "EquiBook admin"
  end

  def require_admin_assets
    @require_admin_assets = true
  end

end
