class ApplyToOffersMailer < ApplicationMailer

  def apply_offer(user)
    @user = user
    mail from: "gestorgrupos@hoytrabajas.com", to: @user.email, subject: "¡Aplicación a oferta!"
  end

end
