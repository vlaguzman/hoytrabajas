require 'rails_helper'

RSpec.describe 'In wizards step ten view', type: :feature do

  feature 'Like a new candidate' do
    let(:candidate) { create(:user, :first_time_candidate) }

    feature 'When dont fill only required fields and press Siguiente button' do
      scenario 'Should redirect to step seven path',js: true do
        sign_in candidate

        visit users_wizards_step_ten_path

        fill_in 'acknowledgment[title]', with: 'Valid Title'

        click_on 'Publicar'

        expect(current_path).to eq(users_wizards_step_tens_added_acknowledgment_path(1))
      end

    end

    feature 'When fill the acknowledgement data' do
      scenario 'Should add the new work experience CV', js: true do
        sign_in candidate

        visit users_wizards_step_ten_path

        fill_in 'acknowledgment[title]', with: 'Supa Engineer'

        fill_in 'acknowledgment[entity_name]', with: 'MIT'

        find("input[name='acknowledgment[start_date]']").click
        find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
        find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2000", visible: false).click
        find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "23").click
        click_on 'OK'

        attach_file("acknowledgment[diploma]", Rails.root + "spec/factories/pdfs/diploma.pdf" )

        find("span", text: /PUBLICAR/).click

        expect(candidate.curriculum_vitae.acknowledgments.count).to eq(1)

        added_acknowledgment = candidate.curriculum_vitae.acknowledgments.last

        expect(added_acknowledgment.title).to eq('Supa Engineer')
        expect(added_acknowledgment.entity_name).to eq('MIT')
        expect(added_acknowledgment.start_date).to eq(Date.new(2000, Date.today.month, 23))
        expect(added_acknowledgment.diploma).to be_present
      end
    end

  end
end
