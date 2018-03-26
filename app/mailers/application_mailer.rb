class ApplicationMailer < ActionMailer::Base
  add_template_helper ApplicationHelper
  default from: "Mobile World"
  layout "mailer"
end
