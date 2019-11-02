require 'rails_helper'

def skip_under_construction
  find("button[id='home-welcome-modal']", visible: false).click
  execute_script "window.scrollTo(0, (window.innerHeight * 2))"
end

RSpec.describe "visit offer from home", type: :feature do

  describe "like a external user i what visit the details of a offer" do
    context "When i visit click at see_offer button i should go to the details offer page" do
      it "should see the offer title", js: true do
        Offer.destroy_all
        visited_offer = FactoryBot.create(:offer)
        visit root_path

        skip_under_construction

        expect(page).to have_text(visited_offer.title)
        find(".cardOffer").hover
        click_on("ver oferta", match: :first)

        expect(page).to have_text(visited_offer.title)
        expect(page).to have_text(visited_offer.description)
        expect(current_path).to eq "/offers/#{visited_offer.id}"
      end
    end
  end
end
