require 'rails_helper'

RSpec.describe "like new candidate", :type => :feature do
  let(:sign_in_and_visit_step_seven){
    sign_in create(:user, :first_time_candidate)

    visit users_wizards_step_seven_path
  }

  feature "When click on 'No pero con disposición'" do
    it "Should redirect to the expected path", js: true do
      sign_in_and_visit_step_seven

      click_on 'No pero con disposición'

      expect(current_path).to eq(users_wizards_step_nine_path)
    end
  end

  feature "When click on 'Siguiente'" do
    it "Should redirect to the expected path", js: true do
      sign_in_and_visit_step_seven

      click_on 'Siguiente'

      expect(current_path).to eq(users_wizards_step_eight_path)
    end
  end

  feature "When click on 'Saltar'" do
    it "Should redirect to the expected path", js: true do
      sign_in_and_visit_step_seven

      click_on 'Saltar'

      expect(current_path).to eq(users_wizards_step_nine_path)
    end
  end

  feature "When click on 'Regresar'" do
    it "Should redirect to the expected path", js: true do
      sign_in_and_visit_step_seven

      click_on 'Regresar'

      expect(current_path).to eq(users_wizards_step_six_path)
    end
  end
end