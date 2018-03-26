class ShopsController < ApplicationController
  def create
    @shop_mobiles = Shop.find_shop params[:shop]
    respond_to do |format|
      format.js
    end
  end
end
