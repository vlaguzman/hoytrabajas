require 'rails_helper'

RSpec.describe Users::Dashboards::OffersService do

  describe "#call" do
    let(:user) { create(:user) }

    context "When the user have zero applied offers" do
      it "Should return a empty array" do
        expect(subject.(user)).to be_empty
      end
    end

    context "When company have ten offers created" do
      let!(:my_applied_offers) { create_list(:applied_offer, 1, curriculum_vitae: user.curriculum_vitae) }
      let!(:other_applied_offers) { create_list(:applied_offer, 2) }

      it "Should return a Array with the expected extruture and data" do
        response = subject.(user)

        expect(response).to_not be_empty
        expect(response.length).to eq(1)
        expect(response.last.keys).to match_array([:id, :title, :people_applied, :start_date, :close_date, :status, :visit_offer_path])
      end
    end
  end
end