class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :value, default: 0
      t.integer :parent_id

      t.timestamps
    end
  end
end
