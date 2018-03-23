class Color < ApplicationRecord
  has_many :mobile_colors
  has_many :mobiles, through: :mobile_colors
end
