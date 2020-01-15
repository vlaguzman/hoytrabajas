require 'rails_helper'

RSpec.describe "In wizards step six view", type: :feature do

  before do
    create(:soft_skill, description: "Seeker")
    create(:soft_skill, description: "Archer")

    create(:language, description: "Spanish")

    create(:level, description: "Expert")
  end

  feature "Like a new candidate" do
    let(:candidate) { create(:user, :first_time_candidate) }

    feature "When fill only required fields and press 'Siguiente' button" do
      scenario "Should redirect to step seven path",js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        find("div[id='mui-component-select-curriculum_vitae[soft_skill_ids][]", visible: false).click
        find("li", text: "Archer").click

        find("span", text: /SIGUIENTE/).click

        expect(current_path).to eq(users_wizards_step_seven_path)
      end
    end

    describe "When the required fields does not filled", js: true do
      it "Should return a errors message" do
        sign_in candidate

        visit users_wizards_step_six_path

        find("span", text: /SIGUIENTE/).click

        expect(page).to have_text('* Debes seleccionar por lo menos una habilidad en tu perfil, este campo no puede estar vacío.')
      end
    end

    feature "When only fill the soft skills sections" do
      scenario "Should add the selected soft to the candidate CV", js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        find("div[id='mui-component-select-curriculum_vitae[soft_skill_ids][]", visible: false).click
        find("li", text: "Seeker").click

        find("div[id='mui-component-select-curriculum_vitae[soft_skill_ids][]", visible: false).click
        find("li", text: "Archer").click

        find("span", text: /SIGUIENTE/).click

        expect(candidate.curriculum_vitae.soft_skill_ids.count).to eq(2)
      end
    end

    feature "When only fill the technical skills section" do
      it "Should add the select technical skills to cv", js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        #TODO Oscar complete when the tech skills selector will be able

        find("span", text: /SIGUIENTE/).click

        expect(candidate.curriculum_vitae.strong_skills.count).to eq(0)
      end
    end

    feature "When only fill the to learn skills section" do
      it "Should add the to learn skills to CV", js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        #TODO Oscar complete when the tech skills selector will be able

        find("span", text: /SIGUIENTE/).click

        expect(candidate.curriculum_vitae.to_learn_skills.count).to eq(0)
      end
    end

    feature "When only fill the language section" do
      scenario "Should add the selected lenguages to CV", js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        find("div[id='mui-component-select-language_id']", visible: false).click
        find("li", text: "Spanish").click

        find("div[id='mui-component-select-level_id']", visible: false).click
        find("li", text: "Expert").click

        find("span", text: /SIGUIENTE/).click

        expect(candidate.curriculum_vitae.strong_languages.count).to eq(1)
      end
    end

  end
end
