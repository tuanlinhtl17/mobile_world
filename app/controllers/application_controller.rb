class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CartHelper
  before_action :set_locale
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password, :password_confirmation, 
                  :address, :phone_number)
    end
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def set_cart
    if session[:cart].present?
      @cart = session[:cart]
    else
      @cart = []
    end
  end
end
