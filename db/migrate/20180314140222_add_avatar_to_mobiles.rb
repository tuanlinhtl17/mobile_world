class AddAvatarToMobiles < ActiveRecord::Migration[5.1]
  def change
    add_column :mobiles, :avatar, :string
  end
end
