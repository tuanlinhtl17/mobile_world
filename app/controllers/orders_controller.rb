class OrdersController < ApplicationController
  before_action :check_cart, only: [:new, :create]
  before_action :authenticate_user!

  def new
    @order = current_user.orders.new
    @order.order_details.new
    @mobiles = Mobile.find @cart.map{|item| item["mobile_id"]}
  end

  def create
    nested_params = order_params.to_hash
    nested_params[:order_details_attributes] = @cart
    @order = current_user.orders.build nested_params
    if @order.save
      flash[:success] = t "flash.order_success"
      session[:cart] = nil
      redirect_to root_path
    else
      flash[:danger] = t "flash.order_error"
      redirect_to new_order_path
    end
  end

  def history
    if user_signed_in?
      @orders = current_user.orders.includes(:order_details)
    elsif user_signed_in?
      flash[:danger] = t "flash.login_history"
      redirect_to root_path
    end
  end

  private

  def check_cart
    return if @cart.present?
    redirect_to root_path
    flash[:danger] = t "flash.cart_nil"
  end

  def order_params
    params.require(:order).permit :name, :address, :phone_number
  end
end
