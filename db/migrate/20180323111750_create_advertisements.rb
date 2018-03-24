class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.references :maker, foreign_key: true
      t.integer :number_of_clicks, default: 0
      t.string :image

      t.timestamps
    end
  end
end
