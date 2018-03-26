class City < ApplicationRecord
  has_many :shops
  has_many :districts
  accepts_nested_attributes_for :districts
end
