require 'rails_helper'

RSpec.describe "Like new candidate", :type => :feature do

  def form_field_value(field_name, multiple= nil)
    find("input[name='user[#{field_name}]#{'[]' if multiple}']", visible: false).value
  end

  before do
    create(:nationality, description: "Colombiana")
    create(:document_type, description: "Cedula de Ciudadania")
  end

  describe "When visit step one" do
    let(:candidate) { create(:user) }

    it "Should show the expected text", js: true do
      sign_in candidate

      visit users_wizards_step_one_path

      expect(page).to have_text("Empecemos por conocernos")
    end
  end

  feature "When im in step one" do
    let(:candidate) { create(:user, :first_time_candidate,
      email: "nuevousuario@gmail.com",
      nationalities: []
    ) }

    scenario "Should edit my basic information", js: true do
      sign_in candidate

      visit users_wizards_step_one_path

      fill_in 'user[name]', with: 'Carlos'
      fill_in 'user[last_name]', with: 'Rojas'

      find("div[id='mui-component-select-user[nationality_ids][]']", visible: false).click
      find("li", text: "Colombiana").click

      find("div[id='mui-component-select-user[document_type_id]']", visible: false).click
      find("li", text: "Cedula de Ciudadania").click

      fill_in "user[identification_number]", :with => "1063558224"
      fill_in "user[contact_number]", :with => "3183638789"

      execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
      find("span", text: /SIGUIENTE/).click

      candidate.reload

      expect(candidate.curriculum_vitaes.count).to eq(1)

      expect(candidate.name).to eq('Carlos')
      expect(candidate.last_name).to eq('Rojas')
      expect(candidate.document_type.description).to eq('Cedula de Ciudadania')
      expect(candidate.nationalities.pluck(:description).include?('Colombiana')).to be_truthy
      expect(candidate.identification_number).to eq('1063558224')
      expect(candidate.contact_number).to eq('3183638789')
    end
  end

  feature "When i have saved data" do
    let!(:old_candidate) { create(
      :user,
      nationalities: create_list(:nationality, 2)
    ) }

    scenario "Should show the saved data",js: true do
      sign_in old_candidate

      visit users_wizards_step_one_path

      expect(form_field_value(:name)).to have_content(old_candidate.name)
      expect(form_field_value(:last_name)).to have_content(old_candidate.last_name)
      expect(form_field_value(:nationality_ids, :true)).to have_content(old_candidate.nationality_ids.join(","))
      expect(form_field_value(:document_type_id)).to have_content(old_candidate.document_type.id)
      expect(form_field_value(:identification_number)).to have_content(old_candidate.identification_number)
      expect(form_field_value(:contact_number)).to have_content(old_candidate.contact_number)
    end
  end
end