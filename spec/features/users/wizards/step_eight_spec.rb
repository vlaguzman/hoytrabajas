require 'rails_helper'

RSpec.describe "In wizards step eight view", type: :feature do

  before do
    create(:job_category, description: "Sales")
    create(:job_category)
    create(:work_position, description: "Dev RoR")
    create(:work_position)
    create(:work_methodology, description: "Full Time")
    create(:work_methodology)
    create(:technical_skill, description: "Play videogames every day")
    create(:technical_skill)
    create(:city, description: "Neverland City", state: create(:state, description: 'Neverland North'))
    create(:city)
  end

  feature "Like a new candidate" do
    let(:candidate) { create(:user, :first_time_candidate) }

    feature "When dont fill nothing and press 'Siguiente' button" do
      scenario "Should redirect to step seven path",js: true do
        sign_in candidate

        visit users_wizards_step_eight_path

        find("div[id='mui-component-select-work_experience[job_category_id]']", visible: false).click
        find("li", text: "Sales").click

        find("input[id='work_experience[work_position]']", visible: false).click
        find("li", text: "Dev RoR").click

        click_on 'Continuar'

        expect(current_path).to eq(users_wizards_step_eights_added_work_experience_path(1))
      end
    end

    feature "When only fill the work experience data" do
      scenario "Should add the new work experience CV", js: true do
        sign_in candidate

        visit users_wizards_step_eight_path

        fill_in "work_experience[company_name]", with: 'Hoy Trabajas'

        find("div[id='mui-component-select-work_experience[job_category_id]']", visible: false).click
        find("li", text: "Sales").click

        find("input[id='work_experience[work_position]']", visible: false).click
        find("li", text: "Dev RoR").click

        find("div[id='mui-component-select-work_experience[work_methodology_id]']", visible: false).click
        find("li", text:  "Full Time").click

        find("div[id='mui-component-select-work_experience[state_id]']", visible: false).click
        find("li", text:  "Neverland North").click

        find("div[id='mui-component-select-work_experience[city_id]']", visible: false).click
        find("li", text:  "Neverland City").click

        find("input[id='work_experience[technical_skills]']", visible: false).click
        find("li", text: "Play videogames every day").click

        find("input[name='work_experience[started_at]']").click
        find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
        find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2000", visible: false).click
        find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "23").click
        click_on "OK"

        find("input[name='work_experience[finished_at]']").click
        find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
        find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2010", visible: false).click
        find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "12").click
        click_on "OK"

        find("span", text: /CONTINUAR/).click

        expect(candidate.curriculum_vitae.work_experiences.count).to eq(1)

        added_work_experience = candidate.curriculum_vitae.work_experiences.last

        expect(added_work_experience.company_name).to eq('Hoy Trabajas')
        expect(added_work_experience.job_category.description).to eq('Sales')
        expect(added_work_experience.work_position.description).to eq('Dev RoR')
        expect(added_work_experience.work_methodology.description).to eq('Full Time')
        expect(added_work_experience.city.description).to eq('Neverland City')
        expect(added_work_experience.technical_skills.last.description).to eq('Play videogames every day')

        expect(added_work_experience.started_at).to eq(Date.new(2000, Date.today.month, 23))
        expect(added_work_experience.finished_at).to eq(Date.new(2010, Date.today.month, 12))
        expect(added_work_experience.still_in_progress).to be_falsy
      end
    end

    feature "When user want to go exit form" do
      it "Should be able to go home", js: true do
        sign_in candidate
        visit users_wizards_step_eight_path
    
        click_link_or_button('Inicio')
        expect(current_path).to eq(root_path)
      end
    end

    feature "When user want to see his progress" do
      it "Should see the progress bar with the correct % of completion", js: true do
        sign_in candidate
        visit users_wizards_step_eight_path
  
        expect( find('.progressBar__bar', visible: false).value.to_i ).to eq((100 / 11 * 9))
      end
    end

  end
end
