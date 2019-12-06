class AppliedOffersMailer < ApplicationMailer
  
  def candidate_notification(mail_data)
    @mail_data = mail_data
    mail from: ENV['EMAIL_DEFAULT_DELIVER'], to: @mail_data[:user_email], subject: t('applied_offers_mailer.candidate_notification.subject')
  end

end
