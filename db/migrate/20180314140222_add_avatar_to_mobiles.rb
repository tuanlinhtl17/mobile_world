class AddAvatarToMobiles < ActiveRecord::Migration[5.1]
  def change
    add_column :mobiles, :avatar, :string
    add_column :mobiles, :hot_mobile, :string
  end
end
