class Admin::UsersController < Admin::ApplicationController
  active_scaffold :user do |config|
    config.columns = [:email, :admin, :created_at]
    config.update.columns = config.create.columns = [:email, :admin]
  end
end
