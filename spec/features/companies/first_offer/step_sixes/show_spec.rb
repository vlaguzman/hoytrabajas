require 'rails_helper'

RSpec.describe "When company fill the step four form", :type => :feature do
  let(:company)   { create(:company, :first_time, name: 'HoyTrabajas.com') }
  let(:offer)     { create(:offer) }

  let!(:responsibility)  { create(:responsibility)}
  let!(:requirement)     { create(:requirement)}
  let!(:vehicle)         { create(:vehicle)}
  let!(:driving_licence) { create(:driving_licence)}

  def expected_page_structure
    expect(page).to have_content("Conozcamos más de tu oferta")
    expect(page).to have_content("Brinda a tu candidato una relevante de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'offer[responsibility_ids][]',  type: "hidden" })
      with_tag(:input, with: { name: 'offer[requirement_ids][]',     type: "hidden" })
      with_tag(:input, with: { name: 'offer[vehicle_ids][]',         type: "hidden" })
      with_tag(:input, with: { name: 'offer[driving_licence_ids][]', type: "hidden" })
    end

    expect(page).to have_button('Siguiente')
  end

  def fill_form(data)
    find(id: 'select-offer[responsibility_ids][]', visible: false).click
    find('li', text: data[:responsibility_ids]).click

    find(id: 'select-offer[requirement_ids][]', visible: false).click
    find('li', text: data[:requirement_ids]).click

    find(id: 'select-offer[vehicle_ids][]', visible: false).click
    find('li', text: data[:vehicle_ids]).click

    find(id: 'select-offer[driving_licence_ids][]', visible: false).click
    find('li', text: data[:driving_licence_ids]).click
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
        click_link_or_button('Siguiente')

        offer.reload

        expect(offer.responsibility_ids).to match_array(responsibility.id)
        expect(offer.requirement_ids).to match_array(requirement.id)
        expect(offer.vehicle_ids).to match_array(vehicle.id)
        expect(offer.driving_licence_ids).to match_array(driving_licence.id)

        expect(current_path).to eq(companies_first_offer_step_seven_path)
      end
    end
  end
end
