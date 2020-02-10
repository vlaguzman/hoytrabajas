require 'rails_helper'

RSpec.describe "Like an company", :type => :feature do
  let(:company)   { create(:company, :first_time, name: 'HoyTrabajas.com') }
  let(:offer)     { create(:offer) }

  let!(:city)               { create(:city, description: "Buenos Aires")}
  let!(:educational_degree) { create(:educational_degree)}
  let!(:duration_type)      { create(:duration_type)}
  let!(:language)           { create(:language)}
  let!(:level)              { create(:level)}

  describe "fill the step seven form" do
    context "when entry data is correct" do
      scenario "should save succesfully", js: true do
        sign_in company
        visit companies_first_offer_step_seven_path(offer_id: offer.id)

        expect(page).to have_content("Conozcamos más de tu oferta")
        expect(page).to have_content("Brinda a tu candidato información relevante de tu empresa.")
  
        expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
          with_tag(:input, with: { name: 'offer[city_id]',               type: "hidden" })
          with_tag(:input, with: { name: 'offer[educational_degree_id]', type: "hidden" })
          with_tag(:input, with: { name: 'offer[duration]',              type: "text" })
          with_tag(:input, with: { name: 'offer[duration_type_id]',      type: "hidden" })
          with_tag(:input, with: { name: 'offer[required_experience]',   type: "hidden" })
  
          with_tag(:input, with: { name: 'offer[technical_skills][][technical_skill_id]', type: "hidden" })
          with_tag(:input, with: { name: 'offer[technical_skills][][level_id]',           type: "hidden" })
  
          with_tag(:input, with: { name: 'offer[languages][][language_id]', type: "hidden" })
          with_tag(:input, with: { name: 'offer[languages][][level_id]',    type: "hidden" })
        end
  
        expect(page).to have_button('Publicar')

        expected_data = {
          country_description:   city.state.country.description,
          state_description:     city.state.description,
          city_description:      city.description,
          educational_degree:    educational_degree.description,
          duration:              '2',
          duration_type:         duration_type.description
        }

        find(id: 'mui-component-select-offer[country_id]', visible: false).click
        sleep 1

        find('li', text: expected_data[:country_description]).click
  
        find(id: 'mui-component-select-offer[state_id]', visible: false).click
        sleep 1

        find('li', text: expected_data[:state_description]).click
  
        find(id: 'mui-component-select-offer[city_id]', visible: false).click
        find('li', text: expected_data[:city_description]).click
  
        find(id: 'mui-component-select-offer[educational_degree_id]', visible: false).click
        find('li', text: expected_data[:educational_degree]).click
  
        fill_in 'offer[duration]', with: '2'
  
        find(id: 'mui-component-select-offer[duration_type_id]', visible: false).click
        find('li', text: expected_data[:duration_type]).click

        find("span", text: 'Publicar', visible: false).click

        offer.reload

        expect(offer.city_id).to eq(city.id)
        expect(offer.educational_degree_id).to eq(educational_degree.id)
        expect(offer.required_experience).to be_truthy
        expect(offer.required_experiences_duration).to eq(2)
        expect(offer.required_experiences_duration_type_id).to eq(duration_type.id)

        expect(current_path).to eq(companies_first_offer_step_eight_path)
      end
    end
  end

  describe "Company want to exit the form" do
    context "The navbar is visible" do
      scenario "should click the home button and go to root path", js: true do
        sign_in company
        visit companies_first_offer_step_seven_path(offer_id: offer.id)

        click_link_or_button('Inicio')
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe "Company want to see the progress of completion" do
    it "Should see the progress bar with the correct % of completion", js: true do
      sign_in company
      visit companies_first_offer_step_seven_path(offer_id: offer.id)


      expect( find('.progressBar__bar', visible: false).value.to_i ).to eq((100 / 7 * 7))
    end
  end

  #TODO daniel in progress
  feature "When only fill the technical skills section"

  feature "When only fill the language section"

  feature "When fill the all sections"
end
