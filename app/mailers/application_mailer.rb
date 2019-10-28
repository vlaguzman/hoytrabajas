class ApplicationMailer < ActionMailer::Base
  default from: 'postmaster@sandbox103f2a692a724acaa2cc907d71deae36.mailgun.org'
  layout 'mailer'
end
