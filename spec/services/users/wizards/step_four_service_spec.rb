require 'rails_helper'

RSpec.describe Users::Wizards::StepFourService do

  describe "#call" do
    let(:candidate) { create(:user, :first_time_candidate) }
    let(:new_curriculum_vitae) { create(:curriculum_vitae, user: candidate) }

    context "When the params are valids" do
      let!(:vehicle_ids) do
        [
          create(:vehicle, description: 'Moto').id ,
          create(:vehicle, description: 'Carro').id
        ]
      end

      let!(:driving_licence_ids) do
        [
          create(:driving_licence, description: 'B1').id,
          create(:driving_licence, description: 'B2').id
        ]
      end

      let(:params) do
        {
          city_id: create(:city, description: "Bogota").id,
          vehicle_ids: vehicle_ids,
          driving_licence_ids: driving_licence_ids,
          curriculum_vitae: {
            travel_disponibility: true
          }
        }
      end

      it "Should return a modifiend User" do
        new_curriculum_vitae

        update_candidate = subject.(candidate: candidate, update_params: params)
        update_curriculum = update_candidate.curriculum_vitaes.first

        expect(update_candidate).to be_an_instance_of(User)
        expect(update_candidate.curriculum_vitaes.count).to eq(1)

        expect(update_candidate.city.description).to eq("Bogota")

        expect(update_candidate.vehicles.pluck(:description)).to match_array(["Moto", "Carro"])
        expect(update_candidate.driving_licences.pluck(:description)).to match_array(["B1", "B2"])
        expect(update_curriculum.travel_disponibility).to be_truthy
      end
    end
  end

end