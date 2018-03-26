class AddSaleTimeToMobiles < ActiveRecord::Migration[5.1]
  def self.up
    add_column :mobiles, :sale_time, :datetime
    add_column :mobiles, :older_price, :integer
  end

  def self.down
    remove_column :mobiles, :sale_time, :datetime
    remove_column :mobiles, :older_price, :integer
  end
end
