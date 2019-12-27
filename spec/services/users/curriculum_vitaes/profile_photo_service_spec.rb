require 'rails_helper'

RSpec.describe Users::CurriculumVitaes::ProfilePhotoService do

  let(:cv) { create(:curriculum_vitae) }

  describe "When subject does have cv" do
    it "Should be falsy" do
      expect(subject.()).to be_falsy
    end
  end

  context "When user have a profile photo" do

    it "Should return the profile photo path" do
      photo_path = Rails.application.routes.url_helpers.rails_blob_path(cv.photo, disposition: "attachment", only_path: true)

      expect(subject.(curriculum_vitae: cv)).to eq(photo_path)
    end
  end

  describe "User does not have a profile photo" do
      context "When the user is male" do

        it "should return the default male photo" do
          cv.photo = nil
          cv.save

          expect(subject.(curriculum_vitae: cv)).to eq("https://ht-web-images.s3.amazonaws.com/perfiles/avatar-usuario-hombrex3.png")
        end
      end

      context "When the user is female" do
        let(:cv) { create(:curriculum_vitae,
          user: create(:user,
            sex: create(:sex, description: "Femenino")
          )
        ) }

        it "Should return the female defaulto photo" do
          cv.photo = nil
          cv.save

          expect(subject.(curriculum_vitae: cv)).to eq("https://ht-web-images.s3.amazonaws.com/perfiles/avatar-usuario-mujerx3.png")
        end
      end

      context "When the user does not have select sex" do
        let(:cv) { create(:curriculum_vitae,
          user: create(:user,
            sex: nil
          )
        ) }

        it "should return male default photo" do
          cv.photo = nil
          cv.save

          expect(subject.(curriculum_vitae: cv)).to eq("https://ht-web-images.s3.amazonaws.com/perfiles/avatar-usuario-hombrex3.png")
        end
      end

  end

end