require 'rails_helper'

RSpec.describe Users::Wizards::StepZero::CurriculumVitaeService do

  describe "#upload_curriculum_vitae" do
    let!(:user) { create(:user) }
    let(:file) {Rack::Test::UploadedFile.new(Rails.root + "spec/factories/pdfs/diploma.pdf", 'application/pdf')}

    context "When a resume should be uploaded to the user" do
      it "Should associate the resume with the user" do
        response = Users::Wizards::StepZero::CurriculumVitaeService.upload_curriculum_vitae(user, file)

        expect(response).to be_truthy
      end
    end
  end

end
