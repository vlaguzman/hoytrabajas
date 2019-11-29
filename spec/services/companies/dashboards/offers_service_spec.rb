require 'rails_helper'

RSpec.describe Companies::Dashboards::OffersService do

  describe "#call" do
    let(:company) { create(:company) }

    context "When the company have zero offers created" do
      it "Should return a empty array" do
        expect(subject.(company)).to be_empty
      end
    end

    context "When company have ten offers created" do
      let!(:my_offers) { create_list(:offer, 5, company: company) }

      it "Should return a Array with the expected extruture and data" do
        response = subject.(company)

        expect(response).to_not be_empty
        expect(response.length).to eq(5)
      end
    end
  end
end