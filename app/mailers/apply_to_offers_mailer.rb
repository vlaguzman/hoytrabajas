class ApplyToOffersMailer < ApplicationMailer

  def apply_offer(user)
    @user = user
    mail from: ENV['EMAIL_DEFAULT_DELIVER'], to: @user.email, subject: t('.subject')
  end

end
