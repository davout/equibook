class Admin::UsersController < Admin::ApplicationController
  active_scaffold :user do |config|
    config.columns = [:email, :admin, :created_at, :provider, :uid, :fb_image]
    config.list.columns = [:email, :admin, :created_at, :provider, :fb_image]
    config.update.columns = config.create.columns = [:email, :admin]
    config.show.columns = [:email, :admin, :created_at, :provider, :uid, :fb_image]
    config.nested.add_link(:horses)
  end
end
