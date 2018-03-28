class SendEmailJob < ApplicationJob
  queue_as :default

  def perform user
    OrderMailer.order_successful(user).deliver
  end
end
