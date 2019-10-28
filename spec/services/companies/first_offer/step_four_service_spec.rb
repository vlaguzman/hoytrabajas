require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepFourService do
  let(:company) {create(:company) }

  let!(:offer)         {create(:offer) }
  let!(:contract_type) { create(:contract_type) }
  let!(:sex_1)         { create(:sex, description: "Male") }
  let!(:sex_2)         { create(:sex, description: "Female") }
  let!(:sex_3)         { create(:sex, description: "Undefined") }

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          id: offer.id,
          contract_type_id: contract_type.id,
          vacancies_quantity: '11',
          sex_ids: ["#{sex_1.id}, #{sex_2.id}, #{sex_3.id}"],
          offer_age_range: '18,24',
          close_date: '2020-12-31',
          immediate_start: false
        }
      end

      it "Should return a updated offer" do
        offer = subject.(company: company, update_params: params)

        expect(Offer.count).to eq(1)
        expect(AgeRange.count).to eq(1)

        expect(offer[:status]).to eq(:ok)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].contract_type_id).to eq(params[:contract_type_id])
        expect(offer[:data].vacancies_quantity).to eq(params[:vacancies_quantity].to_i)
        expect(offer[:data].sex_ids).to eq([sex_1.id, sex_2.id, sex_3.id])
        expect(offer[:data].close_date).to eq("Thu, 31 Dec 2020 00:00:00 -05 -05:00")
        expect(offer[:data].immediate_start).to eq(params[:immediate_start])

        age_range = AgeRange.find_by(offer_id: offer[:data].id)

        expect(age_range.from).to eq(18)
        expect(age_range.to).to eq(24)

        expect(offer[:error]).to eq(nil)
      end
    end

    context "when all data is not correct" do
      let(:params) do
        {
          id: offer.id,
          contract_type_id: contract_type.id,
          vacancies_quantity: '11',
          sex_ids: ["#{sex_1.id}, #{sex_2.id}, #{sex_3.id}"],
          offer_age_range: '18,24',
          close_date: '2020-12-31',
          immediate_start: true
        }
      end

      it "Should return a errors new offer" do
        offer = subject.(company: company, update_params: params)

        expect(Offer.count).to eq(1)
        expect(AgeRange.count).to eq(1)

        expect(offer[:status]).to eq(:ok)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:error]).to eq(nil)
      end
    end
  end
end
