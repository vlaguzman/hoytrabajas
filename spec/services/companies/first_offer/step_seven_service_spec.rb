require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepSevenService do
  let!(:company)  { create(:company) }
  let!(:offer)    { create(:offer, company_id: company.id) }

  let!(:city)               { create(:city, description: "Buenos Aires")}
  let!(:educational_degree) { create(:educational_degree)}
  let!(:technical_skiil)    { create(:technical_skill)}
  let!(:duration_type)      { create(:duration_type)}
  let!(:language)           { create(:language)}
  let!(:level)              { create(:level)}

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          id: offer.id,

        }
      end

      it "Should return a updated offer" do
        offer = subject.(company: company, update_params: params)

        expect(Offer.count).to eq(1)

        expect(offer[:status]).to eq(:ok)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].responsibility_ids).to match_array(responsibility.id)
        expect(offer[:data].requirement_ids).to match_array(requirement.id)
        expect(offer[:data].vehicle_ids).to match_array(vehicle.id)
        expect(offer[:data].driving_licence_ids).to match_array(driving_licence.id)

        expect(offer[:error]).to eq(nil)
      end
    end

    context "when all data is not correct" do
      let(:params) do
        {
          id: offer.id,
          responsibility_ids: ["#{responsibility.id}"],
          requirement_ids:  ["#{requirement.id}"],
          vehicle_ids: ["#{vehicle.id}"],
          driving_licence_ids: ["#{driving_licence.id}"],
        }
      end

      it "Should return a errors new offer" do
        offer = subject.(company: company, update_params: params)

        expect(Offer.count).to eq(1)

        expect(offer[:status]).to eq(:ok)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:error]).to eq(nil)
      end
    end
  end
end
