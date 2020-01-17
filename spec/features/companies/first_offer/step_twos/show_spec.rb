require 'rails_helper'

RSpec.describe "When company fill the step two form", :type => :feature do
  let(:company) { create(:company, :first_time, name: 'HoyTrabajas.com') }

  describe "Fill the description company data" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit companies_first_offer_step_two_path

        expect(page).to have_content("Empecemos por conocernos")
        expect(page).to have_content("Brinda a tu candidato información de tu empresa.")

        expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
          with_tag(:input, with: { name: 'company[description]' })
        end

        expect(page).to have_button('Siguiente')

        fill_in 'company[description]', :with => "Esta es una description de mi compania"

        click_link_or_button('Siguiente')

        company.reload
        expect(company.description).to eq("Esta es una description de mi compania")

        expect(current_path).to eq(companies_first_offer_step_three_path)
      end
    end
  end


  describe "Mandatory fields have not been filled" do
    context "Required fields are empty" do
      scenario "should retorn translate error", js: true do

        sign_in company
        visit companies_first_offer_step_two_path

        expect(page).to have_content("Empecemos por conocernos")
        expect(page).to have_content("Brinda a tu candidato información de tu empresa.")

        expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
          with_tag(:input, with: { name: 'company[description]' })
        end

        expect(page).to have_button('Siguiente')

        fill_in 'company[description]', :with => ""

        click_link_or_button('Siguiente')

        company.reload

        expect(current_path).to eq(companies_first_offer_step_two_path)

        expect(page).to have_content("Por favor agrege la descripción de la empresa, este campo no puede estar en blanco")

      end
    end
  end

end
