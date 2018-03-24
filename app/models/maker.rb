class Maker < ApplicationRecord
  has_many :mobiles, dependent: :destroy
  has_many :advertisements, dependent: :destroy
end
