require 'rails_helper'

RSpec.describe "like anonymoyus user", type: :feature do
  feature "When visit a offer and whant to search other" do
    let!(:searched_offer) { create(:offer, title: "somebody searchme please") }
    let(:visited_offer) { create(:offer, title: "somebody visitedme") }

    scenario "Should use the search var in navbar to find other offer", js: true do
      visit offer_path(visited_offer)

      expect(page).to have_text(/Somebody visitedme/)

      fill_in 'q[title_cont]', with: 'searchme'
      find('.searchBar__searchIcon').click

      expect(page).to have_text('Somebody Searchme Please')
      expect(page).to_not have_text('Somebody Visitedme')
    end
  end
end 