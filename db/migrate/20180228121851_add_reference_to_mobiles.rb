class AddReferenceToMobiles < ActiveRecord::Migration[5.1]
  def change
    add_reference :mobiles, :maker, foreign_key: true
  end
end
