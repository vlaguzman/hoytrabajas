require "rails_helper"

RSpec.describe AppliedOffersMailer, type: :mailer do

  describe "candidate_notification" do
    let(:company) { create(:company, name: "La Empresita S.A.S.", email:"laempresita@empresita.com") }
    let(:user) { create(:user, name: "Eugenio", last_name: "Derbez", email: "eleugedb@email.com") }
    let(:offer) { create(:offer, title: 'Esta Oferta Es Maravillosa', company: company) }
    let(:mail_data) { {ofer_title: offer.title, user_name: user.name, user_last_name: user.last_name, company_name: company.name, user_email: user.email, company_email: company.email } }
    let(:email) {AppliedOffersMailer.candidate_notification(mail_data)}

    it "render the header" do

      expect(email.subject).to match(/!Aplicación a oferta¡/)
      expect(email.to.last).to eq(mail_data[:user_email])
      expect(email.from.last).to eq(ENV['EMAIL_DEFAULT_DELIVER'])

    end

    it "render the body" do

      expect(email.body.encoded).to match(/Has aplicado a la oferta/)

    end

  end

end
