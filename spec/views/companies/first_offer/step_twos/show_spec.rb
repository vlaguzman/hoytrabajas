require 'rails_helper'

RSpec.describe "companies/first_offer/step_twos/show", :type => :feature do
  let(:company) { FactoryBot.create(:company, :first_time, name: 'HoyTrabajas.com') }

  describe "Fill the principal company user data" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit companies_first_offer_step_one_path

        expect(page).to have_content("Empecemos por conocernos")
        expect(page).to have_content("Brinda a tu candidato información de tu empresa.")

        expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
          with_tag(:input, with: { name: 'company[description]', type: "text" })
        end

        expect(page).to have_button('Siguiente')

        fill_in 'company[description]', :with => "Esta es la descripcion de mi compania"

        click_link_or_button('Siguiente')

        company = Company.find_by(name: 'Enterprise.com')

        expect(company.description).not_to eq('Esta es la descripcion de mi compania')

        expect(current_path).to eq(companies_first_offer_step_two_path)
      end
    end
  end
end
