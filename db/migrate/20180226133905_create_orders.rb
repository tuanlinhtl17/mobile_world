class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :total_money, default: 0
      t.string :address
      t.timestamps
    end
  end
end
