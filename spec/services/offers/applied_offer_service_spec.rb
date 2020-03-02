require 'rails_helper'

RSpec.describe Offers::AppliedOfferService do
  let(:subject) { described_class }
  let!(:user)                  { create(:user) }
  let!(:new_curriculum)        { create(:curriculum_vitae, user_id: user.id) }
  let!(:offer)                 { create(:offer) }
  let!(:params)                { { offer_id: offer.id } }
  let!(:applied_offer_status) { create(:applied_offer_status, description: 'applied') }

  describe "#call" do
    context "when all data is correct" do
      it "Should return status ok" do
        create_applied_offer = subject.(user: user, params_offer: params)

        expect(AppliedOffer.count).to eq(1)
      end
    end
  end

  describe '#create_applied_offer' do
    context "when all data is correct" do
      
      it "Should create an applied offer" do
        total_data = params
          .merge(
            curriculum_vitae_id: new_curriculum.id,
            applied_offer_status_id: AppliedOfferStatus.find_by(description: 'applied').id,
            applied_date: DateTime.now
          )

        create_applied_offer = subject.create_applied_offer(total_data)

        expect(AppliedOffer.count).to eq(1)
      end
    end
  end

  describe '#applied_offer_verification' do
    context "when all data is correct" do
      let!(:applied_offer)        { create(:applied_offer, curriculum_vitae: new_curriculum) }

      it "Should return status ok and new state" do
        applied_offer_data = {
          applied_offer_id: applied_offer.id,
          offer_id: applied_offer.offer_id,
          curriculum_vitae_id: new_curriculum.id,
          action: "seen"
        }

        expect(applied_offer.current_state).to eq("unseen")

        response = subject.applied_offer_verification(applied_offer_data)
        
        expect(response).to eq({
          :status=>"ok",
          :new_state=>"seen"
        })

        expect(applied_offer.current_state).to eq("seen")

      end
    end

  end
end
