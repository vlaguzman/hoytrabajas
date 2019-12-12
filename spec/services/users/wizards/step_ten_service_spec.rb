require 'rails_helper'

RSpec.describe Users::Wizards::StepTenService do
  describe "#call" do
    let!(:city_id) { build_stubbed(:city).id }
    let(:new_curriculum_vitae) { create(:curriculum_vitae, :empty) }

    let(:params) do
      {
        curriculum_vitae:{
          acknowledgment: {
            title: "Tecnico en cocina",
            start_date: "2017/01/01",
            entity_name: "Sena"
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

      it "should create a acknowledgment object" do
        expect(Acknowledgment.count).to eq(0)

        response = subject.(candidate: candidate, update_params: params)

        expect(Acknowledgment.count).to eq(1)
      end

      it "acknowledgment object should be assoc with the cv" do
        response = subject.(candidate: candidate, update_params: params)

        expect(Acknowledgment.find_by(curriculum_vitae_id: new_curriculum_vitae.id)).to be_present
      end
    end
  end
end