class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in @user
    set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?

    @user.sign_in_count != 1 ? (redirect_to root_path) : (redirect_to edit_user_registration_path)
  end
end
