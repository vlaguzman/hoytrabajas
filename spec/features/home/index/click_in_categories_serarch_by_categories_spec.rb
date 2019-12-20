require 'rails_helper'

RSpec.describe "Like a anonymous user", type: :feature do

  let!(:tech_category) { create(:job_category, description: 'tech') }

  feature "I want to click in a category" do
    let!(:expected_offers) { [
      create(:offer, title: 'my offer', job_categories: [tech_category]),
      create(:offer, title: 'super offer', job_categories: [tech_category]),
      create(:offer, title: 'im not appear')
    ]
  }

    scenario "should load all offers with this category", js: true do
      visit root_path

      expect(page).to have_content('Im not appear')

      find('a', text: 'tech').click

      expect(page).to have_content('My offer')
      expect(page).to have_content('Super offer')
      expect(page).to_not have_content('Im not appear')

      expect(Offer.count).to eq(3)
    end
  end
end