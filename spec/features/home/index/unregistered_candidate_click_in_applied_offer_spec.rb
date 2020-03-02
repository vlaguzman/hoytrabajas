require 'rails_helper'

RSpec.describe "Unregistered user applied offer in home", type: :feature do

  def form_field_value(field_name, multiple= nil)
    find("input[name='user[#{field_name}]#{'[]' if multiple}']", visible: false).value
  end

  let!(:born_country)              { create(:country, description: "Argentina") }
  let!(:born_state)                { create(:state, description: "Buenos Aires", country: born_country) }
  let!(:born_city)                 { create(:city, description: "Capital Federal", state: born_state) }
  let!(:residence_country)         { create(:country, description: "Colombia") }
  let!(:residence_state)           { create(:state, description: "Huila", country: residence_country) }
  let!(:residence_city)            { create(:city, description: "Neiva", state: residence_state) }
  let!(:nationality_one)           { create(:nationality, description: "Colombiana") }
  let!(:nationality_two)           { create(:nationality, description: "Argentina") }
  let!(:document_type)             { create(:document_type, description: "Cedula de Ciudadania") }
  let!(:offer)                     { create(:offer, title: 'Tremendous offer') }
  let!(:applied_offer_status)      { create(:applied_offer_status, description: "applied") }
  

  context "When the anonymous user wants to apply offer in home" do
    it "Should complete registration and arrive at the offer show", js: true do

    visit root_path

    expect(page).to have_text("Tremendous Offer")
    find(".cardOffer", match: :first).hover
    has_css?('.btn-apply')
    find(".btn-apply", match: :first).click

    expect(current_path).to eq(new_user_registration_path)

    expect(page).to have_text("¡Hola! Regístrate ahora")
    fill_in 'user[email]',                 :with => "humano.test@email.com"
    fill_in 'user[password]',              :with => "holamundo101"
    fill_in 'user[password_confirmation]', :with => "holamundo101"

    find('.termsAndConditions__checkbox').click

    has_button?("Registrarme")
    find(".a-button", text: "Registrarme", visible: false).click

    expect(current_path).to eq(users_wizards_step_zero_path)

    expect(page).to have_text("Quiero completar mi perfil")
    click_on('Quiero completar mi perfil')

    expect(current_path).to eq(users_wizards_step_zeros_curriculum_vitae_path)

    expect(page).to have_text("No tengo hoja de vida")
    click_on("No tengo hoja de vida")

    expect(current_path).to eq(users_wizards_step_one_path)

    fill_in 'user[name]', with: 'Carlos'
    fill_in 'user[last_name]', with: 'Rojas'

    find("div[id='mui-component-select-user[born_country_id]", visible: false).click
    find("li", text: "Argentina").click

    find("div[id='mui-component-select-user[born_state_id]", visible: false).click
    find("li", text: "Buenos Aires").click

    find("div[id='mui-component-select-user[born_city_id]", visible: false).click
    find("li", text: "Capital Federal").click

    find("div[id='mui-component-select-user[residence_country_id]", visible: false).click
    find("li", text: "Colombia").click

    find("div[id='mui-component-select-user[residence_state_id]", visible: false).click
    find("li", text: "Huila").click

    find("div[id='mui-component-select-user[residence_city_id]", visible: false).click
    find("li", text: "Neiva").click

    find("div[id='mui-component-select-user[nationality_ids][]']", visible: false).click
    find("li", text: "Argentina").click
    find("div[id='mui-component-select-user[nationality_ids][]']", visible: false).click
    find("li", text: "Colombiana").click

    find("div[id='mui-component-select-user[document_type_id]']", visible: false).click
    find("li", text: "Cedula de Ciudadania").click

    fill_in "user[identification_number]", :with => "1063558224"
    fill_in "user[contact_number]", :with => "3183638789"

    execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
    find("span", text: /SIGUIENTE/).click

    expect(current_path).to eq(users_wizards_step_two_path)

    visit users_wizards_step_nines_choices_path

    expect(current_path).to eq(users_wizards_step_nines_choices_path)

    expect(page).to have_text("Sí, quiero agregarla")
    click_on("Sí, quiero agregarla")

    expect(current_path).to eq(users_wizards_step_nine_path)

    fill_in 'educational_level[degree]', with: 'Supa Engineer'
    click_on("Continuar")

    expect(current_path).to eq(users_wizards_step_nines_added_educational_level_path(1))

    expect(page).to have_text("Continuar")
    find('button', text: "Continuar").click

    expect(current_path).to eq(offer_path(offer.id))
    expect(page).to have_text("¡HAS APLICADO!")
    end
  end
end
