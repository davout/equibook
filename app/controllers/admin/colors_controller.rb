class Admin::ColorsController < ApplicationController
  active_scaffold :color do |config|
    config.actions.exclude :show
    config.columns = [:name]
  end
end
