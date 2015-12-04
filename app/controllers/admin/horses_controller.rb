class Admin::HorsesController < Admin::ApplicationController
  active_scaffold :horse do |config|

    config.columns = [:name, :nick, :owner, :gender, :color, :birth, :height, :category, :vet, :blacksmith, :dentist,
                      :osteopath, :blanket_size, :bridle_size, :horsebit_size, :strap_size, :comment]

    config.list.columns = [:name, :nick, :gender, :category, :color, :birth]

    config.update.columns.exclude :category
    config.create.columns.exclude :category

    config.columns[:color].form_ui = :select
    config.columns[:color].actions_for_association_links = [:show]

    config.columns[:gender].form_ui = :select
    config.columns[:gender].actions_for_association_links = [:show]

    config.columns[:owner].form_ui = :select
    config.columns[:owner].actions_for_association_links = [:show]

    config.columns[:birth].form_ui = :date_picker

    config.nested.add_link(:activities)

  end
end

