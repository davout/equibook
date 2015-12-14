class AddImageAssociations < ActiveRecord::Migration
  def change
    create_table :activities_images, id: false do |t|
      t.integer :activity_id, null: false
      t.integer :image_id, null: false
    end

    add_index :activities_images, [:activity_id, :image_id], unique: true

    add_column :images, :user_id, :integer
  end
end
