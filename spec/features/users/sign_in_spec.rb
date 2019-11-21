require 'rails_helper'

RSpec.describe "User sign in", type: :feature do

  feature "like anonymous user" do
    feature "when enter in sign in path but a I dont have a account" do
      scenario "should see the sign up button 'Registrate'", js: true do
        visit root_path

    
        find('span', text: "SIGN IN CANDIDATO").click

        expect(page).to have_text("¿No tienes una cuenta?")
      end

      scenario "should create account", js: true do
        visit root_path        

        find('span', text:/SIGN IN CANDIDATO/).click
        find('a', text: "Regístrate", visible: false).click

        expect(User.count).to be_zero

        fill_in "user[email]", with: "walter.h.white@meta.com"
        fill_in "user[password]", with: "JesiPickman"
        fill_in "user[password_confirmation]", with: "JesiPickman"

        find('span', text: /Registrarme/).click

        expect(User.count).to eq(1)

        expect(current_path).to eq(users_wizards_step_zero_path)

      end
    end
  end
end