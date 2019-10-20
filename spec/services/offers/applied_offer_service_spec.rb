require 'rails_helper'

RSpec.describe Offers::AppliedOfferService do
  let(:subject) { described_class }

  describe "#call" do
    context "when all data is correct" do
      let(:new_curriculum)        { create(:curriculum_vitae) }
      let(:user)                  { create(:user) }
      let(:offer)                 { create(:offer) }
      let(:params)                { {offer_id: offer.id} }
      let!(:applied_offer_status) { create(:applied_offer_status, description: 'applied') }

      it "Should return status ok" do
        new_curriculum.user = user
        new_curriculum.save

        create_applied_offer = subject.(user: user, params_offer: params)

        expect(AppliedOffer.count).to eq(1)
        expect(create_applied_offer[:status]).to eq(:ok)
      end
    end

    context "when all data is not correct" do
      let(:user)                  { create(:user) }
      let(:offer)                 { create(:offer) }
      let(:params)                { {offer_id: offer.id} }
      let!(:applied_offer_status) { create(:applied_offer_status, description: 'applied') }

      it "Should return a error" do
        create_applied_offer = subject.(user: user, params_offer: params)

        expect(AppliedOffer.count).to eq(0)
        expect(create_applied_offer[:status]).to eq(:error)
      end
    end
  end
end
