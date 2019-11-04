require "rails_helper"

RSpec.describe ApplyToOffersMailer, type: :mailer do

  describe "apply_offer" do
    let(:user) {create(:user, email: "soypepito@email.com")}
    let(:email) {ApplyToOffersMailer.apply_offer(user)}

    it "render the header" do

      expect(email.subject).to match(/!Aplicación a oferta¡/)
      expect(email.to).to eq([user.email])
      expect(email.from.last).to eq(ENV['EMAIL_DEFAULT_DELIVER'])

    end

    it "render the body" do

      expect(email.body.encoded).to match(/Hola mundo/)

    end

  end

end
