require 'rails_helper'



RSpec.describe "sign up user", js: true,  type: :feature do
  context "Like a external user, I should get in hoytrabajas.com and see the option 'registrarse'" do

    it "User visit home page and click on sign up" do

      visit root_path

      

      expect(page).to have_text("SIGN UP CANDIDATO")
      click_on 'SIGN UP CANDIDATO'

      expect(page).to have_text("Regístrate")
    end

    context "I want to return to the home page" do
      it "should return to the root_path" do

        visit root_path

        

        expect(page).to have_text("SIGN UP CANDIDATO")
        click_on 'SIGN UP CANDIDATO'

        expect(page).to have_text("Regístrate")
        find(".modal--close-icon", match: :first, visible: false).click

        expect(current_path).to eq(root_path)

      end
    end

    context  "when I want to sing up with email and password" do
      context "when I looking for a job" do

        it "should redirect to cadidate step zero" do
          actual_users = User.count

          visit root_path
          expect(page).to have_text("SIGN UP CANDIDATO")
          click_on 'SIGN UP CANDIDATO'

          fill_in 'user[email]', :with => "candidate@gmail.com"
          fill_in 'user[password]', :with => "1wantt$finda7ob"
          fill_in 'user[password_confirmation]', :with => "1wantt$finda7ob"

          click_on 'Registrarme'

          expect(User.count).to eq(actual_users + 1)

          expect(current_path).to eq(users_wizards_step_zero_path)

        end
      end
    end

    context  "when I use mail 'gabriel.meneses@hoytrabajas.com' to sing up" do
      context "when I looking for a job" do

        it "should redirect to cadidate step zero" do
          actual_users = User.count

          visit root_path
          expect(page).to have_text("SIGN UP CANDIDATO")
          click_on 'SIGN UP CANDIDATO'

          fill_in 'user[email]', :with => "gabriel.meneses@hoytrabajas.com"
          fill_in 'user[password]', :with => "1wantt$finda7ob"
          fill_in 'user[password_confirmation]', :with => "1wantt$finda7ob"

          click_on 'Registrarme'

          expect(User.count).to eq(actual_users + 1)

          expect(current_path).to eq(users_wizards_step_zero_path)

        end
      end
    end

    context "I am looking for a candidate" do

      it "Company visit home page and click on sign in" do

        visit root_path

        expect(page).to have_text("SIGN UP EMPRESA")
        click_on 'SIGN UP EMPRESA'

        expect(page).to have_text("Regístrate")

      end

      context "I want to return to the home page" do
        it "should return to the root_path" do

          visit root_path

          

          expect(page).to have_text("SIGN UP EMPRESA")
          click_on 'SIGN UP EMPRESA'

          expect(page).to have_text("Regístrate")

          find(".modal--close-icon", match: :first, visible: false).click

          expect(current_path).to eq(root_path)
        end
      end
    end


    context "when company want to sign up with email adn password" do
      context "when company registrate in the website" do

        it "should redirect to company step zero" do

          visit root_path
          expect(page).to have_text("SIGN UP EMPRESA")
          click_on 'SIGN UP EMPRESA'

          fill_in "company[email]", :with => "employee@gmail.com"
          fill_in "company[password]", :with => "iwanttofindaemployee"
          fill_in 'company[password_confirmation]', :with => "iwanttofindaemployee"

          click_button 'Registrarme'

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

    #context "I want to sing up with Google" do
    #  xit "should send me to a page where I can select my role" do
    #    expect(page).to have_text("regístrate con")
    #    page.should have_selector(:link_or_button, 'Google')
    #    expect(page).to have_text("Escoge tu tipo de cuenta")
    #  end
    #end
  end
end

