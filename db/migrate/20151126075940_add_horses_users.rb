class AddHorsesUsers < ActiveRecord::Migration
  def change
    create_table :horses_users, id: false do |t|
      t.integer :user_id
      t.integer :horse_id
    end
  end
end

