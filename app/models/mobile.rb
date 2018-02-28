class Mobile < ApplicationRecord
  has_many :order_details
  has_many :shop_mobiles
  has_many :images
  has_many :comments
  belongs_to :maker
end
