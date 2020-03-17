require 'rails_helper'

RSpec.describe "When company arrives in step eight", :type => :feature do

  let(:company) { create(:company, :first_time ) }

  describe "All redirections should be redirect to some route succesfully" do
    context "click on 'Completar mi perfil' " do
      scenario "should redirect to dashboard of company", js: true do
        sign_in company

        visit companies_first_offer_step_eight_path

        find(:button, text: 'Ir al Dashboard').click

        expect(current_path).to eq(companies_dashboard_path)
      end
    end
  end

  describe "Company want to exit the form" do
    context "The navbar is visible" do
      scenario "should click the home button and go to root path", js: true do
        sign_in company
        visit companies_first_offer_step_eight_path

        click_link_or_button('Inicio')
        expect(current_path).to eq(root_path)
      end
    end
  end
end
