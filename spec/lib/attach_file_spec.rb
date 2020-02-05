require 'rails_helper'

RSpec.describe AttachFile do

  describe "#upload_record_file" do
    let!(:user) { create(:user) }
    let(:file)  { Rack::Test::UploadedFile.new(Rails.root + "spec/factories/pdfs/diploma.pdf", 'application/pdf') }
    let(:photo) { Rack::Test::UploadedFile.new(Rails.root + "spec/factories/images/photo.jpg", 'application/jpg') }

    context "When the candidate's curriculum vitae must be uploaded" do
      it "Should associate the cv with the user" do
        response = AttachFile.upload_record_file(user.curriculum_vitae, :file_cv, file)

        expect(response).to be_truthy
      end
    end

    context "When the photo should be uploaded candidate profile" do
      it "Should associate the phote with the user" do
        response = AttachFile.upload_record_file(user.curriculum_vitae, :photo, photo)

        expect(response).to be_truthy
      end
    end
  end

end
