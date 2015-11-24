class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :nick
      t.date :birth
      t.integer :height
      t.integer :gender_id
      t.integer :color_id
      t.string :dentist
      t.string :vet
      t.string :blacksmith
      t.string :osteopath
      t.integer :blanket_size
      t.integer :strap_size
      t.integer :horsebit_size
      t.integer :bridle_size
      t.text :comment

      t.timestamps null: false
    end
  end
end
