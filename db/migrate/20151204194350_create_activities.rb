class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :horse_id
      t.integer :user_id
      t.datetime :start_at
      t.datetime :end_at
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
