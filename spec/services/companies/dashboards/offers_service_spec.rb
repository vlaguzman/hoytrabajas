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
      let!(:my_offers) { create_list(:offer, 5, company: company, status: Offer::OFFER_STATUS[2]) }

      it "Should return a Array with the expected extruture and data" do
        response = subject.(company)

        expect(response).to_not be_empty
        expect(response.length).to eq(5)

        response.each do |offer|
          expect(offer[:approved]).to be_truthy
        end
      end
    end

    context "when the offer isinactive" do
      let!(:my_unapproved_offer) { create(:offer, company: company, status: Offer::OFFER_STATUS[1]) }

      it "Should show the offer not approbed" do

        response = subject.(company)

        expect(response.last[:approved]).to be_falsy

      end
    end
  end
end