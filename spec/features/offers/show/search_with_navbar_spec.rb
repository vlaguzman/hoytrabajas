require 'rails_helper'

RSpec.describe "like anonymoyus user", type: :feature, vcr: true do
  feature "When visit a offer and whant to search other" do
    let!(:searched_offer) { create(:offer, id:1, title: "somebody searchme please") }
    let(:visited_offer) { create(:offer, id:2, title: "somebody visitedme") }

    scenario "Should use the search var in navbar to find other offer", js: true do
      Offer.import

      visit offer_path(visited_offer)

      expect(page).to have_text(/Somebody visitedme/)

      fill_in 'search[keywords]', with: 'searchme'
      find('.searchBar__searchIcon').click

      expect(page).to have_text('Somebody Searchme Please')
      expect(page).to_not have_text('Somebody Visitedme')
    end
  end
end