require 'rails_helper'

RSpec.describe "Like new candidate", :type => :feature do
  before do
    create(:nationality, description: "Colombiana")
    create(:document_type, description: "Cedula de Ciudadania")
  end

  let(:candidate) { create(:user, :first_time_candidate, email: "nuevousuario@gmail.com") }

  describe "When visit step one" do
    it "Should show the expected text", js: true do
      sign_in candidate

      visit users_wizards_step_one_path

      expect(page).to have_text("Empecemos por conocernos")
    end
  end

  feature "When im in step one" do
    scenario "Should edit my basic information", js: true do
      sign_in candidate

      visit users_wizards_step_one_path

      fill_in 'candidate[name]', with: 'Carlos'
      fill_in 'candidate[last_name]', with: 'Rojas'

      find("div[id='select-candidate[nationality_ids][]']", visible: false).click
      find("li", text: "Colombiana").click

      find("div[id='select-candidate[document_type_id]']", visible: false).click
      find("li", text: "Cedula de Ciudadania").click

      fill_in "candidate[identification_number]", :with => "1063558224"
      fill_in "candidate[contact_number]", :with => "3183638789"

      execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
      find("span", text: /SIGUIENTE/).click

      candidate.reload

      expect(candidate.name).to eq('Carlos')
      expect(candidate.last_name).to eq('Rojas')
      expect(candidate.document_type.description).to eq('Cedula de Ciudadania')
      expect(candidate.nationalities.last.description).to eq('Colombiana')
      expect(candidate.identification_number).to eq('1063558224')
      expect(candidate.contact_number).to eq('3183638789')
    end
  end
end