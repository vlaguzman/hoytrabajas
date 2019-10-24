require 'rails_helper'

RSpec.describe "When company fill the step four form", :type => :feature do
  let(:company) { create(:company, :first_time, name: 'HoyTrabajas.com') }
  let(:offer)   { create(:offer) }

  let!(:sex)           { create(:sex) }
  let!(:contract_type) { create(:contract_type) }

  def expected_page_structure
    expect(page).to have_content("Conozcamos más de tu oferta")
    expect(page).to have_content("Brinda a tu candidato una relevante de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'offer[contract_type_id]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[vacancies_quantity]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[sex_id]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[offer_age_range]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[close_date]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[immediate_start]', type: "checkbox" })
    end

    expect(page).to have_button('Siguiente')

    expect(page).to have_button('Regresar')
    expect(page).to have_button('Saltar')
  end

  def fill_form(data)
    find(id: 'select-offer[contract_type_id]', visible: false).click
    find('li', text: data[:contract_type_id]).click
  end

  describe "Fill the four form to update offer" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit edit_companies_first_offer_step_four_path(offer.id)
        save_page("daniel.html")

        expected_page_structure
        fill_form(
          {
            id: offer.id,
            contract_type_id: contract_type.id,
            vacancies_quantity: 10,
            sex_id: sex.id,
            offer_age_range: '18-27',
            close_date: '2020-01-20',
            immediate_start: true
          })
        click_link_or_button('Siguiente')

        expect(offer.contract_type_id).to eq(contract_type.id)

        expect(current_path).to eq(edit_companies_first_offer_step_five_path(offer.id))
      end
    end
    context "Data is not correct" do
      scenario "should not save succesfully data", js: true do
        sign_in company
        visit edit_companies_first_offer_step_four_path(offer.id)

        expected_page_structure
        fill_form(
          {
            field_error: ''
          }
        )
        click_link_or_button('Siguiente')

        expect(page).to have_content("error message")
      end
    end
  end
end
