require 'rails_helper'

RSpec.describe "Like a registered company", type: :feature do
  let(:company) { create(:company, email: 'test@empresa.com' ) }

  feature "Try upload profile picture" do
    context "When upload correctly file" do
      scenario "Should save logo and see these file in profile", js: true do
        sign_in company

        visit companies_profile_path

        find('span.uploadPhoto').click

        attach_file('company[logo]', Rails.root + "spec/factories/images/photo.jpg", make_visible: true)
        find('span.uploadPhoto').click

        expect(current_path).to eq(companies_profile_path)

        company.reload
        expect(company.logo.attached?).to be_truthy

        expect(page.find('.profilePicture')['src']).to have_content 'photo.jpg'
      end
    end
  end
end
