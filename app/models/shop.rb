class Shop < ApplicationRecord
  has_many :shop_mobiles
  has_many :mobiles, through: :shop_mobiles
end
