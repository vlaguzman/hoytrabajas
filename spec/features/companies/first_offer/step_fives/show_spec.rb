require 'rails_helper'

RSpec.describe "When company fill the step five form", type: :feature do
  let(:company)   { create(:company, :first_time, name: 'HoyTrabajas.com') }
  let(:offer)     { create(:offer) }
  let!(:currency) { create(:currency) }
  let!(:job_aid)  { create(:job_aid) }

  let!(:working_day)        { create(:working_day) }
  let!(:salary_period)      { create(:salary_period) }
  let!(:available_work_day) { create(:available_work_day) }

  def expected_page_structure
    expect(page).to have_content("Conozcamos más de tu oferta")
    expect(page).to have_content("Brinda a tu candidato información relevante de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'offer[is_range]',         type: "hidden" })
      with_tag(:input, with: { name: 'offer[currency_id]',      type: "hidden" })
      with_tag(:input, with: { name: 'offer[from]',             type: "text" })
      with_tag(:input, with: { name: 'offer[salary_period_id]', type: "hidden" })

      with_tag(:input, with: { name: 'offer[available_work_day_ids][]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[working_day_ids][]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[job_aid_ids][]', type: "hidden" })
    end

    expect(page).to have_button('Siguiente')
  end

  def fill_form(data)
    find(id: 'mui-component-select-offer[is_range]', visible: false).click
    find('li', text: data[:is_range]).click

    find(id: 'mui-component-select-offer[currency_id]', visible: false).click
    find('li', text: data[:currency_id]).click

    fill_in 'offer[from]', with: data[:from]
    fill_in 'offer[to]', with: data[:to]

    find(id: 'mui-component-select-offer[salary_period_id]', visible: false).click
    find('li', text: data[:salary_period_id]).click

    find(id: 'mui-component-select-offer[available_work_day_ids][]', visible: false).click
    find('li.MuiListItem-button', text: data[:available_work_day_id_one]).click

    find(id: 'mui-component-select-offer[working_day_ids][]', visible: false).click
    find('li.MuiListItem-button', text: data[:working_day_id_one]).click

    find(id: 'mui-component-select-offer[job_aid_ids][]', visible: false).click
    find('li.MuiListItem-button', text: data[:job_aid_id_one]).click
  end

  describe "Fill the five form to update offer, all data is optionally" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit companies_first_offer_step_five_path(offer_id: offer.id)

        expected_page_structure
        fill_form(
          {
            is_range:               'Rango',
            currency_id:            currency.description,
            from:                   '750000',
            to:                     '750000',
            salary_period_id:       salary_period.description,
            working_day_ids:        working_day.description,
            available_work_day_ids: available_work_day.description,
            job_aid_ids:            job_aid.description
          })
        click_link_or_button('Siguiente')

        offer.reload

        expect(offer.salary_is_range).to eq(true)
        expect(offer.salary_currency_id).to eq(currency.id)
        expect(offer.salary_from).to eq(750000)
        expect(offer.salary_to).to eq(750000)
        expect(offer.salary_period_id).to eq(salary_period.id)

        expect(offer.available_work_day_ids).to match_array(available_work_day.id)
        expect(offer.working_day_ids).to match_array(working_day.id)
        expect(offer.job_aid_ids).to match_array(job_aid.id)

        expect(current_path).to eq(companies_first_offer_step_six_path)
      end
    end
  end

  describe "Company want to exit the form" do
    context "The navbar is visible" do
      scenario "should click the home button and go to root path", js: true do
        sign_in company
        visit companies_first_offer_step_five_path(offer_id: offer.id)

    
        click_link_or_button('Inicio')
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe "Company want to see the progress of completion" do
    it "Should see the progress bar with the correct % of completion", js: true do
      sign_in company
      visit companies_first_offer_step_five_path(offer_id: offer.id)


      expect( find('.progressBar__bar', visible: false).value.to_i ).to eq((100 / 7 * 5))
    end
  end
end
