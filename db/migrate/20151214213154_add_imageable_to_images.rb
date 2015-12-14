class AddImageableToImages < ActiveRecord::Migration
  def change

    drop_table :activities_images

    add_column :images, :imageable_id, :integer
    add_column :images, :imageable_type, :string

  end
end
