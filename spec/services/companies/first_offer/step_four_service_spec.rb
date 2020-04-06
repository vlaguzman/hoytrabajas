require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepFourService do
  let(:company) {create(:company) }

  let!(:offer)         { create(:offer) }
  let!(:contract_type) { create(:contract_type) }
  let!(:sex_1)         { create(:sex, description: "Male") }
  let!(:sex_2)         { create(:sex, description: "Female") }
  let!(:sex_3)         { create(:sex, description: "Undefined") }
  let!(:age_1)         { create(:age_range_list) }
  let!(:age_2)         { create(:age_range_list) }

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          id: offer.id,
          contract_type_id: contract_type.id,
          vacancies_quantity: '11',
          sex_ids: ["#{sex_1.id}, #{sex_2.id}, #{sex_3.id}"],
          age_range_list_ids: ["#{age_1.id}, #{age_2.id}"],
          close_date: '2020-12-31',
          immediate_start: false
        }
      end

      it "Should return a updated offer" do
        offer = subject.(company: company, update_params: params)

        expect(Offer.count).to eq(1)

        expect(offer[:status]).to eq(:ok)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].contract_type_id).to eq(params[:contract_type_id])
        expect(offer[:data].vacancies_quantity).to eq(params[:vacancies_quantity].to_i)
        expect(offer[:data].sex_ids).to eq([sex_1.id, sex_2.id, sex_3.id])
        expect(offer[:data].age_range_list_ids).to eq([age_1.id, age_2.id])
        expect(offer[:data].close_date).to eq("Thu, 31 Dec 2020 00:00:00 -05 -05:00")
        expect(offer[:data].immediate_start).to eq(params[:immediate_start])

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
          age_range_list_ids: ["#{age_1.id}, #{age_2.id}"],
          close_date: '2020-12-31',
          immediate_start: true
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
