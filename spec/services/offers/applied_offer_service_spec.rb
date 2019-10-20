require 'rails_helper'

RSpec.describe Offers::AppliedOfferService do
  let(:subject) { described_class }

  describe "#call" do
    context "when all data is correct" do
      let(:user)                  { create(:user) }
      let!(:new_curriculum)        { create(:curriculum_vitae, user_id: user.id) }
      let(:offer)                 { create(:offer) }
      let(:params)                { {offer_id: offer.id} }
      let!(:applied_offer_status) { create(:applied_offer_status, description: 'applied') }

      it "Should return status ok" do
        create_applied_offer = subject.(user: user, params_offer: params)

        expect(AppliedOffer.count).to eq(1)
      end
    end
  end
end
