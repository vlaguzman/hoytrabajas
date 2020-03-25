require "rails_helper"

RSpec.describe Offers::Organizer::ListBuilder do

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

    context "when receive curriculum vitae" do
      it "should return the two list and remove offer when user applie" do

        response = subject.(cv)

        expeted_response = {
          on_demand_offer_ids_list: [
            standard_eight.id,
            standard_three.id
          ],
          standard_offer_ids_list: [
            standard_ten.id,
            standard_nine.id,
            standard_seven.id,
            standard_six.id,
            standard_four.id,
            standard_two.id
          ]
        }

        expect(response).to eq(expeted_response)

      end
    end

    context "when receive limit" do
      it "should return limited lists" do

        response = subject.(limit: 3)

        expeted_response = {
          on_demand_offer_ids_list: [
            standard_eight.id,
            standard_five.id,
            standard_three.id
          ],
          standard_offer_ids_list: [
            standard_ten.id,
            standard_nine.id
          ]
        }

        expect(response).to eq(expeted_response)

      end
    end

    context "when not receive curriculum vitae" do
      it "should return the two list and remove offer when user applie" do

        response = subject.()

        expeted_response = {
          on_demand_offer_ids_list: [
            standard_eight.id,
            standard_five.id,
            standard_three.id
          ],
          standard_offer_ids_list: [
            standard_ten.id,
            standard_nine.id,
            standard_seven.id,
            standard_six.id,
            standard_four.id,
            standard_two.id,
            standard_one.id
          ]
        }

        expect(response).to eq(expeted_response)

      end
    end

    context "when recibe a search result" do

      let(:search_result) { [
        standard_two.id,
        standard_three.id,
        standard_eight.id,
        standard_nine.id
      ] }

      it "should return the expected lists" do
        response = subject.(previous_results: search_result)

        expeted_response = {
          on_demand_offer_ids_list: [
            standard_eight.id,
            standard_three.id
          ],
          standard_offer_ids_list: [
            standard_two.id,
            standard_nine.id
          ]
        }

        expect(response).to eq(expeted_response)
      end
    end

  end

end