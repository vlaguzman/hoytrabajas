require 'rails_helper'

RSpec.describe "as a candidate I want to upload my photo on my profile", type: :feature do
  let(:user) { create(:user) }

  feature "When Im the upload profile image" do
    scenario "when I enter my profile I want to upload my photo" do
      sign_in user

      visit users_profile_path

      expect(page).to have_field("user[photo]")

      attach_file('user[photo]', Rails.root + "spec/factories/images/photo.jpg", make_visible: true)

      expect(current_path).to eq(user_profile_path)

      expect(page).to have_css("#photo_profile_#{user.id}")
    end
  end
end
