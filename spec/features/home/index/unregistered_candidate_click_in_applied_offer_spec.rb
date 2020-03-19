require 'rails_helper'

RSpec.describe "Unregistered user applied offer in home", type: :feature do

  def form_field_value(field_name, multiple= nil)
    find("input[name='user[#{field_name}]#{'[]' if multiple}']", visible: false).value
  end

  let(:born_country)              { create(:country, description: "Argentina") }
  let(:born_state)                { create(:state, description: "Buenos Aires", country: born_country) }
  let(:residence_country)         { create(:country, description: "Snowland") }
  let(:residence_state)           { create(:state, description: "Huila", country: residence_country) }

  context "When the anonymous user wants to apply offer in home" do

    let!(:create_required_objects) do
      create(:city, description: "Capital Federal", state: born_state)
      create(:city, description: "Neiva", state: residence_state)
      create(:nationality, description: "Colombiana")
      create(:nationality, description: "Argentina")
      create(:document_type, description: "Cedula de Ciudadania")
      create(:applied_offer_status, description: "applied")
    end

    let!(:offer) { create(:offer, title: 'Tremendous offer') }

    it "Should complete registration and arrive at the offer show", js: true do
      VCR.use_cassette("create_user_full_path") do
        visit root_path

        expect(page).to have_text("Tremendous Offer")

        find(".cardOffer", match: :first).hover
        find(".btn-apply", match: :first).click

        expect(current_path).to eq(new_user_registration_path)

        expect(page).to have_text("¡Hola! Regístrate ahora")

        fill_in 'user[email]',                 :with => "humano.test@email.com"
        fill_in 'user[password]',              :with => "holamundo101"
        fill_in 'user[password_confirmation]', :with => "holamundo101"

        find('.termsAndConditions__checkbox').click

        find(".a-button", text: "Registrarme", visible: false).click

        expect(current_path).to eq(users_wizards_step_zero_path)
        expect(page).to have_text("Quiero completar mi perfil")

        click_on('Quiero completar mi perfil')

        expect(current_path).to eq(users_wizards_step_zeros_curriculum_vitae_path)

        click_on("No tengo hoja de vida")

        fill_in 'user[name]', with: 'Carlos'
        fill_in 'user[last_name]', with: 'Rojas'

        find("div[id='mui-component-select-user[born_country_id]", visible: false).click
        find("li", text: "Argentina").click

        find("div[id='mui-component-select-user[born_state_id]", visible: false).click
        find("li", text: "Buenos Aires").click

        find("div[id='mui-component-select-user[born_city_id]", visible: false).click
        find("li", text: "Capital Federal").click

        find("div[id='mui-component-select-user[residence_country_id]", visible: false).click
        find("li", text: "Snowland").click

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

        find("span", text: /SIGUIENTE/).click

        visit users_wizards_step_nines_choices_path

        click_on("Sí, quiero agregarla")

        fill_in 'educational_level[degree]', with: 'Supa Engineer'

        click_on("Continuar")

        find('button', text: "Continuar").click

        expect(current_path).to eq(offer_path(offer.id))
        expect(page).to have_text('¡Has aplicado a esta oferta!')
        expect(page).to have_text("¡Has aplicado!")
      end
    end

    it "Should skip add educational level and arrive at the offer show", js: true do
      VCR.use_cassette("create_user_full_path") do
        visit root_path

        expect(page).to have_text("Tremendous Offer")

        find(".cardOffer", match: :first).hover
        find(".btn-apply", match: :first).click

        fill_in 'user[email]',                 :with => "kendrick.test@email.com"
        fill_in 'user[password]',              :with => "holamundo101"
        fill_in 'user[password_confirmation]', :with => "holamundo101"

        find('.termsAndConditions__checkbox').click
        find(".a-button", text: "Registrarme", visible: false).click

        expect(page).to have_text("Quiero completar mi perfil")

        click_on('Quiero completar mi perfil')

        click_on("No tengo hoja de vida")

        fill_in 'user[name]', with: 'Carlos'
        fill_in 'user[last_name]', with: 'Rojas'

        find("div[id='mui-component-select-user[born_country_id]", visible: false).click
        find("li", text: "Argentina").click

        find("div[id='mui-component-select-user[born_state_id]", visible: false).click
        find("li", text: "Buenos Aires").click

        find("div[id='mui-component-select-user[born_city_id]", visible: false).click
        find("li", text: "Capital Federal").click

        find("div[id='mui-component-select-user[residence_country_id]", visible: false).click
        find("li", text: "Snowland").click

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

        find("span", text: /SIGUIENTE/).click

        visit users_wizards_step_nines_choices_path

        click_on("Omitir")

        expect(current_path).to eq(offer_path(offer.id))
        expect(page).to have_text('¡Has aplicado a esta oferta!')
        expect(page).to have_text("¡Has aplicado!")
      end
    end

    it "Should click 'No, pero quiero agregarla' in educational level and arrive at the offer show", js: true do
      VCR.use_cassette("create_user_full_path") do
        visit root_path

        expect(page).to have_text("Tremendous Offer")

        find(".cardOffer", match: :first).hover
        find(".btn-apply", match: :first).click

        fill_in 'user[email]',                 :with => "kendrick.test@email.com"
        fill_in 'user[password]',              :with => "holamundo101"
        fill_in 'user[password_confirmation]', :with => "holamundo101"

        find('.termsAndConditions__checkbox').click
        find(".a-button", text: "Registrarme", visible: false).click

        click_on('Quiero completar mi perfil')

        click_on("No tengo hoja de vida")

        fill_in 'user[name]', with: 'Carlos'
        fill_in 'user[last_name]', with: 'Rojas'

        find("div[id='mui-component-select-user[born_country_id]", visible: false).click
        find("li", text: "Argentina").click

        find("div[id='mui-component-select-user[born_state_id]", visible: false).click
        find("li", text: "Buenos Aires").click

        find("div[id='mui-component-select-user[born_city_id]", visible: false).click
        find("li", text: "Capital Federal").click

        find("div[id='mui-component-select-user[residence_country_id]", visible: false).click
        find("li", text: "Snowland").click

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

        find("span", text: /SIGUIENTE/).click

        visit users_wizards_step_nines_choices_path

        click_on("No, pero quiero aprender")

        expect(current_path).to eq(offer_path(offer.id))
        expect(page).to have_text('¡Has aplicado a esta oferta!')
        expect(page).to have_text("¡Has aplicado!")
      end
    end
  end
end
