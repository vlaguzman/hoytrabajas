require 'rails_helper'

RSpec.describe "Like an user looged", type: :feature do
  let(:user)              { create(:user) }
  let!(:curriculum_vitae) { create(:curriculum_vitae, user: user) }

  feature "when try upload profile picture" do
    context "when upload correctly file" do
      scenario "should save picture and see these file in profile", js: true do
        sign_in user

        visit users_profile_path

        find('span.uploadPhoto').click

        attach_file('curriculum_vitae[photo]', Rails.root + "spec/factories/images/photo.jpg", make_visible: true)
        find('span.uploadPhoto').click

        expect(current_path).to eq(users_profile_path)

        curriculum_vitae.reload
        expect(curriculum_vitae.photo.attached?).to be_truthy

        expect(page.find('.profilePicture')['src']).to have_content 'photo.jpg'
      end
    end

    context "when upload incorrectly file" do
      before do
        curriculum_vitae.photo.purge
      end
      context "when big size of image is greather than 2 megabytes" do
        scenario "should not save picture and return specfic error", js: true do
          sign_in user

          visit users_profile_path

          find('span.uploadPhoto').click

          attach_file('curriculum_vitae[photo]', Rails.root + "spec/factories/images/oversize.jpg", make_visible: true)
          find('span.uploadPhoto').click

          expect(current_path).to eq(users_profile_path)

          curriculum_vitae.reload
          expect(curriculum_vitae.photo.attached?).to be_falsey

          expect(page).to have_text("La foto debe pesar maximo 2MB")
        end
      end

      context "when format of image is incorrect" do
        scenario "should not save picture and return specfic error" do
          sign_in user

          visit users_profile_path

          expect(page).to have_field("user[photo]")

          attach_file('user[photo]', Rails.root + "spec/factories/pdfs/diploma.pdf", make_visible: true)

          expect(page).to have_content("Error al cargar la imagen, formato erroneo.")

          expect(current_path).to eq(user_profile_path)
        end
      end
    end
  end
end
