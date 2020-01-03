require 'rails_helper'
  include ActiveJob::TestHelper

RSpec.describe Offers::UpdateOffersStatusDailyJob, type: :job do

  before { Timecop.freeze(Date.new(2020, 1, 1)) }
  after { Timecop.return }

  describe "#perform_later" do

    let(:subject) { described_class }

    it "should be enqueued the job" do
      ActiveJob::Base.queue_adapter = :test

      expect do
        subject.perform_later
      end.to have_enqueued_job
    end
  end

  describe "when the job executed" do

    let!(:offers) {
      [
        create(:offer, status: :preview, close_date: Date.new(2019, 10, 2)),
        create(:offer, status: :active, close_date: Date.new(2019, 12, 30)),
        create(:offer, status: :active, close_date: Date.new(2020, 4, 10)),
        create(:offer, status: :active, close_date: Date.new(2020, 10, 13)),
        create(:offer, status: :expired, close_date: Date.new(2019, 5, 2)),
        create(:offer, status: :expired, close_date: Date.new(2019, 2, 20))
      ]
    }

    let!(:active_offers) do
      [
        create(:offer_on_demand, status: 'up', start_at: Date.new(2019, 11, 1), finish_at: Date.new(2019, 11, 1)),
        create(:offer_on_demand, status: 'up', start_at: Date.new(2019, 10, 15), finish_at: Date.new(2019, 11, 1)),
        create(:offer_on_demand, status: 'up', start_at: Date.new(2019, 12, 20), finish_at: Date.new(2020, 1, 5)),
        create(:offer_on_demand, status: 'up', start_at: Date.new(2019, 12, 30), finish_at: Date.new(2020, 1, 15)),
        create(:offer_on_demand, status: 'up', start_at: Date.new(2020, 2, 15), finish_at: Date.new(2020, 3, 1))
      ]
    end

    it "Should change the status of the offer and offers on demand" do
      ActiveJob::Base.queue_adapter = :test

      subject.perform(limit_date: Date.today)

      expect(Offer.where(status: 'expired').count).to eq(4)
      expect(Offer.where(status: 'active').count).to eq(7)
      expect(OfferOnDemand.where(status: 'up').count).to eq(3)
      expect(OfferOnDemand.where(status: 'down').count).to eq(2)
    end
  end
end
