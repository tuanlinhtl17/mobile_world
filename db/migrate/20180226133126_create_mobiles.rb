class CreateMobiles < ActiveRecord::Migration[5.1]
  def change
    create_table :mobiles do |t|
      t.string :name
      t.integer :price
      t.integer :width
      t.integer :height
      t.integer :front_camera
      t.integer :behind_camera
      t.integer :weight
      t.integer :battery
      t.integer :resolution_width
      t.integer :resolution_height
      t.string :ram
      t.string :description
      t.text :review

      t.timestamps
    end
  end
end
