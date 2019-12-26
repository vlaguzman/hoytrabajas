require 'rails_helper'



RSpec.describe "sign in", js: true, type: :feature do
  feature "like a registered user" do
    let(:create_candidate) { create(:user, email: 'candidate@gmail.com', password: '1wantt$finda7ob', confirmed_at: Date.today ) }

    context 'when I visit "HoyTrabajas.com" and click in "sign in candidato"' do
      scenario "Should login me and redirect to my dashboard" do
        create_candidate
        visit root_path

        expect(page).to have_text("Ingresar")
        click_on 'Ingresar'

        expect(page).to have_text(/INICIAR SESIÓN/)

        fill_in 'user[email]', with: "candidate@gmail.com"
        fill_in 'user[password]', with: "1wantt$finda7ob"

        has_button?("Iniciar sesión")
        find(".a-button", text: "Iniciar sesión", visible: false).click

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

        expect(page).to have_text("Ingresar")
        click_on 'Ingresar'

        expect(page).to have_text(/INICIAR SESIÓN/)

        find('span', text:/Empleador/, visible: false).click

        fill_in 'company[email]', with: "company@gmail.com"
        fill_in 'company[password]', with: "1wantt$finda7ob"

        has_button?("Iniciar sesión")
        find(".a-button", text: "Iniciar sesión", visible: false).click

        expect(current_path).to eq(companies_dashboard_path)
      end
    end
  end

end
