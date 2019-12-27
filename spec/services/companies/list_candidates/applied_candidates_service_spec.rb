require 'rails_helper'

RSpec.describe Companies::ListCandidates::AppliedCandidatesService do

  let(:vehicles) { [create(:vehicle, description: "Moto")] }

  let!(:categories) do
    [
      create(:job_category, description: 'Moda'),
      create(:job_category, description: 'Salud')
    ]
  end

  let(:main_offer) { create(:offer, vehicles: vehicles) }

  let(:curriculum_vitae1) do
    create(:curriculum_vitae,
      job_categories: categories,
      user: create(:user,
        name: 'Alfred',
        last_name: 'Dito',
        vehicles: vehicles,
        residence_city_id: create(:city,
          description: 'La Dorada',
          state: create(:state, description: 'Caldas')
        ).id
      )
    )
  end

  let(:curriculum_vitae2) do
    create(:curriculum_vitae,
      job_categories: categories,
      user: create(:user,
        name: 'Ali',
        last_name: 'Kater',
        residence_city_id: create(:city,
          description: 'Puerto Salgar',
          state: create(:state, description: 'Cundinamarca')
        ).id
      )
    )
  end

  let!(:applied_offer1) { create(:applied_offer, curriculum_vitae: curriculum_vitae1, offer: main_offer) }
  let!(:applied_offer2) { create(:applied_offer, curriculum_vitae: curriculum_vitae2, offer: main_offer) }

  describe "#call" do
    it "shouls return a list of object with te expected data" do

      expected_object = [
        {
          name: 'Alfred Dito',
          location: 'La Dorada, Caldas',
          technical_skills: ['Moda', 'Salud'],
          affinity_percentage: 20,
          profile_path: "/users/profile/#{curriculum_vitae1.user.id}"
        },
        {
          name: 'Ali Kater',
          location: 'Puerto Salgar, Cundinamarca',
          technical_skills: ['Moda', 'Salud'],
          affinity_percentage: 0,
          profile_path:"/users/profile/#{curriculum_vitae2.user.id}"
        },
      ]

      response = subject.(offer: main_offer)

      expect(response).to eq(expected_object)
    end
  end

end