require 'rails_helper'

RSpec.describe "When company fill the step seven form", :type => :feature do
  let(:company)   { create(:company, :first_time, name: 'HoyTrabajas.com') }
  let(:offer)     { create(:offer) }

  let!(:city)  { create(:city)}
  let!(:educational_level)  { create(:educational_level)}
  let!(:duration_type)  { create(:duration_type)}
  let!(:language)  { create(:language)}
  let!(:level)  { create(:level)}

  def expected_page_structure
    expect(page).to have_content("Conozcamos más de tu oferta")
    expect(page).to have_content("Brinda a tu candidato una relevante de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'offer[city_id]',               type: "hidden" })
      with_tag(:input, with: { name: 'offer[educational_degree_id]', type: "hidden" })
      with_tag(:input, with: { name: 'offer[duration]',              type: "hidden" })
      with_tag(:input, with: { name: 'offer[duration_type_id]',      type: "hidden" })
      with_tag(:input, with: { name: 'offer[required_experience]',   type: "hidden" })

      with_tag(:input, with: { name: 'offer[technical_skills_id][0]',       type: "hidden" })
      with_tag(:input, with: { name: 'offer[technical_skills_level_id][0]', type: "hidden" })

      with_tag(:input, with: { name: 'offer[language_id][0]',       type: "hidden" })
      with_tag(:input, with: { name: 'offer[language_level_id][0]', type: "hidden" })
    end

    expect(page).to have_button('Publicar')
  end

  def fill_form(data)
    find(id: 'select-offer[city_id]', visible: false).click
    find('li', text: data[:city_id]).click

    find(id: 'select-offer[educational_degree_id][]', visible: false).click
    find('li', text: data[:educational_degree_id]).click

    find(id: 'select-offer[educational_level_ids][]', visible: false).click
    find('li', text: data[:educational_level_ids]).click
  end

  describe "Fill the five form to update offer, all data is optionally" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit companies_first_offer_step_six_path(offer_id: offer.id)

        expected_page_structure
        fill_form(
          {
            responsibility_ids: responsibility.description,
            requirement_ids: requirement.description,
            vehicle_ids: vehicle.description,
            driving_licence_ids: driving_licence.description
          })
        click_link_or_button('Publicar')

        offer.reload

        expect(offer.responsibility_ids).to match_array(responsibility.id)
        expect(offer.requirement_ids).to match_array(requirement.id)
        expect(offer.vehicle_ids).to match_array(vehicle.id)
        expect(offer.driving_licence_ids).to match_array(driving_licence.id)

        expect(current_path).to eq(companies_first_offer_step_eight_path)
      end
    end
  end
end
