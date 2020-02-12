require 'rails_helper'

RSpec.describe "User restore password", type: :feature do

  feature "Like a existing user when restore my password" do
    let(:user) { create(:user) }

    scenario "should visit the restore password page", js: true do
      visit user_session_path

      click_on '¿Olvidaste tu contraseña?'

      expect(current_path).to eq(new_user_password_path)
    end
  end
end