class Admin::GendersController < Admin::ApplicationController
  active_scaffold :gender do |config|
    config.columns.exclude :show
    config.columns = [:name]
  end
end
