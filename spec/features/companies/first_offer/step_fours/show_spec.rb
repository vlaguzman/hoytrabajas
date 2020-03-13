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
    expect(page).to have_content("Brinda a tu candidato información relevante de tu empresa.")

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
        expected_close_date = Date.today + 1.month

        sign_in company
        visit companies_first_offer_step_four_path(offer_id: offer.id)

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
        expect(offer.close_date.strftime("%F") ).to eq(expected_close_date.strftime("%F"))
        expect(offer.immediate_start).to eq(false)

        expect(current_path).to eq(companies_first_offer_step_five_path)
      end
    end
  end

  describe "Company want to exit the form" do
    context "The navbar is visible" do
      scenario "should click the home button and go to root path", js: true do
        sign_in company
        visit companies_first_offer_step_four_path(offer_id: offer.id)
    
        click_link_or_button('Inicio')
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe "Company want to see the progress of completion" do
    it "Should see the progress bar with the correct % of completion", js: true do
      sign_in company
      visit companies_first_offer_step_four_path(offer_id: offer.id)

      expect( find('.progressBar__bar', visible: false).value.to_i ).to eq((100 / 7 * 4))
    end
  end
end
