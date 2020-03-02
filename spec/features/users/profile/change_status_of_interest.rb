require 'rails_helper'

RSpec.describe "Like a company logged", type: :feature do
  let!(:user)              { create(:user) }
  let!(:company)           { create(:company) }
  let!(:curriculum_vitae)  { create(:curriculum_vitae, user: user) }
  let!(:offer)             { create(:offer, title: "Master chef", company: company) }
  let!(:applied_offer)     { create(:applied_offer, curriculum_vitae: curriculum_vitae, offer: offer) }


  context "When a user visits his profile" do
    it "Should not see the status options", js: true do
      sign_in user

      visit users_profile_path(user_id: user.id)

      expect(page).to have_no_css('.a-statusOptions')
    end
  end

  context "When a company visits an user profile" do
    context "When the user didn't apply to an offer from the company" do
      it "Should not see the status options", js: true do
        sign_in company

        visit users_profile_path(user_id: user.id)
        expect(page).to have_no_css('.a-statusOptions')
      end
    end

    context "When the user applied to an offer from the company" do
      context "When visiting his profile"
        it "Should see the status options when visiting his profile", js: true do
          sign_in company
          visit root_path

          click_on('Ver mi tablero')
          click_on('Master chef')

          expect(page).to have_text(offer.title)

          click_button('Ver perfil')

          expect(page).to have_css('.a-statusOptions')
        end

        it "Should change the status of the applied offer from unseen to seen", js: true do 
          sign_in company
          visit root_path

          click_on('Ver mi tablero')
          click_on('Master chef')

          expect(applied_offer.current_state).to match("unseen")

          click_button('Ver perfil')

          expect(applied_offer.current_state).to match("seen")
        end

        it "Should be able to change the status to interested", js: true do 
          sign_in company
          visit root_path

          click_on('Ver mi tablero')
          click_on('Master chef')

          expect(applied_offer.current_state).to match("unseen")

          click_button('Ver perfil')
          
          expect(applied_offer.current_state).to match("seen")
          
          click_button('Me interesa')

          visit users_profile_path(applied_offer_id: applied_offer.id, user_id: user.id)
          expect(page).to have_tag('div[data-status="interested"]')
        end

        it "Should be able to change the status to not_interested", js: true do 
           sign_in company
          visit root_path

          click_on('Ver mi tablero')
          click_on('Master chef')
          click_button('Ver perfil')
          
          expect(applied_offer.current_state).to match("seen")
          click_button('Descartar')
          
          visit users_profile_path(applied_offer_id: applied_offer.id, user_id: user.id)
          expect(page).to have_tag('div[data-status="not_interested"]')

         end
      end

  end
end