require 'rails_helper'

RSpec.describe "When company fill the step four form", :type => :feature do
  let(:company) { create(:company, :first_time, name: 'HoyTrabajas.com') }
  let(:offer)   { create(:offer) }
  let(:salary_type_1) { create(:salary_type, description: "Fijo") }
  let(:salary_type_2) { create(:salary_type, description: "Rango") }
  let(:currency) { create(:currency, description: "COP") }
  let(:salary_period) { create(:salary_period, description: "Diario") }
  let(:working_day) { create(:working_days, description: "Mañana (7am-12pm)") }
  let(:job_aids) { create(:job_aids, description: "Aux de transporte") }

  def expected_page_structure
    expect(page).to have_content("Conozcamos más de tu oferta")
    expect(page).to have_content("Brinda a tu candidato una relevante de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'offer[offer_salaries][salary_type_id]',   type: "hidden" })
      with_tag(:input, with: { name: 'offer[offer_salaries][currency_id]',      type: "hidden" })
      with_tag(:input, with: { name: 'offer[offer_salaries][from]',             type: "hidden" })
      with_tag(:input, with: { name: 'offer[offer_salaries][to]',               type: "hidden" })
      with_tag(:input, with: { name: 'offer[offer_salaries][salary_period_id]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[offers_working_days][working_days_ids]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[available_work_days_offers][available_work_days_ids]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[job_aids_ids][]', type: "hidden" })
    end

    expect(page).to have_button('Publicar')
  end

  def fill_form(data)
    find(id: 'select-offer[sex_ids][]', visible: false).click
    find('li', text: data[:sex_one]).click

    execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
  end

  describe "Fill the four form to update offer, all data is optionally" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit companies_first_offer_step_four_path(offer_id: offer.id)
        save_page("daniel.html")

        expected_page_structure
        fill_form(
          {
            contract_type_id: contract_type.description,
            sex_one: sex_1.description,
            sex_two: sex_2.description,
            sex_three: sex_3.description
          })
        click_link_or_button('Publicar')

        offer.reload

        expect(offer.contract_type_id).to eq(contract_type.id)
        expect(offer.vacancies_quantity).to eq(10)
        expect(offer.sex_ids).to match_array([sex_1.id, sex_2.id, sex_3.id])
        expect(offer.close_date.strftime("%F") ).to eq(Time.now.strftime("%F"))
        expect(offer.immediate_start).to eq(false)

        expect(current_path).to eq(companies_first_offer_step_eight_path)
      end
    end
  end
end
