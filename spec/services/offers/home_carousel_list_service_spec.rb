require "rails_helper"

RSpec.describe Offers::HomeCarouselListService do

  let(:subject) { described_class }

  describe "#call" do

    let(:cv_id) { create(:user).curriculum_vitae.id }

    let!(:developer_offer) { create(:offer, id: 1, status: 'active', created_at: DateTime.new(2020, 1, 3, 8) ) }
    let!(:techleader_offer) { create(:offer, id: 2, status: 'active', created_at: DateTime.new(2020, 5, 3, 8)) }

    let!(:stuffed_offers) do
      create(:offer, id: 3, status: 'active', created_at: DateTime.new(2020, 1, 13, 8) )
      create(:offer, id: 4, status: 'active', created_at: DateTime.new(2020, 2, 23, 11) )
      create(:offer, id: 5, status: 'active', created_at: DateTime.new(2020, 2, 23, 9) )
    end

    describe "applied offers exist"do

      let!(:developer_offer_applied) { create(:applied_offer,
        offer: developer_offer,
        curriculum_vitae_id: cv_id
      ) }

      let!(:techleader_offer_applied) { create(:applied_offer,
        offer: techleader_offer,
        curriculum_vitae_id: cv_id
      ) }

      context "when user ha applied to two offers" do
        it "should return the expected array" do
          expected_array = [4,5,3]

          expect(subject.(cv_id)).to eq(expected_array)
        end
      end

      context "when user ha applied to three offers, exist two offers on demand and one the user is applied" do
        let(:other_offer) { create(:offer, id: 7, status: 'active', created_at: DateTime.new(2020, 10, 1, 15)) }
        let(:extra_offer) { create(:offer, id: 6, status: 'active', created_at: DateTime.new(2019, 11, 20, 15)) }

        let!(:extra_offer_applied) { create(:applied_offer,
          offer: extra_offer,
          curriculum_vitae_id: cv_id
        ) }

        let!(:offer_on_demand_one) { create(:offer_on_demand, offer: other_offer) }
        let!(:offer_on_demand_two) { create(:offer_on_demand, offer: extra_offer) }

        it "should return the expected array" do
          expected_array = [7,4,5,3]

          expect(subject.(cv_id)).to eq(expected_array)
        end
      end
    end

    describe "applied offer does not exist" do
      let!(:other_offer) { create(:offer, id: 7, status: 'active', created_at: DateTime.new(2020, 1, 14, 15)) }
      let!(:extra_offer) { create(:offer, id: 6, status: 'active', created_at: DateTime.new(2019, 1, 13, 15)) }

      context "when exist two offers on demand" do

        let!(:offer_on_demand_one) { create(:offer_on_demand, offer: other_offer) }
        let!(:offer_on_demand_two) { create(:offer_on_demand, offer: extra_offer) }

        it "should return the expected array" do
          expected_array = [6, 7, 2, 4, 5, 3, 1]

          expect(subject.()).to eq(expected_array)
        end
      end

      context "when is not present user and not offers on demand" do
        it "should return the expected array" do
          expected_array = [2, 4, 5, 7, 3, 1, 6]

          expect(subject.()).to eq(expected_array)
        end
      end
    end
  end

end