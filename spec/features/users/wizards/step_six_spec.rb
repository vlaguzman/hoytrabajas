require 'rails_helper'

RSpec.describe "In wizards step six view", type: :feature do

  before do
    create(:soft_skill, description: "Seeker")
    create(:soft_skill, description: "Archer")

    create(:job_category, description: 'Home and Garden')

    create(:technical_skill, description: "Magichian")
    create(:technical_skill, description: "Warrior")

    create(:language, description: "Spanish")

    create(:level, description: "Expert")
  end

  feature "Like a new candidate" do
    let(:candidate) { create(:user, :first_time_candidate) }

    describe "When the required fields does not filled" do
      it "Should return a errors message", js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        find("span", text: /SIGUIENTE/).click

        expect(page).to have_text('* Debes seleccionar por lo menos una habilidad en tu perfil, este campo no puede estar vacío')
        expect(page).to have_text('* Debes definir por lo menos una técnica en tu perfil, este grupo de valores no puede estar vacío')
      end

      describe "The user send an existing techskil" do
        it "Should return the techskills error", js: true do
          sign_in candidate

          visit users_wizards_step_six_path

          find("div[id='mui-component-select-curriculum_vitae[soft_skill_ids][]", visible: false).click
          find("li", text: "Archer").click

          within "#techicalSkillsRowsWrapper" do
            find("input[name='technical_skill_description']").set('warrior')

            find('div#mui-component-select-job_category_id').click
          end
          find("li", text: "Home and Garden").click

          within "#techicalSkillsRowsWrapper" do
            find('div#mui-component-select-level_id').click
          end
          find("li", text: "Expert").click

          find("span", text: /SIGUIENTE/).click

          expect(page).to have_text('* Una de las habilidades tecnicas que quieres agregar, ya esta en la lista y la puedes seleccionar, no permitimos valores repetidos')
        end
      end
    end

    feature "When fill only required fields and press 'Siguiente' button" do
      scenario "Should redirect to step seven path",js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        find("div[id='mui-component-select-curriculum_vitae[soft_skill_ids][]", visible: false).click
        find("li", text: "Archer").click

        within "#techicalSkillsRowsWrapper" do
          find('div#mui-component-select-job_category_id').click
        end
        find("li", text: "Home and Garden").click

        within "#techicalSkillsRowsWrapper" do
          find("input[name='technical_skill_description']").set('Warrior')
          find('div#mui-component-select-level_id').click
        end
        find("li", text: "Expert").click

        find("span", text: /SIGUIENTE/).click

        expect(current_path).to eq(users_wizards_step_seven_path)
      end
    end

    feature "When only fill the technical skills section" do
      context "When write an existing technical skill" do
        it "should return the error", js: true do
          sign_in candidate

          visit users_wizards_step_six_path

          find("div[id='mui-component-select-curriculum_vitae[soft_skill_ids][]", visible: false).click
          find("li", text: "Archer").click

          within "#toLearnSkillsRowsWrapper" do
            find("input[name='technical_skill_description']").set('warrior')

            find('div#mui-component-select-job_category_id').click
          end
          find("li", text: "Home and Garden").click

          find("span", text: /SIGUIENTE/).click

          expect(page).to have_text('* Una de las habilidades tecnicas a aprender que quieres agregar, ya esta en la lista y la puedes seleccionar, no permitimos valores repetidos')
        end
      end
    end

    feature "When only fill the to learn skills section" do
      it "Should add the to learn skills to CV", js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        find("div[id='mui-component-select-curriculum_vitae[soft_skill_ids][]", visible: false).click
        find("li", text: "Archer").click

        within "#toLearnSkillsRowsWrapper" do
          find('div#mui-component-select-job_category_id').click
        end
        find("li", text: "Home and Garden").click

        within "#toLearnSkillsRowsWrapper" do
          find("input[name='technical_skill_description']").set('magichian')
        end

        find("span", text: /SIGUIENTE/).click

        expect(page).to have_content('* Una de las habilidades tecnicas a aprender que quieres agregar, ya esta en la lista y la puedes seleccionar, no permitimos valores repetidos')
      end
    end

    feature "When only fill the language section" do
      scenario "Should add the selected lenguages to CV", js: true do
        sign_in candidate

        visit users_wizards_step_six_path

        find("div[id='mui-component-select-language_id']", visible: false).click
        find("li", text: "Spanish").click

        within "#languagesRowsWrapper" do
          find("div[id='mui-component-select-level_id']", visible: false).click
        end
        find("li", text: "Expert").click

        find("span", text: /SIGUIENTE/).click

        expect(candidate.curriculum_vitae.strong_languages.count).to eq(1)
      end
    end

    feature "User want to exit from form" do
      it "Should be able to go home", js: true do
        sign_in candidate
        visit users_wizards_step_six_path

        has_button?('Inicio')
        click_link_or_button('Inicio')
        expect(current_path).to eq(root_path)
      end
    end

    feature "When user want to see his progress" do
      it "Should see the progress bar with the correct % of completion", js: true do
        sign_in candidate
        visit users_wizards_step_six_path
  
        expect( find('.progressBar__bar', visible: false).value.to_i ).to eq((100 / 11 * 7))
      end
    end

  end
end
