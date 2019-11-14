require 'rails_helper'

RSpec.describe "When company fill the step four form", :type => :feature do
  let(:company) { create(:company, :first_time, name: 'HoyTrabajas.com') }
  let(:offer)   { create(:offer) }
  let(:currency) { create(:currency, description: "COP") }
  let(:salary_period) { create(:salary_period, description: "Diario") }
  let(:working_day) { create(:working_days, description: "Mañana (7am-12pm)") }
  let(:job_aids) { create(:job_aids, description: "Aux de transporte") }

  def expected_page_structure
    expect(page).to have_content("Conozcamos más de tu oferta")
    expect(page).to have_content("Brinda a tu candidato una relevante de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'offer[is_range]',    type: "hidden" })
      with_tag(:input, with: { name: 'offer[currency_id]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[from]',        type: "hidden" })
      with_tag(:input, with: { name: 'offer[to]',          type: "hidden" })
      with_tag(:input, with: { name: 'offer[salary_period_id]', type: "hidden" })

      with_tag(:input, with: { name: 'offer[offers_working_day_ids][]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[available_work_day_ids][]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[job_aids_ids][]', type: "hidden" })
    end

    expect(page).to have_button('Publicar')
  end

  def fill_form(data)
    fill_in 'offer[is_range]', with: data[:is_range]
    fill_in 'offer[currency_id]', with: data[:currency_id]
    fill_in 'offer[from]', with: data[:from]
    fill_in 'offer[to]', with: data[:to]
    fill_in 'offer[salary_period_id]', with: data[:salary_period_id]

    find(id: 'select-offer[offers_working_day_ids][]', visible: false).click
    find('li', text: data[:offers_working_day_id_one]).click

    execute_script "window.scrollTo(0, (window.innerHeight * 2) )"

    find(id: 'select-offer[available_work_day_ids][]', visible: false).click
    find('li', text: data[:available_work_day_id_one]).click

    execute_script "window.scrollTo(0, (window.innerHeight * 2) )"

    find(id: 'select-offer[job_aids_ids][]', visible: false).click
    find('li', text: data[:job_aids_id_one]).click

    execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
  end

  describe "Fill the five form to update offer, all data is optionally" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit companies_first_offer_step_five_path(offer_id: offer.id)
        save_page("daniel.html")

        expected_page_structure
        fill_form(
          {
            is_range: 'true',
            currency_id: current.id,
            from: '750.000',
            to: '750.000',
            salary_period_id: salary_period.id,
            offers_working_day_ids: offers_working_day_one.description,
            available_work_day_ids: available_work_day_one.description,
            job_aids_ids: job_aid_one.description
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
