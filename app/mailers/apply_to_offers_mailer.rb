class ApplyToOffersMailer < ApplicationMailer
  
  def apply_offer(mail_data)
    @mail_data = mail_data
    mail from: ENV['EMAIL_DEFAULT_DELIVER'], to: @mail_data[:user_email], subject: t('.subject')
  end

end
