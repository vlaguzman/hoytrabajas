require "rails_helper"

RSpec.describe Offers::CarouselOffersService do

  describe "#call" do

    let!(:standard_one)   { create(:offer, created_at: Date.new(2020, 3, 1)) }
    let!(:standard_two)   { create(:offer, created_at: Date.new(2020, 3, 2)) }
    let!(:standard_three) { create(:offer, created_at: Date.new(2020, 3, 3)) }
    let!(:standard_four)  { create(:offer, created_at: Date.new(2020, 3, 4)) }
    let!(:standard_five)  { create(:offer, created_at: Date.new(2020, 3, 5)) }
    let!(:standard_six)   { create(:offer, created_at: Date.new(2020, 3, 6)) }
    let!(:standard_seven) { create(:offer, created_at: Date.new(2020, 3, 7)) }
    let!(:standard_eight) { create(:offer, created_at: Date.new(2020, 3, 8)) }
    let!(:standard_nine)  { create(:offer, created_at: Date.new(2020, 3, 9)) }
    let!(:standard_ten)   { create(:offer, created_at: Date.new(2020, 3, 10)) }

    let!(:on_demand_one)   { create(:offer_on_demand, offer: standard_eight ) }
    let!(:on_demand_two)   { create(:offer_on_demand, offer: standard_three ) }
    let!(:on_demand_three) { create(:offer_on_demand, offer: standard_five ) }

    let!(:cv) { create(:user).curriculum_vitae }

    let!(:apllied_offer_one) { create(:applied_offer, offer: standard_five, curriculum_vitae: cv) }
    let!(:apllied_offer_two) { create(:applied_offer, offer: standard_one, curriculum_vitae: cv) }

    let(:attributes_keys) { [
      :id,
      :title,
      :immediate_start,
      :description,
      :required_experience,
      :confidential,
      :job_category_image,
      :city,
      :salary,
      :company,
      :close_date,
      :on_demand,
      :affinity_percentage,
      :applied_offers,
      :raw_close_date
    ] }
    describe "receive parameters" do

      let(:search_result) { [
        standard_two.id,
        standard_three.id,
        standard_eight.id,
        standard_nine.id
      ] }

      context "when receive a cv" do
        it "should return expected object" do
          response = subject.(cv)

          expect(response).to be_an_instance_of Array
          expect(response.count).to eq(8)

          expect(response.last.keys).to match_array(attributes_keys)

          expected_ids = [
            standard_eight.id,
            standard_three.id,
            standard_ten.id,
            standard_nine.id,
            standard_seven.id,
            standard_six.id,
            standard_four.id,
            standard_two.id
          ]

          expect(response.pluck(:id)).to eq(expected_ids)
        end
      end

      context "when receive a search result" do
        it "should return expected object" do
          response = subject.(previous_results: search_result)

          expect(response).to be_an_instance_of Array
          expect(response.count).to eq(4)

          expected_ids = [
            standard_eight.id,
            standard_three.id,
            standard_two.id,
            standard_nine.id
          ]

          expect(response.pluck(:id)).to eq(expected_ids)

        end
      end

      context "when receive a limit " do
        it "should return expected object" do
          response = subject.(limit: 2)

          expect(response).to be_an_instance_of Array
          expect(response.count).to eq(5)

          expected_ids = [
            standard_eight.id,
            standard_five.id,
            standard_three.id,
            standard_ten.id,
            standard_nine.id
          ]

          expect(response.pluck(:id)).to eq(expected_ids)
        end
      end

    end
  end
end