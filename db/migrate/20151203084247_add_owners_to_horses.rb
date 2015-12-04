class AddOwnersToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :owner_id, :integer
  end
end

