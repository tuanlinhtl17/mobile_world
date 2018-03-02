class AddReferenceToOrderDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_details, :order, foreign_key: true
    add_reference :order_details, :mobile, foreign_key: true
  end
end
