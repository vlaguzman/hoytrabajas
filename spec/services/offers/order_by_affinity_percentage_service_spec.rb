require 'rails_helper'

RSpec.describe Offers::OrderByAffinityPercentageService do

  let(:temporal_contract) { create(:contract_type) }
  let(:undefined_contract) { create(:contract_type) }
  let(:bogota) { create(:city) }
  let(:car) { create(:vehicle) }
  let(:empaty) { create(:soft_skill) }
  let(:software_development) { create(:job_category) }
  let(:health_and_care) { create(:job_category) }
  let(:monday_to_friday) { create(:working_day) }
  let(:ror_developer) { create(:technical_skill) }

  let!(:offer_25) { create(:offer,
    contract_type: temporal_contract
  ) }

  let!(:offer_45) { create(:offer,
    contract_type: temporal_contract,
    city: bogota,
    vehicles: [car]
  ) }

  let!(:offer_57) { create(:offer,
    contract_type: temporal_contract,
    city: bogota,
    vehicles: [car],
    soft_skills: [empaty]
  ) }

  let!(:offer_71) { create(:offer,
    contract_type: temporal_contract,
    city: bogota,
    vehicles: [car],
    soft_skills: [empaty],
    job_categories: [software_development]
  ) }

  let!(:offer_73) { create(:offer,
    contract_type: temporal_contract,
    city: bogota,
    vehicles: [car],
    soft_skills: [empaty],
    job_categories: [software_development, health_and_care],
    working_days: [monday_to_friday]
  ) }

  let!(:offer_65) { create(:offer,
    contract_type: temporal_contract,
    city: bogota,
    vehicles: [car],
    soft_skills: [empaty],
    job_categories: [software_development, health_and_care],
    working_days: [monday_to_friday]
  ) }

  let!(:dev_ror_skill) { create(:offers_technical_skills, offer: offer_65, technical_skill: ror_developer) }

  let(:user) { create(:user,
    contract_type: temporal_contract,
    city: bogota,
    vehicles: [car],
  ) }

  let(:curriculum) { create(:curriculum_vitae,
    user: user,
    soft_skills: [empaty],
    job_categories: [software_development, health_and_care],
    working_days: [monday_to_friday]
  )}

  let!(:candidate_dev_ror) { create(:curriculum_vitaes_technical_skills,
    curriculum_vitae: curriculum,
    technical_skill: ror_developer
    ) }

  let(:candidate) { curriculum.user }

  describe "#call" do
    context "When recibe a list of offers and a current user" do
      it "Should return an array ordered by affinity %" do
        response = subject.(current_user: candidate, offers: Offer.all)

        expected_offers_list = [
          offer_73,
          offer_71,
          offer_65,
          offer_57,
          offer_45,
          offer_25
        ]

        expect(response).to eq(expected_offers_list)
      end
    end

    context "When does not recibe recibe params" do
      it "Should return a empty array" do
        response = response = subject.()

        expect(response).to match_array([])
      end
    end

    context "When only recibe a offers list and not current user" do
      it "should return the offers in the same order" do
        response = response = subject.(current_user: candidate)

        expect(response).to match_array([])

      end
    end

  end

end