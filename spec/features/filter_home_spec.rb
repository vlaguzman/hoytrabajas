require 'rails_helper'

RSpec.describe "User searches for an offer", type: :feature, js: true do
  context "When user search of offer" do
    it "Should return offers related" do
      visit root_path

      expect(page).to have_content("El empleo ideal para tu tiempo libre")

      expect(page).to have_tag(:form, with: { class: "row justify-content-around" }) do
        with_tag(:input, with: { name: 'q[title_cont]'})
      end

      save_screenshot('home.jpg')

      fill_in("input[name='q[title_cont]']", with: "Test", visible: false)
    end
  end
end
