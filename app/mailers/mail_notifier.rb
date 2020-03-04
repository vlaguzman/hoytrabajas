class MailNotifier < ActionMailer::Base
  default from: ENV['HT_TECH_DELIVER_MAIL']

  def general_notification(action, message)
    @message = message

    mail(
      to: ENV['HT_TECH_EMAIL'],
      subject: t("mailers.#{action}.subject")
    )
  end
end
