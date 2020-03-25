require "rails_helper"

RSpec.describe Offers::Organizer::AffinityPercentageSorter do

  describe "#call" do

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

    let!(:offer_on_demand) { create(:offer_on_demand, offer: offer_57) }

    let(:offer_ids_lists) { Offers::Organizer::ListBuilder.() }
    let(:offer_attributes_lists) { Offers::Organizer::DetailsBuilder.(offer_ids_lists: offer_ids_lists) }

    context "when curriculum vitae present" do
      it "should return sorted by affinity percentage" do
        response = subject.(curriculum_vitae: curriculum, offer_attributes_lists: offer_attributes_lists)

        join_response = [*response[response.keys[0]], *response[response.keys[1]]]

        expect(join_response.pluck(:affinity_percentage)).to eq([57, 71, 65, 25])

        expected_keys = [
          :title, :immediate_start, :description, :required_experience, :confidential,
          :offer, :id, :job_category_image, :city, :salary, :company, :close_date, :on_demand,
          :affinity_percentage, :applied_offers, :raw_close_date
        ]

        expect(join_response.last.keys).to match_array(expected_keys)
      end
    end

    context "when curriculum vitae is nil" do
      it "should return sorted by affinity percentage" do
        response = subject.(offer_attributes_lists: offer_attributes_lists)

        join_response = [*response[response.keys[0]], *response[response.keys[1]]]

        expect(join_response.pluck(:affinity_percentage)).to match_array([nil, nil, nil, nil])
        expect(join_response.pluck(:id)).to eq([offer_57.id, offer_65.id, offer_71.id, offer_25.id])

        expected_keys = [
          :title, :immediate_start, :description, :required_experience, :confidential,
          :offer, :id, :job_category_image, :city, :salary, :company, :close_date, :on_demand,
          :affinity_percentage, :applied_offers, :raw_close_date
        ]

        expect(join_response.last.keys).to match_array(expected_keys)
      end
    end
  end

end