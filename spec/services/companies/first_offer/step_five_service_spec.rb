require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepFiveService do
  let!(:company)  { create(:company) }
  let!(:offer)    { create(:offer, company_id: company.id) }
  let!(:currency) { create(:currency) }
  let!(:job_aid)  { create(:job_aid) }

  let!(:working_day)        { create(:working_day) }
  let!(:salary_period)      { create(:salary_period) }
  let!(:available_work_day) { create(:available_work_day) }


  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          id:               offer.id,
          is_range:         true,
          currency_id:      currency.id,
          from:             '750000',
          to:               '950000',
          salary_period_id: salary_period.id,
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

        expect(offer[:data].offer_salary.is_range).to eq(true)
        expect(offer[:data].salary_currency_id).to eq(currency.id)
        expect(offer[:data].salary_period_id).to eq(salary_period.id)
        expect(offer[:data].salary_from).to eq(750000)
        expect(offer[:data].salary_to).to eq(950000)

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
