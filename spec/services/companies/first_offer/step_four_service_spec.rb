require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepFourService do
  let(:company)  {create(:company) }

  let!(:contract_type) { FactoryBot.create(:contract_type) }
  let!(:sex) { FactoryBot.create(:sex) }

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          contract_type_id: contract_type.id,
          vacancies_quantity: '11',
          sex_id: sex.id,
          offer_age_range: '18,24',
          close_date: '2020-12-31',
          inmediate_start: true
        }
      end

      it "Should return a updated offer" do
        offer = subject.(company: company, create_params: params)

        expect(Offer.count).to eq(1)

        expect(offer[:status]).to eq(:ok)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].contract_type_id).to eq(params[:contract_type_id])
        expect(offer[:data].vacancies_quantity).to eq(params[:vacancies_quantity])
        expect(offer[:data].sex_id).to eq(params[:sex_id])
        expect(offer[:data].inmediate_start).to eq(params[:inmediate_start])

        expect(offer[:error]).to eq(nil)
      end
    end

    context "when all data is not correct" do
      let(:params) do
        {
          contract_type_id: contract_type.id,
          vacancies_quantity: '11',
          sex_id: sex.id,
          offer_age_range: '18,24',
          close_date: '2020-12-31',
          inmediate_start: true
        }
      end

      it "Should return a errors new offer" do
        offer = subject.(company: company, create_params: params)

        expect(Offer.count).to eq(0)

        expect(offer[:status]).to eq(:error)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].errors.details).to eq({:title=>[{:error=>:blank}], :job_category=>[{:error=>:blank}]})
      end
    end
  end
end
