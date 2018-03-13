class CartsController < ApplicationController
  before_action :create_new_cart
  
  def create
    session[:cart] = @new_cart.data
  end

  def update
    session[:cart] = @new_cart.update_cart
  end

  def destroy
    session[:cart] = @new_cart.delete_item
  end
  
  def index
    @mobiles = Mobile.find @cart.map{|cart| cart["mobile_id"]}
  end
  
  private
  
  def create_new_cart
    @new_cart = CartForm.new params, @cart
  end
end
