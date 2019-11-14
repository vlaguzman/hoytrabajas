require 'rails_helper'

RSpec.describe "company restore password", type: :feature do

  feature "Like a existing company when restore my password" do
    let(:company) { create(:company) }

    scenario "should visit the restore password page", js: true do
      visit company_session_path

      click_on '¿Olvidó su contraseña?'

      expect(current_path).to eq(new_company_password_path)
    end
  end
end