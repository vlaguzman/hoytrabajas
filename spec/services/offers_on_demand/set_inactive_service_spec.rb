require "rails_helper"

RSpec.describe OffersOnDemand::SetInactiveService do

  before { Timecop.freeze(Date.new(2020, 1, 1)) }

  let!(:active_offers) do
    [
      create(:offer_on_demand, status: 'up', start_at: Date.new(2019, 11, 1), finish_at: Date.new(2019, 11, 1)),
      create(:offer_on_demand, status: 'up', start_at: Date.new(2019, 10, 15), finish_at: Date.new(2019, 11, 1)),
      create(:offer_on_demand, status: 'up', start_at: Date.new(2019, 12, 20), finish_at: Date.new(2020, 1, 5)),
      create(:offer_on_demand, status: 'up', start_at: Date.new(2019, 12, 30), finish_at: Date.new(2020, 1, 15)),
      create(:offer_on_demand, status: 'up', start_at: Date.new(2020, 2, 15), finish_at: Date.new(2020, 3, 1))
    ]
  end

  after { Timecop.return }

  describe "#call" do
    context "When the limit date is today" do
      it "should change the status of the on demand offers to down" do
        expect(OfferOnDemand.where(status: 'up').count).to eq(5)

        subject.()

        expect(OfferOnDemand.where(status: 'up').count).to eq(3)
        expect(OfferOnDemand.where(status: 'down').count).to eq(2)
      end
    end

    context "When offer on demand is empty" do
      let!(:demand_empty) { create(:offer_on_demand, :empty) }

      it "Should not change the state" do
        subject.()

        expect(demand_empty.status).to eq('up')
      end
    end
  end
end
