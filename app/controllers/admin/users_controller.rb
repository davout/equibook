class Admin::UsersController < Admin::ApplicationController
  active_scaffold :user do |config|
    config.columns = [:email, :admin, :created_at, :provider, :uid, :fb_image]
    config.update.columns = config.create.columns = [:email, :admin]
    config.show.columns = [:email, :admin, :created_at, :provider, :uid, :fb_image]
  end
end
