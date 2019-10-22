require 'rails_helper'

RSpec.describe "When company fill the step three form", :type => :feature do
  let(:company) { FactoryBot.create(:company, :first_time, name: 'HoyTrabajas.com') }

  let!(:job_category) { FactoryBot.create(:job_category) }
  let!(:offer_type)   { FactoryBot.create(:offer_type) }
  let!(:work_mode)    { FactoryBot.create(:work_mode) }

  let!(:work_position) { FactoryBot.create(:work_position) }

  def expected_page_structure
    expect(page).to have_content("Creemos tu primera oferta")
    expect(page).to have_content("Brinda a tu candidato una relevante de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:textarea, with: { name: 'offer[title]'})

      with_tag(:input, with: { name: 'offer[job_category_id]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[offer_work_position_id]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[offer_type_id]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[work_mode_id]', type: "hidden" })
    end

    expect(page).to have_button('Siguiente')

    expect(page).to_not have_button('Regresar')
    expect(page).to_not have_button('Saltar')
  end

  def fill_form(data)
    fill_in 'offer[title]', :with => data[:title]

    find(id: 'select-offer[job_category_id]', visible: false).click
    find('li', text: data[:job_category_id]).click

    find(id: 'select-offer[offer_type_id]', visible: false).click
    find('li', text: data[:offer_type_id]).click

    find(id: 'select-offer[work_mode_id]', visible: false).click
    find('li', text: data[:work_mode_id].gsub(' ', '')).click

    find(id: 'select-offer[offer_work_position_id]', visible: false).click
    find('li', text: data[:offer_work_position_id]).click
  end

  describe "Fill the first offer data" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company

        visit new_companies_first_offer_step_three_path

        expected_page_structure
        fill_form(
          {
            title: 'Oferta para el mejor desarrollador del mundo mundial',
            job_category_id: job_category.description,
            offer_type_id: offer_type.description,
            work_mode_id: work_mode.description,
            offer_work_position_id: work_position.description
          }
        )
        click_link_or_button('Siguiente')

        offer = Offer.find_by(title: 'Oferta para el mejor desarrollador del mundo mundial')

        expect(offer.job_category_id).not_to be_nil
        expect(offer.work_mode_id).not_to be_nil
        expect(offer.offer_type_id).not_to be_nil

        expect(current_path).to eq(edit_companies_first_offer_step_four_path(offer.id))
      end
    end
    context "Data is not correct" do
      scenario "should not save succesfully data", js: true do
        sign_in company
        visit new_companies_first_offer_step_three_path

        expected_page_structure
        fill_form(
          {
            title: '',
            job_category_id: job_category.description,
            offer_type_id: offer_type.description,
            work_mode_id: work_mode.description,
            offer_work_position_id: work_position.description
          }
        )
        click_link_or_button('Siguiente')

        expect(page).to have_content("Por favor ingrese un título a la oferta, este campo no puede estar en blanco")
      end
    end
  end
end
