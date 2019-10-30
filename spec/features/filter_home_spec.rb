require 'rails_helper'

RSpec.describe "User searches for an offer", type: :feature do
  context "When user search of offer" do
    let!(:offer) { create(:offer, title: "Test sebas") }
    let!(:offer1) { create(:offer, title: "Esto es un prueba de sebas") }
    let!(:offer2) { create(:offer, title: "Que gran oferta sebas!") }

    it "Should return offers related", js: true do
      visit root_path

      expect(page).to have_content("El empleo ideal para tu tiempo libre")

      expect(page).to have_tag(:form, with: { class: "row justify-content-around" }) do
        with_tag(:input, with: { name: 'q[title_cont]'})
      end

      fill_in('q[title_cont]', with: 'sebas')
      find("button[class='MuiButtonBase-root MuiFab-root mb-10 search_button text-white MuiFab-primary']", visible: false).click

      #This expect is done like this because capybara doesn't understand query strings
      expect(current_path).to eq("#{offers_path}/")

      expect(page).to have_content("Test Sebas")
      expect(page).to have_content("Esto Es Un Prueba De Sebas")
      expect(page).to have_content("Que Gran Oferta Sebas!")
    end
  end
end
