require 'rails_helper'

RSpec.describe Offers::OrderByAffinityPercentage do

  # Contracts
  let(:temporal_contract) { create(:contract_type) }
  let(:undefined_contract) { create(:contract_type) }

  let(:offer) { create(:offer,
    contract_type: temporal_contract
  ) }

  let(:candidate) { create(:user,
    contract_type: temporal_contract
  ) }

  describe "#call" do
    context "When recibe a list of offers and a current user" do
      it "Should return an array ordered by affinity %" do
        byebug

        response = subject.(current_user: candidate, offers: Offer.all)


        expected_offers_list = []

        expect(response).to eq(expected_offers_list)
      end
    end

    context "When does not recibe recibe params" do
      it "Should return a empty array" do
      end
    end

    context "When only recibe a offers list and not current user" do
      it "should return the offers in the same order" do
        

      end
    end

  end

end