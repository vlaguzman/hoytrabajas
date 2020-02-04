require 'rails_helper'

RSpec.describe "as a candidate I want to upload my photo on my profile", type: :feature do
  let(:user) { create(:user) }

  feature "When Im the upload profile image" do 
    scenario "when I enter my profile I want to upload my photo" do
      sign_in user

      visit users_profile_path

      expect(page).to have_field("user[profile_image]")
      
      attach_file('user[profile_image]', Rails.root + "spec/factories/images/photo.jpg", make_visible: true)

    end

  end

end
