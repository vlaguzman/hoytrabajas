require 'rails_helper'

RSpec.describe "Admin can edit an offer", type: :feature do
  include Devise::Test::IntegrationHelpers

  context "a admin user must be able to edit a created offer" do

    let!(:job_category) { create(:job_category, description: 'Computation & Programming') }
    let!(:offer)        { create(:offer, title: 'Oferta para devs chidos', job_category_ids: [job_category.id]) }

    scenario "the admin select an offer and edit all the data" do
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path
      expect(page).to have_content("Active Admin")

      has_button?("Offers")
      click_on("Offers")

      expect(page).to have_content("Oferta para devs chidos")
      has_button?("Ver")
      has_button?("Eliminar")
      has_button?("Editar")

      click_on("Editar")
      save_page('daniel.html')
      expect(current_path).to eq(edit_admins_offer_path)
      expect(page).to have_content("Editar #{offer.title}")

      expect(page).to have_tag(:form, with: { id: "edit_offer_#{offer.id}" }) do
        with_tag(:input, with: { name: 'offer[title]'})
       #with_tag(:input, with: { name: 'offer[job_category_ids]',      type: "hidden" })
       #with_tag(:input, with: { name: 'offer[offers_work_positions]', type: "hidden" })
       #with_tag(:input, with: { name: 'offer[offer_type_id]',         type: "hidden" })
       #with_tag(:input, with: { name: 'offer[work_mode_id]',          type: "hidden" })

       #with_tag(:input, with: { name: 'offer[contract_type_id]',   type: "hidden" })
       #with_tag(:input, with: { name: 'offer[vacancies_quantity]', type: "hidden" })
       #with_tag(:input, with: { name: 'offer[sex_ids][]',          type: "hidden" })
       #with_tag(:input, with: { name: 'offer[offer_age_range]',    type: "hidden" })
       #with_tag(:input, with: { name: 'offer[close_date]',         type: "text" })
       #with_tag(:input, with: { name: 'offer[immediate_start]',    type: "hidden" })

       #with_tag(:input, with: { name: 'offer[is_range]',         type: "hidden" })
       #with_tag(:input, with: { name: 'offer[currency_id]',      type: "hidden" })
       #with_tag(:input, with: { name: 'offer[from]',             type: "text" })
       #with_tag(:input, with: { name: 'offer[salary_period_id]', type: "hidden" })

       #with_tag(:input, with: { name: 'offer[available_work_day_ids][]', type: "hidden" })
       #with_tag(:input, with: { name: 'offer[working_day_ids][]',        type: "hidden" })
       #with_tag(:input, with: { name: 'offer[job_aid_ids][]',            type: "hidden" })

       #with_tag(:input, with: { name: 'offer[responsibility_ids][]',  type: "hidden" })
       #with_tag(:input, with: { name: 'offer[requirement_ids][]',     type: "hidden" })
       #with_tag(:input, with: { name: 'offer[vehicle_ids][]',         type: "hidden" })
       #with_tag(:input, with: { name: 'offer[driving_licence_ids][]', type: "hidden" })
       #with_tag(:input, with: { name: 'offer[city_id]',               type: "hidden" })
       #with_tag(:input, with: { name: 'offer[educational_degree_id]', type: "hidden" })
       #with_tag(:input, with: { name: 'offer[duration]',              type: "text" })
       #with_tag(:input, with: { name: 'offer[duration_type_id]',      type: "hidden" })
       #with_tag(:input, with: { name: 'offer[required_experience]',   type: "hidden" })

       #with_tag(:input, with: { name: 'offer[technical_skills][][technical_skill_id]', type: "hidden" })
       #with_tag(:input, with: { name: 'offer[technical_skills][][level_id]',           type: "hidden" })

       #with_tag(:input, with: { name: 'offer[languages][][language_id]', type: "hidden" })
       #with_tag(:input, with: { name: 'offer[languages][][level_id]',    type: "hidden" })
      end

      within "#edit_offer_#{offer.id}" do
        fill_in 'offer[title]', with: 'Oferta para devs suaves'
        select("#{job_category.description}", from: 'offer[job_categories]')
        click_on('Update Offer')
      end

      expect(page).to have_content("Actually is just the second best offer")
      expect(Offer.count).to eq(1)
      expect(Offer.last.title).to eq("Actually is just the second best offer")
      Offer.destroy_all
    end

  end
end
