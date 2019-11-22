require 'rails_helper'

RSpec.describe "In wizards step six view", type: :feature do

  feature "Like a new candidate" do
    let(:candidate) { create(:user) }

    let!(:create_soft_skils) do
      [
        create(:soft_skill, description: "Seeker"),
        create(:soft_skill, description: "Archer")
      ]
    end

    feature "When dont fill nothing and press 'Siguiente' buttom" do
      scenario "Should redirect to step seven path",js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        click_on 'Siguiente'

        expect(current_path).to eq(users_wizards_step_seven_path)
      end
    end

    feature "When only fill the soft skills sections" do
      scenario "Should add the selected soft to the candidate CV", js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        find("div[id='select-curriculum_vitae[soft_skill_ids][]", visible: false).click
        find("li", text: "Seeker").click

        find("div[id='select-curriculum_vitae[soft_skill_ids][]", visible: false).click
        find("li", text: "Archer").click

        find("span", text: /SIGUIENTE/).click

        expect(candidate.curriculum_vitae.soft_skill_ids.count).to eq(2)
      end
    end

    #TOOD oscar in progress
    feature "When only fill the technical skills section"

    feature "When only fill the to learn skills section"

    feature "When only fill the language section"

    feature "When fill the four sections"
  end
end