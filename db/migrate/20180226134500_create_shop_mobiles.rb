class CreateShopMobiles < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_mobiles do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
