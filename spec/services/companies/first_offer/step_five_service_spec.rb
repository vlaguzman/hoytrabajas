require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepFiveService do
  let(:company)       {create(:company) }
  let(:offer)         { create(:offer) }
  let(:currency)      { create(:currency, description: "COP") }
  let(:salary_period) { create(:salary_period, description: "Diario") }

  let(:available_work_day) { create(:working_days, description: "Lunes a Viernes") }
  let(:working_day)        { create(:working_days, description: "Mañana (7am-12pm)") }
  let(:job_aids)           { create(:job_aids, description: "Aux de transporte") }

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          currency_id:      currency.id,
          salary_period_id: salary_period.id,
          from:             '750.000',
          to:               '950.000',
          is_range:         true,
          available_work_day_ids: ["#{available_work_day.id}"],
          working_day_ids:        ["#{working_day.id}"],
          job_aid_ids:            ["#{job_aid.id}"]
        }
      end

      it "Should return a updated offer" do
        offer = subject.(company: company, update_params: params)

        expect(Offer.count).to eq(1)

        expect(offer[:status]).to eq(:ok)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].currency_id).to eq(params[:currency_id])
        expect(offer[:data].salary_period_id).to eq(params[:salary_period_id])
        expect(offer[:data].salary_from).to eq(params[:from])
        expect(offer[:data].salary_to).to eq(params[:to])
        expect(offer[:data].offer_salary.is_range).to eq(params[:is_range])
        expect(offer[:data].available_work_day_ids).to match_array([available_work_day.id])
        expect(offer[:data].working_day_ids).to match_array([working_day.id])
        expect(offer[:data].job_aid_ids).to match_array([job_aid.id])

        expect(offer[:error]).to eq(nil)
      end
    end

    context "when all data is not correct" do
      let(:params) do
        {
          currency_id:      currency.id,
          salary_period_id: salary_period.id,
          from:             '750.000',
          to:               '950.000',
          is_range:         true,
          available_work_day_ids: ["#{available_work_day.id}"],
          working_day_ids:        ["#{working_day.id}"],
          job_aid_ids:            ["#{job_aid.id}"]
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
