require 'rails_helper'

RSpec.describe Companies::ListCandidates::AppliedCandidatesService do

  let(:vehicles) { [create(:vehicle, description: "Moto")] }

  let(:technical_skills) { [
    create(:technical_skill, description: "PHP"),
    create(:technical_skill, description: "Ruby")
  ] }

  let(:main_offer) { create(:offer, vehicles: vehicles) }

  let(:curriculum_vitae1) do
    create(:curriculum_vitae, :empty,
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

  let!(:skill_1) do
    create(:curriculum_vitaes_technical_skills, curriculum_vitae: curriculum_vitae1, technical_skill: technical_skills[0])
    create(:curriculum_vitaes_technical_skills, curriculum_vitae: curriculum_vitae1, technical_skill: technical_skills[1])
  end

  let(:curriculum_vitae2) do
    cv = create(:curriculum_vitae, :empty,
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

  let!(:skill_2) do
    create(:curriculum_vitaes_technical_skills, curriculum_vitae: curriculum_vitae2, technical_skill: technical_skills[1])
  end

  let!(:applied_offer1) { create(:applied_offer, curriculum_vitae: curriculum_vitae1, offer: main_offer) }
  let!(:applied_offer2) { create(:applied_offer, curriculum_vitae: curriculum_vitae2, offer: main_offer) }

  describe "#call" do
    it "shouls return a list of object with te expected data" do

      expected_object = [
        {
          name: 'Alfred Dito',
          location: 'La Dorada, Caldas',
          technical_skills: "PHP, Ruby",
          affinity_percentage: 27,
          profile_path: "/users/profile?applied_offer_id=#{applied_offer1.id}&user_id=#{curriculum_vitae1.user.id}",
          avatar: Rails.application.routes.url_helpers.rails_blob_path(curriculum_vitae1.photo, disposition: "attachment", only_path: true)
        },
        {
          name: 'Ali Kater',
          location: 'Puerto Salgar, Cundinamarca',
          technical_skills: "Ruby",
          affinity_percentage: 0,
          profile_path:"/users/profile?applied_offer_id=#{applied_offer2.id}&user_id=#{curriculum_vitae2.user.id}",
          avatar: Rails.application.routes.url_helpers.rails_blob_path(curriculum_vitae2.photo, disposition: "attachment", only_path: true)
        },
      ]

      response = subject.(offer: main_offer)

      expect(response).to eq(expected_object)
    end
  end

  describe '#profile_path' do
    it "should return a correct path just receiving the user_id" do
      response = subject.profile_path(curriculum_vitae1.user.id)

      expect(response).to eq("/users/profile?user_id=#{curriculum_vitae1.user.id}")
    end
  end

end
