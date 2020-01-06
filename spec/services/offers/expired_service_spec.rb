require "rails_helper"

RSpec.describe Offers::ExpiredService do

  before { Timecop.freeze(Date.new(2020, 1, 1)) }

  let!(:active_offers) {
    [
      create(:offer, status: :preview, close_date: Date.new(2019, 10, 2)),
      create(:offer, status: :active, close_date: Date.new(2019, 12, 30)),
      create(:offer, status: :active, close_date: Date.new(2020, 4, 10)),
      create(:offer, status: :active, close_date: Date.new(2020, 10, 13)),
    ]
  }

  let!(:expired_offers) {
    [
      create(:offer, status: :expired, close_date: Date.new(2019, 5, 2)),
      create(:offer, status: :expired, close_date: Date.new(2019, 2, 20))
    ]
  }

  after { Timecop.return }

  describe "#call" do
    context "When offers close date is out of time" do
      it "should change the status of the offer to 'expired'" do
        expect(Offer.where(status: 'expired').count).to eq(2)
        expect(Offer.where(status: 'active').count).to eq(3)

        response = subject.(limit_date: Date.today)

        expect(Offer.where(status: 'expired').count).to eq(4)
        expect(Offer.where(status: 'active').count).to eq(2)
      end
    end

    context "When close date is nil" do
      let!(:empty_offer) { create(:offer, :empty) }

      it "should not change the state" do
        response = subject.(limit_date: Date.today)

        expect(empty_offer.status).to eq('active')
      end
    end
  end
end