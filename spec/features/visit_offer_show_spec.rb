require 'rails_helper'

RSpec.describe "visit offer path", type: :feature do

  let(:visited_offer) { create(:offer)}

  describe "like a external user i what visit de details of a offer" do
    context "When i visit the details offer page" do
      it "should see the offer title", js: true do
        visit offers_path(visited_offer)

        expect(page).to have_text(visited_offer.title)
      end
    end
  end
end
