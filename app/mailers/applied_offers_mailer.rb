class AppliedOffersMailer < ApplicationMailer

  FROM_DEFAULT = ENV['EMAIL_DEFAULT_DELIVER']

  def candidate_notification(mail_data)
    @mail_data = mail_data
    mail from: FROM_DEFAULT, to: mail_data[:user_email], subject: t('applied_offers_mailer.candidate_notification.subject')
  end

  def company_notification(mail_data)
    @mail_data = mail_data
    mail from: FROM_DEFAULT, to: mail_data[:company_email], subject: t('applied_offers_mailer.company_notification.subject')
  end
end
