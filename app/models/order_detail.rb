class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :mobile
end
