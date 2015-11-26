class Admin::HorsesController < Admin::ApplicationController
  active_scaffold :horse do |config|

    config.columns = [:name, :nick, :gender, :color, :birth, :height, :vet, :blacksmith, :dentist,
                      :osteopath, :blanket_size, :bridle_size, :horsebit_size, :strap_size, :comment]

    config.list.columns = [:name, :nick, :gender, :color, :birth]

    config.columns[:color].form_ui = :select
    config.columns[:color].actions_for_association_links = [:show]

    config.columns[:gender].form_ui = :select
    config.columns[:gender].actions_for_association_links = [:show]

    config.columns[:birth].form_ui = :date_picker
  end
end
