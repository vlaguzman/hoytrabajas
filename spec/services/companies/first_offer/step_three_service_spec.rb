require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepThreeService do
  let(:company)  {create(:company) }

  let!(:job_category) { create(:job_category) }
  let!(:offer_type)   { create(:offer_type) }
  let!(:work_mode)    { create(:work_mode) }

  let!(:work_position) { create(:work_position) }

  it { should be_an_instance_of(Module) }

  describe "#call" do

    describe "when offer exists" do
      let!(:offer) { create(:offer) }
      context "when all data is correct" do
        let(:params) do
          {
            id: offer.id,
            title: 'Oferta para el mejor desarrollador del mundo mundial',
            job_category_ids: "#{job_category.id}",
            offer_type_id: offer_type.id,
            work_mode_id: work_mode.id,
            offers_work_positions: work_position.id,
            job_category_image: 'https://url.image.com/'
          }
        end

        it "Should return a new offer" do
          offer = subject.(company: company, params: params)

          expect(Offer.count).to eq(1)

          expect(offer[:status]).to eq(:ok)

          expect(offer[:data]).to be_an_instance_of(Offer)

          expect(offer[:data].title).to eq(params[:title])
          expect(offer[:data].job_category_ids).to match_array(job_category.id)
          expect(offer[:data].offer_type_id).to eq(params[:offer_type_id])
          expect(offer[:data].job_category_image).to eq('https://url.image.com/')

          expect(offer[:error]).to eq(nil)
        end
      end

      context "when all data is not correct" do
        let(:params) do
          {
            id: offer.id,
            company_id: '',
            title: '',
            description: '',
            job_category_ids: "#{job_category.id}",
            offer_type_id: offer_type.id,
            work_mode_id: work_mode.id,
            offers_work_positions: work_position.id
          }
        end

        it "Should return a errors new offer" do
          offer = subject.(company: company, params: params)

          expect(Offer.count).to eq(1)

          expect(offer[:status]).to eq(:error)

          expect(offer[:data]).to be_an_instance_of(Offer)

          expect(offer[:data].errors.details).to eq({
            :description => [{:error=>:blank}],
            :title=>[{:error=>:blank}, {:count=>3, :error=>:too_short}]
          })
        end
      end
    end

    describe "when offer not exists" do
      context "when all data is correct" do
        let(:params) do
          {
            title: 'Oferta para el mejor desarrollador del mundo mundial',
            description: 'una oferta que no te puedes perder',
            job_category_ids: "#{job_category.id}",
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
            description: '',
            job_category_ids: "#{job_category.id}",
            offer_type_id: offer_type.id,
            work_mode_id: work_mode.id,
            offers_work_positions: work_position.id
          }
        end

        it "Should return a errors new offer" do
          offer = subject.(company: company, params: params)

          expect(Offer.count).to eq(0)

          expect(offer[:status]).to eq(:error)

          expect(offer[:data]).to be_an_instance_of(Offer)

          expect(offer[:data].errors.details).to eq({
            :description => [{:error=>:blank}],
            :title => [{:error=>:blank}, {:count=>3, :error=>:too_short}]
          })
        end
      end
    end
  end
end
