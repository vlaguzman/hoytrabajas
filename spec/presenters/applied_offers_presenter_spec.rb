require "rails_helper"

RSpec.describe AppliedOffersPresenter do
  let(:company) { create(:company, name: "lA EMPRESITA s.A.S.", email:"laempresita@empresita.com") }
  let(:user) { create(:user, name: "EuGeNiO", last_name: "DeRbeZ", email: "eleugedb@email.com") }
  let(:offer) { create(:offer, title: 'esto deberia estar capitalizado', company: company) }
  let(:subject){ described_class.new(offer, user: user) }

  describe "#mail_data" do
    it { should respond_to(:mail_data) }

    it "should hash for data necessary to send/construct mails" do
      response = subject.mail_data

      expected_response = {
        offer_title:     "Esto Deberia Estar Capitalizado",
        user_full_name:  "Eugenio Derbez",
        company_name:    "La Empresita S.A.S",
        user_email:      "eleugedb@email.com",
        company_email:   "laempresita@empresita.com"
      }

      expect(response).to eq(expected_response)
    end
  end
end
