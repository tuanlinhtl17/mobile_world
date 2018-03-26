class Shop < ApplicationRecord
  has_many :shop_mobiles
  has_many :mobiles, through: :shop_mobiles
  belongs_to :city
  belongs_to :district
  
  def self.find_shop shop_params
    shop = where(city_id: shop_params[:city_id], district_id: shop_params[:district_id])
    shop.map{|shop| shop.shop_mobiles.where(mobile_id: shop_params[:mobile_id])}
  end
end
