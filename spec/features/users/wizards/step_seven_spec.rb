require 'rails_helper'

RSpec.describe "like new candidate", :type => :feature do
  let(:sign_in_and_visit_step_seven){
    sign_in create(:user, :first_time_candidate)

    visit users_wizards_step_seven_path
  }

  feature "When click on 'No, pero quiero aprender'" do
    it "Should redirect to the expected path", js: true do
      sign_in_and_visit_step_seven

      click_on 'No, pero quiero aprender'

      expect(current_path).to eq(users_wizards_step_nines_choices_path)
    end
  end

  feature "When click on 'Sí, quiero agregarla'" do
    it "Should redirect to the expected path", js: true do
      sign_in_and_visit_step_seven

      click_on 'Sí, quiero agregarla'

      expect(current_path).to eq(users_wizards_step_eight_path)
    end
  end

  feature "When click on 'Omitir'" do
    it "Should redirect to the expected path", js: true do
      sign_in_and_visit_step_seven

      click_on 'Omitir'

      expect(current_path).to eq(users_wizards_step_nines_choices_path)
    end
  end

  feature "When click on 'Regresar'" do
    it "Should redirect to the expected path", js: true do
      sign_in_and_visit_step_seven

      click_on 'Regresar'

      expect(current_path).to eq(users_wizards_step_six_path)
    end
  end

  feature "User want to exit from form" do
    it "Should be able to go home", js: true do
      sign_in_and_visit_step_seven

      has_button?('Inicio')
      click_link_or_button('Inicio')
      expect(current_path).to eq(root_path)
    end
  end

  feature "When user want to see his progress" do
    it "Should see the progress bar with the correct % of completion", js: true do
      sign_in_and_visit_step_seven

      expect( find('.progressBar__bar', visible: false).value.to_i ).to eq((100 / 11 * 8))
    end
  end
end