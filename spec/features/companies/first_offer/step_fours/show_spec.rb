require 'rails_helper'

RSpec.describe "When company fill the step four form", :type => :feature do
  let(:company) { create(:company, :first_time, name: 'HoyTrabajas.com') }
  let(:offer)   { create(:offer) }

  let!(:sex_1) { create(:sex, description: "Male") }
  let!(:sex_2) { create(:sex, description: "Female") }
  let!(:sex_3) { create(:sex, description: "Undefined") }

  let!(:contract_type) { create(:contract_type) }

  def expected_page_structure
    expect(page).to have_content("Conozcamos más de tu oferta")
    expect(page).to have_content("Brinda a tu candidato una relevante de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'offer[contract_type_id]',   type: "hidden" })
      with_tag(:input, with: { name: 'offer[vacancies_quantity]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[sex_ids][]',          type: "hidden" })
      with_tag(:input, with: { name: 'offer[offer_age_range]',    type: "hidden" })
      with_tag(:input, with: { name: 'offer[close_date]',         type: "text" })
      with_tag(:input, with: { name: 'offer[immediate_start]',    type: "hidden" })
    end

    expect(page).to have_button('Siguiente')
  end

  def fill_form(data)
    find(id: 'mui-component-select-offer[contract_type_id]', visible: false).click
    find('li', text: data[:contract_type_id]).click

    find(id: 'mui-component-select-offer[sex_ids][]', visible: false).click
    find('li', text: data[:sex_one]).click

    find(id: 'mui-component-select-offer[sex_ids][]', visible: false).click
    find('li', text: data[:sex_two]).click

    find(id: 'mui-component-select-offer[sex_ids][]', visible: false).click
    find('li', text: data[:sex_three]).click

    execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
  end

  describe "Fill the four form to update offer, all data is optionally" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit companies_first_offer_step_four_path(offer_id: offer.id)

        expected_close_date = Date.today + 1.month
        expected_page_structure
        fill_form(
          {
            contract_type_id: contract_type.description,
            sex_one:          sex_1.description,
            sex_two:          sex_2.description,
            sex_three:        sex_3.description
          })
        click_link_or_button('Siguiente')

        offer.reload

        expect(offer.contract_type_id).to eq(contract_type.id)
        expect(offer.vacancies_quantity).to eq(10)
        expect(offer.sex_ids).to match_array([sex_1.id, sex_2.id, sex_3.id])
        expect(offer.close_date.strftime("%F") ).to eq(expected_page_structure.strftime("%F"))
        expect(offer.immediate_start).to eq(false)

        expect(current_path).to eq(companies_first_offer_step_five_path)
      end
    end
  end
end
