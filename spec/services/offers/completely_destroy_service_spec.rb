require "rails_helper"

RSpec.describe Offers::CompletelyDestroyService do

  let!(:offer_to_remove) { create(:offer) }
  let!(:offer_salary_to_remove) { create(:offer_salary, offer: offer_to_remove) }
  let!(:age_range_to_remove) { create(:age_range, offer: offer_to_remove) }
  let!(:required_experience_to_remove) { create(:offer_required_experiences, offer: offer_to_remove) }
  let!(:offer_on_demand_to_remove) { create(:offer_on_demand, offer: offer_to_remove) }

  describe "#call" do
    context "when recibe a offer id" do
      it "Should completely offer" do
        subject.(offer_id: offer_to_remove.id)

        expect(Offer.count).to be_zero
        expect(OfferSalary.count).to be_zero
        expect(OfferRequiredExperiences.count).to be_zero
        expect(OfferOnDemand.count).to be_zero
      end
    end
  end

end