require 'rails_helper'

RSpec.describe 'In wizards step nine view', type: :feature do

  before do
    create(:city, description: 'Neverland City')
    create(:city)
  end

  feature 'Like a new candidate' do
    let(:candidate) { create(:user, :first_time_candidate) }

    feature 'When dont fill only required fields and press Siguiente button' do
      scenario 'Should redirect to step seven path',js: true do
        sign_in candidate

        visit users_wizards_step_nine_path

        fill_in 'educational_level[degree]', with: 'Supa Engineer'

        click_on 'Continuar'

        expect(current_path).to eq(users_wizards_step_nines_added_educational_level_path(1))
      end
    end

    feature 'When  fill the educational level data' do
      scenario 'Should add the new work experience CV', js: true do
        sign_in candidate

        visit users_wizards_step_nine_path

        fill_in 'educational_level[degree]', with: 'Supa Engineer'

        fill_in 'educational_level[institution_name]', with: 'MIT'

        find("input[name='educational_level[start_date]']").click
        find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
        find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2000", visible: false).click
        find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "23").click
        click_on 'OK'

        find("input[name='educational_level[finish_date]']").click
        find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
        find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2018", visible: false).click
        find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "30").click
        click_on 'OK'

        attach_file("educational_level[diploma]", Rails.root + "spec/factories/pdfs/diploma.pdf" )

        find("span", text: /CONTINUAR/).click

        expect(candidate.curriculum_vitae.educational_levels.count).to eq(1)

        added_educational_level = candidate.curriculum_vitae.educational_levels.last

        expect(added_educational_level.degree).to eq('Supa Engineer')
        expect(added_educational_level.institution_name).to eq('MIT')
        expect(added_educational_level.start_date).to eq(Date.new(2000, Date.today.month, 23))
        expect(added_educational_level.finish_date).to eq(Date.new(2018, Date.today.month, 30))
        expect(added_educational_level.diploma).to be_present
        expect(added_educational_level.ongoing_study).to be_falsy
      end
    end

    feature "When user want to go exit form" do
      it "Should be able to go home", js: true do
        sign_in candidate
        visit users_wizards_step_nine_path
    
        click_link_or_button('Inicio')
        expect(current_path).to eq(root_path)
      end
    end

  end
end
