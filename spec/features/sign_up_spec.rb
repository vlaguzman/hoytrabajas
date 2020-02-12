require 'rails_helper'

RSpec.describe "sign up user", js: true, type: :feature do
  context "Like a external user, I should get in hoytrabajas.com and see the option 'registrarse'" do

    it "User visit home page and click on sign up" do

      visit root_path

      expect(page).to have_text("Registrarme")
      click_on 'Registrarme'

      expect(page).to have_text("Registrarme")
    end

    context "I want to return to the home page" do
      it "should return to the root_path" do

        visit root_path

        expect(page).to have_text("Registrarme")
        click_on 'Registrarme'

        expect(page).to have_text("Regístrate")
        find(".modalCloseIcon__button", match: :first, visible: false).click

        expect(current_path).to eq(root_path)

      end
    end

    context  "when I want to sing up with email and password" do
      context "when I looking for a job" do
        it "should redirect to cadidate step zero" do
          actual_users = User.count

          visit root_path
          expect(page).to have_text("Registrarme")
          click_on 'Registrarme'

          fill_in 'user[email]', :with => "candidate@gmail.com"
          fill_in 'user[password]', :with => "1wantt$finda7ob"
          fill_in 'user[password_confirmation]', :with => "1wantt$finda7ob"

          find('span', text: 'Aceptar términos y condiciones').click

          has_button?("Registrarme")
          find(".a-button", text: "Registrarme", visible: false).click

          expect(User.count).to eq(actual_users + 1)

          expect(current_path).to eq(users_wizards_step_zero_path)
        end
      end

      context "The user already exist" do
        it "should see a message 'Por favor ingrese un correo electróico diferente, ese ya esta en us'" do
          user = FactoryBot.create(:user, email: "user_test@gmail.com", password: "12345678")

          visit root_path
          expect(page).to have_text("Registrarme")
          click_on 'Registrarme'

          fill_in 'user[email]', :with => "user_test@gmail.com"
          fill_in 'user[password]', :with => "12345678"
          fill_in 'user[password_confirmation]', :with => "12345678"

          find('span', text: 'Aceptar términos y condiciones').click
          find(".a-button", text: "Registrarme", visible: false).click

          expect(page).to have_text("Por favor ingrese un correo electrónico diferente, ese ya esta en uso")
        end
      end

      context "The user puts two password different" do
        it "should see an error message" do
          actual_users = User.count

          visit root_path
          click_on 'Registrarme'

          fill_in 'user[email]', :with => "candidate@gmail.com"
          fill_in 'user[password]', :with => "1wantt$finda7ob"
          fill_in 'user[password_confirmation]', :with => "wantt$finda7ob"

          find('span', text: 'Aceptar términos y condiciones').click
          find(".a-button", text: "Registrarme", visible: false).click

          expect(User.count).to eq(actual_users)

          expect(page).to have_text("Su contraseña no coincide con la confirmación, por favor haga que su contraseña se igual a la verificación")
        end
      end

      context "The user select an email than already exists and puts two password differents" do
        it "should see a multiple error message" do
          user = FactoryBot.create(:user, email: "user_test@gmail.com", password: "12345678")
          actual_users = User.count

          visit root_path
          click_on 'Registrarme'

          fill_in 'user[email]', :with => "user_test@gmail.com"
          fill_in 'user[password]', :with => "1wantt$finda7ob"
          fill_in 'user[password_confirmation]', :with => "wantt$finda7ob"

          find('span', text: 'Aceptar términos y condiciones').click
          find(".a-button", text: "Registrarme", visible: false).click

          expect(User.count).to eq(actual_users)

          expect(page).to have_text("Por favor ingrese un correo electrónico diferente, ese ya esta en uso. Su contraseña no coincide con la confirmación, por favor haga que su contraseña se igual a la verificación")
        end
      end
    end

    context  "when I use mail 'gabriel.meneses@hoytrabajas.com' to sing up" do
      context "when I looking for a job" do

        it "should redirect to cadidate step zero" do
          actual_users = User.count

          visit root_path
          expect(page).to have_text("Registrarme")
          click_on 'Registrarme'

          fill_in 'user[email]', :with => "gabriel.meneses@hoytrabajas.com"
          fill_in 'user[password]', :with => "1wantt$finda7ob"
          fill_in 'user[password_confirmation]', :with => "1wantt$finda7ob"

          find('span', text: 'Aceptar términos y condiciones').click

          has_button?("Registrarme")
          find(".a-button", text: "Registrarme", visible: false).click

          expect(User.count).to eq(actual_users + 1)

          expect(current_path).to eq(users_wizards_step_zero_path)

        end
      end
    end

    context "I am looking for a candidate" do
      it "Company visit home page and click on sign in" do

        visit root_path

        expect(page).to have_text("Registrarme")
        click_on 'Registrarme'

        expect(find('h5', text: '¡Hola! Regístrate ahora', visible: false)).to be_present
      end

      context "I want to return to the home page" do
        it "should return to the root_path" do

          visit root_path

          expect(page).to have_text("Registrarme")
          click_on 'Registrarme'

          expect(find('h5', text: '¡Hola! Regístrate ahora', visible: false)).to be_present

          find(".modalCloseIcon__button", match: :first, visible: false).click

          expect(current_path).to eq(root_path)
        end
      end
    end

    context "when company want to sign up with email adn password" do
      context "when company registrate in the website" do

        it "should redirect to company step zero" do

          visit root_path
          expect(page).to have_text("Registrarme")
          click_on 'Registrarme'

          find('span', text:/Empleador/, visible: false).click

          fill_in "company[email]", :with => "employee@gmail.com"
          fill_in "company[password]", :with => "iwanttofindaemployee"
          fill_in 'company[password_confirmation]', :with => "iwanttofindaemployee"

          find('span', text: 'Aceptar términos y condiciones').click

          has_button?("Registrarme")
          find(".a-button", text: "Registrarme", visible: false).click

          expect(Company.count).to eq(1)

          expect(current_path).to eq(companies_first_offer_step_zero_path)
        end
      end
    end

    #context "when I want to sign up with a social network account" do
    #  context "I want to sing up with Facebook" do
    #    xit "should send me to a page where I can select my role" do
    #      expect(page).to have_text("regístrate con")
    #      page.should have_selector(:link_or_button, 'Facebook')
    #      expect(page).to have_text("Escoge tu tipo de cuenta")
    #    end
    #  end
    #end

  end
end

