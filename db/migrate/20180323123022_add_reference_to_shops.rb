class AddReferenceToShops < ActiveRecord::Migration[5.1]
  def change
    add_reference :shops, :city, foreign_key: true
    add_reference :shops, :district, foreign_key: true
  end
end
