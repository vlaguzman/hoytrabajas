require 'rails_helper'

def skip_under_construction
  find("button[id='home-welcome-modal']", visible: false).click
  execute_script "window.scrollTo(0, (window.innerHeight * 2))"
end

RSpec.describe "sign in", js: true, type: :feature do
  feature "like a registered user" do
    let(:create_candidate) { create(:user, email: 'candidate@gmail.com', password: '1wantt$finda7ob', confirmed_at: Date.today ) }

    context 'when I visit "HoyTrabajas.com" and click in "sign in candidato"' do
      scenario "Should login me and redirect to my dashboard" do
        create_candidate

        visit root_path

        skip_under_construction

        expect(page).to have_text("SIGN IN CANDIDATO")
        click_on 'SIGN IN CANDIDATO'

        
        expect(page).to have_text(/INICIAR SESIÓN/)

        fill_in 'user[email]', with: "candidate@gmail.com"
        fill_in 'user[password]', with: "1wantt$finda7ob"

        click_on 'Iniciar sesión'

        expect(current_path).to eq(users_dashboard_path)
      end
    end
  end

  feature "like a registered company" do
    let(:create_company) { create(:company, email: 'company@gmail.com', password: '1wantt$finda7ob', confirmed_at: Date.today ) }

    context 'when I visit "HoyTrabajas.com" and click in "sign in compañia"' do
      scenario "Should login me and redirect to my dashboard" do
        company = create_company

        visit root_path

        skip_under_construction

        expect(page).to have_text("SIGN IN EMPRESA")
        click_on 'SIGN IN EMPRESA'

        
        expect(page).to have_text(/INICIAR SESIÓN/)

        fill_in 'company[email]', with: "company@gmail.com"
        fill_in 'company[password]', with: "1wantt$finda7ob"

        click_on 'Iniciar sesión'

        expect(current_path).to eq(company_path(company))
      end
    end
  end

end