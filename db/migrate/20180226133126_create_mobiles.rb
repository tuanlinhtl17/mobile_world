class CreateMobiles < ActiveRecord::Migration[5.1]
  def change
    create_table :mobiles do |t|
      t.string :name
      t.integer :price
      t.string :color
      t.integer :width
      t.integer :height
      t.integer :font_camera
      t.integer :behind_camera
      t.integer :weight
      t.integer :battery
      t.integer :resolution_width
      t.integer :resolution_height
      t.string :description

      t.timestamps
    end
  end
end
