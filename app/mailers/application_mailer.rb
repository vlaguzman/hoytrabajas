class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_DEFAULT_DELIVER']
  layout 'mailer'
end
