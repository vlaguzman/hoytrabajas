require 'rails_helper'

RSpec.describe "see offers at home", type: :feature, js: true do
  context "like not logged user" do
    context "there are not any offers" do
      it "should show me a message: there are not offers" do
        visit root_path
        
        expect(Offer.count).to eq(0)	
        expect(page).to have_text("No hay ningún trabajo en este momento")
      end
    end

    context "there are some active and some expired offers" do
      it "should show me just the not expired offers" do
        FactoryBot.create(:offer, title: 'active_offer')
        FactoryBot.create(:offer, :expired_offer, title: 'expired_offer')
	
        visit root_path

        expect(page).to have_text("active_offer")
        expect(page).not_to have_text("expired_offer")
      end
    end 
  end
end
