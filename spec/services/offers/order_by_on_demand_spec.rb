require "rails_helper"

RSpec.describe Offers::OrderByOnDemand do

  let!(:first_offer) { create(:offer) }
  let!(:second_offer) { create(:offer) }
  let!(:third_offer) { create(:offer) }

  let!(:first_offer_on_demand) { create(:offer_on_demand, offer: third_offer, start_at: Date.new(2020, 01, 10) ) }
  let!(:second_offer_on_demand) { create(:offer_on_demand, offer: second_offer, start_at: Date.new(2020, 02, 10) ) }


  describe "#call" do
    context "When exist offers on demand and normal offers" do
      it "Should return the offers on demand first" do
        expected_order = [
          second_offer,
          third_offer,
          first_offer
        ]

        expect(subject.(offers: Offer.all)).to match_array(expected_order)
      end
    end
  end

end