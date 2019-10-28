class ApplyToOffersMailer < ApplicationMailer

  def new_apply_offer
    mail to: "gestorgrupos@hoytrabajas.com", subject: "¡Aplicación a oferta!"
  end

end
