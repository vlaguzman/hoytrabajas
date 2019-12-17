require 'rails_helper'

RSpec.describe CompanyService do

  describe 'When company is premium' do

    describe '#up_offers_on_demands' do
      let!(:company) { create(:company) }
      let!(:offer)   { create(:offer, company: company) }

      it 'should create offer_on_demand and associate to each offer of company' do
        expect(OfferOnDemand.count).to eq(0)

        described_class.up_offers_on_demands(company)

        offer_on_demand = OfferOnDemand.find_by(offer_id: offer.id)

        expect(OfferOnDemand.count).to eq(1)

        expect(offer_on_demand.offer).to eq(offer)
        expect(offer_on_demand.status).to eq('up')
        expect(offer_on_demand.start_at.strftime("%F")).to eq(Time.now.strftime("%F"))
        expect(offer_on_demand.finish_at.strftime("%F")).to eq((Time.now + 10.days).strftime("%F"))
      end
    end

    describe '#down_offers_on_demands' do
      let!(:company) { create(:company) }
      let!(:offer)   { create(:offer, company: company) }

      let!(:offer_on_demand) { create(:offer_on_demand, offer: offer, status: 'up') }

      it 'should update status of offer_on_demand to down and associate to each offer of company' do
        described_class.down_offers_on_demands(company)

        offer_on_demand = OfferOnDemand.find_by(offer_id: offer.id)

        expect(offer_on_demand.offer).to eq(offer)
        expect(offer_on_demand.status).to eq('down')
      end
    end
  end
end
