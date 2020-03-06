require 'rails_helper'

RSpec.describe AffinityPercentage, type: :model do

  describe "associations" do
    it { should belong_to(:offer) }
    it { should belong_to(:curriculum_vitae) }
  end

  describe "class methods" do
    describe "#get_last" do
      let!(:offer)            { create(:offer)}
      let!(:curriculum_vitae) { create(:curriculum_vitae)}

      context "when affinity percentage exist" do
        let!(:affinity_percentage_1) { create(:affinity_percentage, offer_id: offer.id, curriculum_vitae_id: curriculum_vitae.id)}
        let!(:affinity_percentage_2) { create(:affinity_percentage, offer_id: offer.id, curriculum_vitae_id: curriculum_vitae.id)}

        it "should return last object related" do
          expect(AffinityPercentage.get_last(offer.id, curriculum_vitae.id).id).to eq(affinity_percentage_2.id)
        end
      end

      context "when affinity percentage does not exist" do
        it "should return nil" do
          expect(AffinityPercentage.get_last(offer.id, curriculum_vitae.id)).to be_nil
        end
      end
    end
  end
end
