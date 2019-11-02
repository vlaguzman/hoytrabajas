require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepThreeService do
  let(:company)  {create(:company) }

  let!(:job_category) { FactoryBot.create(:job_category) }
  let!(:offer_type)   { FactoryBot.create(:offer_type) }
  let!(:work_mode)    { FactoryBot.create(:work_mode) }

  let!(:work_position) { FactoryBot.create(:work_position) }

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          title: 'Oferta para el mejor desarrollador del mundo mundial',
          job_category_id: job_category.id,
          offer_type_id: offer_type.id,
          work_mode_id: work_mode.id,
          offers_work_positions: work_position.id
        }
      end

      it "Should return a new offer" do
        offer = subject.(company: company, params: params)

        expect(Offer.count).to eq(1)

        expect(offer[:status]).to eq(:ok)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].description).to eq(params[:description])

        expect(offer[:error]).to eq(nil)
      end
    end

    context "when all data is not correct" do
      let(:params) do
        {
          company_id: '',
          title: '',
          job_category_id: job_category.description,
          offer_type_id: offer_type.description,
          work_mode_id: work_mode.description,
          offers_work_positions: work_position.description
        }
      end

      it "Should return a errors new offer" do
        offer = subject.(company: company, params: params)

        expect(Offer.count).to eq(0)

        expect(offer[:status]).to eq(:error)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].errors.details).to eq({:title=>[{:error=>:blank}], :job_category=>[{:error=>:blank}]})
      end
    end
  end
end
