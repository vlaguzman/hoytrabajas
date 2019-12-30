require 'rails_helper'

RSpec.describe "Admin can edit an offer", type: :feature do
  include Devise::Test::IntegrationHelpers

  context "a admin user must be able to edit a created offer" do

    let!(:offer_type_1)    { create(:offer_type,    description: 'Indifferent') }
    let!(:work_mode_1)     { create(:work_mode,     description: 'Indifferent') }
    let!(:contract_type_1) { create(:contract_type, description: 'Indifferent') }
    let!(:job_category_1)  { create(:job_category,  description: 'Programming') }
    let!(:work_position_1) { create(:work_position, description: 'Developer') }
    let!(:sex_1)           { create(:sex,           description: 'Male') }

    let!(:offer_type_2)    { create(:offer_type,    description: 'Work by week') }
    let!(:work_mode_2)     { create(:work_mode,     description: 'Home office') }
    let!(:contract_type_2) { create(:contract_type, description: 'Temporal') }
    let!(:job_category_2)  { create(:job_category,  description: 'Computation') }
    let!(:work_position_2) { create(:work_position, description: 'Tester') }
    let!(:sex_2)           { create(:sex,           description: 'Female') }

    let!(:offer) { create(:offer,
      title: 'Offer for great devs!',
      offer_type_id:     offer_type_1.id,
      work_mode_id:      work_mode_1.id,
      contract_type_id:  contract_type_1.id,
      job_category_ids:  [job_category_1.id],
      work_position_ids: [work_position_1.id],
      sex_ids:           [sex_1.id],
    ) }

    scenario "the admin select an offer and edit all the data" do
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path
      expect(page).to have_content("Active Admin")

      has_button?("Offers")
      click_on("Offers")

      expect(page).to have_content("Offer for great devs!")
      has_button?("Ver")
      has_button?("Eliminar")
      has_button?("Editar")

      click_on("Editar")
      save_page('daniel.html')
      expect(current_path).to eq(edit_admins_offer_path)
      expect(page).to have_content("Editar #{offer.title}")

      expect(page).to have_tag(:form, with: { id: "edit_offer_#{offer.id}" }) do
        with_tag(:input, with: { name: 'offer[id]',                 type: 'hidden'})
        with_tag(:input, with: { name: 'offer[title]',              type: 'text'})
        with_tag(:input, with: { name: 'offer[vacancies_quantity]', type: 'number'})

        with_tag(:input, with: { name: 'offer[age_range][to]',       type: 'number'})
        with_tag(:input, with: { name: 'offer[age_range][from]',     type: 'number'})
        with_tag(:input, with: { name: 'offer[age_range][offer_id]', type: 'hidden'})

        with_tag(:select, with: { name: 'offer[offer_type_id]'})
        with_tag(:select, with: { name: 'offer[work_mode_id]'})
        with_tag(:select, with: { name: 'offer[contract_type_id]'})

        with_tag(:input, with: { id: "offer_job_categories_#{job_category_1.id}"})
        with_tag(:input, with: { id: "offer_job_categories_#{job_category_2.id}"})
        with_tag(:input, with: { id: "offer_work_positions_#{work_position_1.id}"})
        with_tag(:input, with: { id: "offer_work_positions_#{work_position_2.id}"})
        with_tag(:input, with: { id: "offer_sexes_#{sex_1.id}"})
        with_tag(:input, with: { id: "offer_sexes_#{sex_2.id}"})
      end

      within "#edit_offer_#{offer.id}" do
        fill_in 'offer[title]',              with: 'Offer for only devs'
        fill_in 'offer[vacancies_quantity]', with: 2

        fill_in 'offer[age_range][to]',   with: 750000
        fill_in 'offer[age_range][from]', with: 750000

        select("#{offer_type_2.description}",    from: 'offer_offer_type_id')
        select("#{work_mode_2.description}",     from: 'offer_work_mode_id')
        select("#{contract_type_2.description}", from: 'offer_contract_type_id')

        find(:css, "#offer_job_categories_#{job_category_2.id}[value='#{job_category_2.id}']").set(true)
        find(:css, "#offer_work_positions_#{work_position_2.id}[value='#{work_position_2.id}']").set(true)
        find(:css, "#offer_sexes_#{sex_2.id}[value='#{sex_2.id}']").set(true)

        click_on('Update Offer')
      end

      offer.reload

      expect(offer.title).to eq('Offer for only devs')
      expect(offer.vacancies_quantity).to eq(2)

      expect(offer.offer_type_id).to eq(offer_type_2.id)
      expect(offer.work_mode_id).to eq(work_mode_2.id)
      expect(offer.contract_type_id).to eq(contract_type_2.id)

      expect(offer.job_category_ids).to match_array([job_category_1.id, job_category_2.id])
      expect(offer.work_position_ids).to match_array([work_position_1.id, work_position_2.id])
      expect(offer.sex_ids).to match_array([sex_1.id, sex_2.id])
    end
  end
end
