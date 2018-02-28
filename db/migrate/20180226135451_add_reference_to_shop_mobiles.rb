class AddReferenceToShopMobiles < ActiveRecord::Migration[5.1]
  def change
    add_reference :shop_mobiles, :shop, foreign_key: true
    add_reference :shop_mobiles, :mobile, foreign_key: true
  end
end
