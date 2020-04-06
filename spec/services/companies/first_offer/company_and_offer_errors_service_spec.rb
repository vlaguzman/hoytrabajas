require 'rails_helper'

RSpec.describe Companies::FirstOffer::CompanyAndOfferErrorsService do
  let(:company) { create(:company, :first_time) }
  let(:offer) { create(:offer, company: company) }

  let(:update_params) do
    {
      industry_id: nil 
    }
  end

  describe "#call" do
    it "should add error to company model" do

      response = described_class.(company, update_params: update_params)

      expected_errors = {
        :industry_id=>[{:error=>:blank}]
      }

      expect(response.errors).to be_present
      expect(response.errors.details).to eq(expected_errors)
    end
  end

  context "when source is a offer" do
    let(:update_params) do
      {
        close_date: ''
      }
    end
    it "should return expected error" do
      response = described_class.(offer, update_params: update_params)
      expected_errors = {
        :close_date=>[{:error=>:blank}]
      }
      expect(response.errors).to be_present
      expect(response.errors.details).to eq(expected_errors)
    end
  end
end
