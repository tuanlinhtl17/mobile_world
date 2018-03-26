class OrderMailer < ApplicationMailer
  def order_successful user
    @user = user
    @order = @user.orders.last
    mail to: @user.email, subject: t("mailers.order_mailer.order_success")
  end
end
