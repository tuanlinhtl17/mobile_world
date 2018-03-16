class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.string :color
      t.references :mobile, foreign_key: true

      t.timestamps
    end
  end
end
