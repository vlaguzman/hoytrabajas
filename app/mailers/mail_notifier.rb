class MailNotifier < ActionMailer::Base
  default from: ENV['HT_TECH_DELIVER_MAIL']

  def general_notification(message)
    @message = message

    mail(
      to: ENV['HT_TECH_EMAIL'],
      subject: t('mailers.dailly_update_offers.subject')
    )
  end
end