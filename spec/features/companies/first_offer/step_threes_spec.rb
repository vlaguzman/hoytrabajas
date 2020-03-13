require 'rails_helper'

RSpec.describe "Like an company", :type => :feature do
  let(:company) { create(:company, :first_time, name: 'HoyTrabajas.com') }

  let!(:job_category)  { create(:job_category) }
  let!(:offer_type)    { create(:offer_type) }
  let!(:work_mode)     { create(:work_mode) }
  let!(:work_position) { create(:work_position) }

  describe "fill the step three form" do
    context "when entry data is correct" do
      scenario "should save succesfully", js: true do
        sign_in company

        visit companies_first_offer_step_three_path

        expected_data = {
          title:                 'Oferta para el mejor desarrollador del mundo mundial',
          description:           'Se busca desarrollador con 10 años de experiencia en COBOL y HASKEL, salirio: mucho money',
          job_category:          job_category.description,
          offer_type:            offer_type.description,
          work_mode:             work_mode.description,
          offers_work_positions: work_position.description
        }

        expect(page).to have_content("Acerca de tu oferta")
        expect(page).to have_content("¡Llegó la hora de crear tu oferta y obtener el mejor talento!")
  
        expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
          with_tag(:textarea, with: { name: 'offer[title]'})
          with_tag(:input,    with: { name: 'offer[confidential]', type: "hidden" })
          with_tag(:textarea, with: { name: 'offer[description]'})
  
          with_tag(:input, with: { name: 'offer[id]', type: "hidden" })
          with_tag(:input, with: { name: 'offer[job_category_ids]', type: "hidden" })
          with_tag(:input, with: { name: 'offer[offer_type_id]', type: "hidden" })
          with_tag(:input, with: { name: 'offer[work_mode_id]', type: "hidden" })
        end
  
        expect(page).to have_button('Siguiente')
  
        expect(page).to_not have_button('Regresar')
        expect(page).to_not have_button('Saltar')

        fill_in 'offer[title]', :with => expected_data[:title]
  
        fill_in 'offer[description]', :with => expected_data[:description]
  
        find(id: 'mui-component-select-offer[job_category_ids]', visible: false).click
        find('li.MuiListItem-button', text: expected_data[:job_category]).click
  
        find(id: 'mui-component-select-offer[offer_type_id]', visible: false).click
        find('li.MuiListItem-button', text: expected_data[:offer_type]).click
  
        find(id: 'mui-component-select-offer[work_mode_id]', visible: false).click
        find('li.MuiListItem-button', text: expected_data[:work_mode]).click
  
        find(id: 'offer[offers_work_positions]', visible: false).click
        find('li', text: expected_data[:offers_work_positions]).click

        click_link_or_button('Siguiente')

        offer = Offer.find_by(title: 'Oferta para el mejor desarrollador del mundo mundial')

        expect(offer.description).to eq(expected_data[:description])
        expect(offer.job_category_ids).not_to be_nil
        expect(offer.work_mode_id).not_to be_nil
        expect(offer.offer_type_id).not_to be_nil
        expect(offer.status).to eq("preview")
        expect(offer.confidential).to be_falsey

        expect(current_path).to eq(companies_first_offer_step_four_path)
      end
    end

    context "when entry data is not correct" do
      scenario "should not save succesfully", js: true do

        sign_in company

        visit companies_first_offer_step_three_path

        click_link_or_button('Siguiente')

        expect(current_path).to eq(companies_first_offer_step_three_path)

        expect(page).to have_content("Por favor ingrese un título a la oferta, este campo no puede estar en blanco")
        expect(page).to have_content("Por favor seleccione una categoría, este campo es requerido")
        expect(page).to have_content("Por favor ingrese una descripción a la oferta, este campo no puede estar en blanco")
      end
    end
  end

  describe "Company want to exit the form" do
    context "The navbar is visible" do
      scenario "should click the home button and go to root path", js: true do
        sign_in company
        visit companies_first_offer_step_three_path

        click_link_or_button('Inicio')
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe "Company want to see the progress of completion" do
    it "Should see the progress bar with the correct % of completion", js: true do
      sign_in company
      visit companies_first_offer_step_three_path

      expect( find('.progressBar__bar', visible: false).value.to_i ).to eq((100 / 7 * 3))
    end
  end
end
