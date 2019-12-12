require 'rails_helper'

RSpec.describe Users::Wizards::StepNineService do
  describe "#call" do
    let!(:city_id) { build_stubbed(:city).id }
    let(:cv_empty) { create(:curriculum_vitae, :empty) }

    let(:params) do
      {
        degree: "Tecnolo cosas que no interesan",
        institution_name: "Sena",
        start_date: "30/12/2017",
        finish_date: "",
        ongoing_study: "1",
        city_id: city_id
      }
    end

    let(:new_educational_level) { build(:educational_level, :empty, curriculum_vitae: cv_empty) }

    context "When all strong params are valid" do
      it "should return a instace of User" do
        response, updated = subject.(educational_level: new_educational_level, update_params: params)

        expect(response).to be_an_instance_of(EducationalLevel)
        expect(updated).to be_truthy
      end

      it "should create a educational level object" do
        expect(EducationalLevel.count).to eq(0)

        subject.(educational_level: new_educational_level, update_params: params)

        expect(EducationalLevel.count).to eq(1)
      end

      it "educational level object should be assoc with the cv" do
        response, = subject.(educational_level: new_educational_level, update_params: params)

        expect(EducationalLevel.find_by(curriculum_vitae_id: response.curriculum_vitae.id)).to be_present
      end
    end

    context 'When the title is not present' do
      it 'should return a user with errors' do
        params.tap do |field|
          field[:degree] = nil
        end

        response, updated = subject.(educational_level: new_educational_level, update_params: params)

        expect(updated).to be_falsy
        expect(response.errors.details).to be_present
        expect(response.errors.details).to match_array([[:degree, [{:error=>:blank}]]])
      end

      it 'shuould return the errors translate to spanish' do
        params.tap do |field|
          field[:degree] = nil
        end

        response, = subject.(educational_level: new_educational_level, update_params: params)

        expect(response.errors.full_messages).to be_present
        expect(response.errors.full_messages).to match_array(['Degree El Titulo Educativo no puede estar vacío'])
      end
    end

  end
end