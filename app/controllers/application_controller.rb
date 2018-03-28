class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CartHelper

  before_action :set_locale
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :set_cookies

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  protect_from_forgery with: :exception

  def after_sign_in_path_for resource
    if resource.admin?
      rails_admin.dashboard_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password, :password_confirmation,
                  :address, :phone_number)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
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

  def set_cookies
    cookies[:current_user] = current_user ? true : false
  end
end
