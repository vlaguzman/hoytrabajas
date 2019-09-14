require 'rails_helper'

RSpec.describe "sing up user", type: :feature do                                                                                           
  context "Like a external user, I should get in hoytrabajas.com and see the option 'registarse'" do

    it "User visit home page and click on sign in" do

      visit root_path
    
      expect(page).to have_text("Sign In")
      click_on 'Sign In'

      expect(page).to have_text("Regístrate ahora")
    end


    context  "when I want to sing up with email and password" do
      context "when I looking for a job" do

        it "should redirect to cadidate step zero" do

          visit new_user_registration_path
          fill_in 'user[email]', :with => "candidate@gmail.com"
          fill_in 'user[password]', :with => "1wantt$finda7ob"
          fill_in 'user[password_confirmation]', :with => "1wantt$finda7ob"
          #check 'Candidato'
          click_on 'Registrarme'
          expect(current_path).to eq(users_wizards_step_zero_path)
          save_page("cosito.html")
        end
      end
    end
=begin
    context "I am looking for a candidate" do
      xit "should show a message to the employer" do
        fill_in "email", :with => "employee@gmail.com"
        fill_in "password", :with => "iwanttofindaemployee"
        page.select 'Empleador', from: 'user_role'
        click_button 'crear cuenta'
        expect(page).to have_text("El empleado ideal si existe!")
      end
    end

    context "when I want to sign up with a social network account" do
      context "I want to sing up with Facebook" do
        xit "should send me to a page where I can select my role" do
          expect(page).to have_text("regístrate con")
          page.should have_selector(:link_or_button, 'Facebook')
          expect(page).to have_text("Escoge tu tipo de cuenta")
        end
      end
    end

    context "I want to sing up with Google" do
      xit "should send me to a page where I can select my role" do
        expect(page).to have_text("regístrate con")
        page.should have_selector(:link_or_button, 'Google')
        expect(page).to have_text("Escoge tu tipo de cuenta")
      end
    end
=end
  end
end

