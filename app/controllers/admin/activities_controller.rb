class Admin::ActivitiesController < Admin::ApplicationController

  active_scaffold :activity do |config|
    config.columns = [:title, :user, :start_at, :end_at, :description]
    config.list.columns = [:title, :user, :start_at, :end_at]

    config.columns[:user].form_ui = :select
  end

end
