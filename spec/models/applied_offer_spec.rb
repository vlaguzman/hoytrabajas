require 'rails_helper'

RSpec.describe AppliedOffer, type: :model do

  describe "validations" do
    it { should validate_presence_of(:applied_date) }
    it { should validate_presence_of(:offer_id) }
    it { should validate_presence_of(:curriculum_vitae_id) }
    it { should validate_presence_of(:applied_offer_status_id) }

    it "should reject duplicate curriculum_vitae in the same offer" do
      user = FactoryBot.create(:user)
      offer = FactoryBot.create(:offer)
      job_application = FactoryBot.create(:applied_offer, offer: offer, curriculum_vitae: user.curriculum_vitae, applied_date: DateTime.now )
      duplicate_job_application = AppliedOffer.new(offer: offer, curriculum_vitae: user.curriculum_vitae, applied_date: DateTime.now )

      expect(duplicate_job_application).to_not be_valid
      expect(duplicate_job_application.errors[:curriculum_vitae_id]).to include("Un candidato solo puede aplicar una vez a cada oferta")
    end
  end

  describe "associoations" do
    it { should belong_to(:offer) }
    it { should belong_to(:curriculum_vitae) }
    it { should belong_to(:applied_offer_status) }
  end

  describe "#state_machine" do
    let!(:company) { create(:company) }
    let!(:user) { create(:user) }
    let!(:applied_offer) { create(:applied_offer, curriculum_vitae_id: user.curriculum_vitae.id, applied_date: DateTime.now )}
    
    context "when the applied offer is unseen" do
      it "should update state to seen" do
        expect(applied_offer.state_machine.current_state).to eq("unseen")

        applied_offer.state_machine.transition_to(:seen)

        expect(applied_offer.state_machine.current_state).to eq("seen")
      end
    end

    context "when the applied offer is seen" do
      it "should update state to interested" do
        applied_offer.state_machine.transition_to(:seen)
        expect(applied_offer.state_machine.current_state).to eq("seen")
        
        applied_offer.state_machine.transition_to(:interested)
        expect(applied_offer.state_machine.current_state).to eq("interested")
      end

      it "should update state to not_interested" do
        applied_offer.state_machine.transition_to(:seen)
        expect(applied_offer.state_machine.current_state).to eq("seen")
        
        applied_offer.state_machine.transition_to(:not_interested)
        expect(applied_offer.state_machine.current_state).to eq("not_interested")
      end
    end

    context "when the applied offer is interested" do
      it "should update state to not_interested" do
        applied_offer.state_machine.transition_to(:seen)
        expect(applied_offer.state_machine.current_state).to eq("seen")
        
        applied_offer.state_machine.transition_to(:interested)
        expect(applied_offer.state_machine.current_state).to eq("interested")

        applied_offer.state_machine.transition_to(:not_interested)
        expect(applied_offer.state_machine.current_state).to eq("not_interested")
      end
    end

    context "when the applied offer is not_interested" do
      it "should update state to interested" do
        applied_offer.state_machine.transition_to(:seen)
        expect(applied_offer.state_machine.current_state).to eq("seen")

        applied_offer.state_machine.transition_to(:not_interested)
        expect(applied_offer.state_machine.current_state).to eq("not_interested")

        applied_offer.state_machine.transition_to(:interested)
        expect(applied_offer.state_machine.current_state).to eq("interested")
      end
    end
  end
end
