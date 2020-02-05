require 'rails_helper'

RSpec.describe "Like an user looged", type: :feature do
  let(:user) { create(:user) }

  feature "when try upload profile picture" do
    context "when upload correctly file" do
      scenario "should save picture and see these file in profile" do
        sign_in user

        visit users_profile_path

        expect(page).to have_field("user[photo]")

        attach_file('user[photo]', Rails.root + "spec/factories/images/photo.jpg", make_visible: true)


        expect(current_path).to eq(user_profile_path)

        expect(user.photo.attached?).to thruty

        expect(page).to have_css("#photo_profile_#{user.id}")
      end
    end

    context "when upload incorrectly file" do
      context "when big size of image is greather than 5 megabytes" do
        scenario "should not save picture and return specfic error" do
          sign_in user

          visit users_profile_path

          expect(page).to have_field("user[photo]")

          attach_file('user[photo]', Rails.root + "spec/factories/images/photo_6MB.jpg", make_visible: true)

          expect(page).to have_content("Error al cargar la imagen, la foto debe pesar maximo 5MB.")

          expect(current_path).to eq(user_profile_path)
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
