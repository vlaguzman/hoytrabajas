require 'rails_helper'

RSpec.describe CompanyService do

  describe 'When company is premium' do

    describe '#up_offers_on_demands' do
      let!(:company) { create(:company) }
      let!(:offer_1)   { create(:offer, company: company) }
      let!(:offer_2)   { create(:offer, company: company) }

      it 'should create offer_on_demand and associate to each offer of company' do
        expect(OfferOnDemand.count).to eq(0)

        described_class.up_offers_on_demands(company)

        offer_on_demand = OfferOnDemand.find_by(offer_id: offer_1.id)

        expect(OfferOnDemand.count).to eq(2)

        expect(offer_on_demand.offer).to eq(offer_1)
        expect(offer_on_demand.status).to eq('up')
        expect(offer_on_demand.start_at.to_date).to eq(Time.now.to_date)
        expect(offer_on_demand.finish_at.to_date).to eq((Time.now + 10.days).to_date)
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
