require "rails_helper"

RSpec.describe Offers::Organizer::DetailsBuilder do

  describe "#call" do
    let!(:stuffed_offers)  { create_list(:offer, 1) }
    let!(:offer_on_demand) { create_list(:offer_on_demand, 2) }

    let(:offer_ids_lists) { Offers::Organizer::ListBuilder.() }

    context "when recibe a group list of offers" do
      it "should return a hash whith expected attributes" do
        response = subject.(offer_ids_lists: offer_ids_lists)

        expect(response[:on_demand_offer_ids_list].last).to be_an_instance_of Hash
        expect(response[:standard_offer_ids_list].last).to be_an_instance_of Hash

        expected_keys = [
          :title, :immediate_start, :description, :required_experience, :confidential,
          :offer, :id, :job_category_image, :city, :salary, :company, :close_date, :on_demand,
          :affinity_percentage, :applied_offers, :raw_close_date
        ]

        expect(response[:standard_offer_ids_list].last.keys).to match_array(expected_keys)
      end
    end
  end
end