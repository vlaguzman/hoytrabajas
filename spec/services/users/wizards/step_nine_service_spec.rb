require 'rails_helper'

RSpec.describe Users::Wizards::StepNineService do
  describe "#call" do
    let!(:city_id) { build_stubbed(:city).id }
    let(:new_curriculum_vitae) { create(:curriculum_vitae, :new_curriculum_vitae) }

    let(:params) do
      {
        curriculum_vitae:{
          educational_level:{
            degree: "Tecnolo cosas que no interesan",
            institution_name: "Sena",
            start_date: "2017/01/01",
            finish_date: "",
            ongoing_study: "1",
            city_id: "687"
          }
        }
      }
    end

    let(:candidate){ new_curriculum_vitae.user}

    context "When all strong params are valid" do

      it "should return a instace of User" do
        response = subject.(candidate: candidate, update_params: params)

        expect(response).to be_an_instance_of(User)
      end

      it "should create a educational level object" do
        expect(EducationalLevel.count).to eq(0)

        response = subject.(candidate: candidate, update_params: params)

        expect(EducationalLevel.count).to eq(1)
      end

      it "educational level object should be assoc with the cv" do
        response = subject.(candidate: candidate, update_params: params)

        expect(EducationalLevel.find_by(curriculum_vitae_id: new_curriculum_vitae.id)).to be_present
      end
    end

    context "When the title is not present" do
      it "should return a user with errors" do
        params[:curriculum_vitae][:educational_level].tap do |field|
          field[:degree] = nil
        end

        response = subject.(candidate: candidate, update_params: params)

        expect(response.errors.details).to be_present
        expect(response.errors.details).to match_array([[:degree, [{:error=>:blank}]]])
      end

      it "shuould return the errors translate to spanish" do
        params[:curriculum_vitae][:educational_level].tap do |field|
          field[:degree] = nil
        end

        response = subject.(candidate: candidate, update_params: params)

        expect(response.errors.full_messages).to be_present
        expect(response.errors.full_messages).to match_array(["Degree El Titulo Educativo no puede estar vacío"])
      end
    end

  end
end