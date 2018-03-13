class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :total_money, default: 0
      t.string :address
      t.string :name
      t.string :phone_number
      t.integer :status, default: 0
      t.integer :payment_types, default: 0
      
      t.timestamps
    end
  end
end
