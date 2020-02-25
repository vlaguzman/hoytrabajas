require "rails_helper"

RSpec.describe AffinityCalculator do
  let(:contract_type)       { create(:contract_type, description: "Indefinido")}
  let(:city)                { create(:city, description: "Cali")}
  let(:vehicles)            { [create(:vehicle, description: "Moto")] }
  let(:vehicles_b)          { [vehicles.first, create(:vehicle, description: "Carro")] }
  let(:soft_skills)         { [create(:soft_skill, description: "Empatia")] }
  let(:job_categories)      { [create(:job_category)] }
  let(:working_days)        { [create(:working_day)] }

  let(:empty_offer)          { create(:empty_offer, title: "empty_offer", description: 'a description') }
  let(:the_offer)            { create(:offer, title: "the_offer") }
  let(:relations_offer)      { create(:offer, title: "relations_offer", vehicles: vehicles, soft_skills: soft_skills) }
  let(:offer_contract)       { create(:empty_offer, contract_type: contract_type, description: 'a description')}
  let(:offer_vehicles)       { create(:empty_offer, vehicles: vehicles, description: 'a description')}
  let(:offer_soft_skills)    { create(:empty_offer, description: 'a description', city_id: city.id, soft_skills: soft_skills, vehicles: vehicles)}

  let(:empty_user)          { create(:user, :first_time_candidate, name: "empty_user") }
  let(:the_user)            { create(:user, name: "arnold")}
  let(:user_contract)       { create(:user, :first_time_candidate, name: "helga", contract_type: contract_type)}
  let(:user_contract_b)     { create(:user, :first_time_candidate, name: "alex", contract_type: the_offer.contract_type)}
  let(:user_contract_c)     { create(:user, :first_time_candidate, name: "conan", contract_type: contract_type)}
  let(:user_vehicles)       { create(:user, :first_time_candidate, name: "barbaro", vehicles: vehicles_b)}
  let(:user_soft_skills)    { create(:user, :first_time_candidate, name: "Sebas", vehicles: vehicles_b, city_id: city.id, curriculum_vitae_ids: [curriculum_vitae_soft_skills.id])}

  let(:empty_curriculum_vitae)        { create(:empty_curriculum_vitae) }
  let(:the_curriculum_vitae)          { create(:curriculum_vitae) }
  let(:curriculum_vitae_soft_skills)  { create(:curriculum_vitae, soft_skills: soft_skills) }
  let(:curriculum_job_categories)     { create(:empty_curriculum_vitae, user: user_contract_c)}
  let(:relations_curriculum)          { create(:curriculum_vitae, job_categories: job_categories, working_days: working_days) }

  let(:subject) { AffinityCalculator.new(the_offer, the_user) }

  describe "#affinity_percentage" do
    context "Neither the user nor the curriculum vitae has data equal with the offer" do
      it "should return 0" do
        response = subject.affinity_percentage
        expect(response).to eq(0)
      end
    end

    describe "The offer has the fields of job categories and vehicle" do
      context "When the user only matches the vehicle field" do
        it "should return 60" do
          ac = AffinityCalculator.new(offer_vehicles, user_vehicles)
          response = ac.affinity_percentage
          expect(response).to eq(60)
        end
      end
    end

    describe "The offer has the fields of job categories and contract type" do
      context "When the user only matches the contract type field" do
        it "should return 50" do
          ac = AffinityCalculator.new(offer_contract, user_contract)
          response = ac.affinity_percentage
          expect(response).to eq(50)
        end
      end

      context "When the user matches all fields" do
        it "should return 100" do
          user_contract_c.curriculum_vitae.job_categories = offer_contract.job_categories
          user_contract_c.curriculum_vitae.save!
          ac = AffinityCalculator.new(offer_contract, user_contract_c)
          response = ac.affinity_percentage
          expect(response).to eq(100)
        end
      end
    end

    describe "The offer has the fields of job categories, contract type, work mode and city" do
      context "When the user only matches the contract type field" do
        it "should return 25" do
          ac = AffinityCalculator.new(the_offer, user_contract_b)
          response = ac.affinity_percentage
          expect(response).to eq(25)
        end
      end
    end

    describe "The offes has the fields of job categories, city, vehicle and soft skills" do
      context "When the user matches the soft skills and vehicle fields" do
        it "should return 55" do
          ac = AffinityCalculator.new(offer_soft_skills, user_soft_skills)
          response = ac.affinity_percentage
          expect(response).to eq(55)
        end
      end
    end
  end

  describe "#not_nil_attributes_to_compare" do
    context "The class is Offer" do
      context "The offer has not any data" do
        it "should return a empty hash" do
          response = subject.not_nil_attributes_to_compare(Offer, empty_offer)

          expect(response).to be_empty
        end
      end

      context "The offer has all data" do
        it "should return a hash with all the offer to compare data" do
          expected_object = {
            city_id: the_offer.city.id,
            work_mode_id: the_offer.work_mode.id,
            contract_type_id: the_offer.contract_type.id
          }

          response = subject.not_nil_attributes_to_compare(Offer, the_offer)
          expect(response).to eq(expected_object)
        end
      end
    end

    context "The class is User" do
      context "The user has not any data" do
        it "should return a empty hash" do
          response = subject.not_nil_attributes_to_compare(User, empty_user)
          expect(response).to be_empty
        end
      end

      context "The user has all data" do
        it "should return a hash with all the user to compare data" do
          expected_object = {
            contract_type_id: the_user.contract_type.id,
            educational_degree_id: the_user.educational_degree.id,
            sex_id: the_user.sex.id
          }

          response = subject.not_nil_attributes_to_compare(User, the_user)
          expect(response).to eq(expected_object)
        end
      end
    end

    context "The class is Curriculum Vitae" do
      context "The curriculum vitae has not any data" do
        it "should return a empty hash" do
          response = subject.not_nil_attributes_to_compare(CurriculumVitae, empty_curriculum_vitae)
          expect(response).to be_empty
        end
      end

      context "The curriculum vitae has all data" do
        it "should return a hash with all the user to compare data" do
          expected_object = {:city_id=>the_curriculum_vitae.city.id}
          response = subject.not_nil_attributes_to_compare(CurriculumVitae, the_curriculum_vitae)
          expect(response).to eq(expected_object)
        end
      end
    end
  end

  describe "#not_empty_lists_to_compare" do
    context "The class is Offer" do
      context "The offer just has the categories job list" do
        it "should return a empty hash" do
          response = subject.not_empty_lists_to_compare(Offer, empty_offer)
          expect(response.count).to eq(1)
          expect(response[:job_categories].first).to eq(empty_offer.job_categories.first)
        end
      end

      context "The offer has more than one list" do
        it "should return a hash with all the offer lists data" do
          response = subject.not_empty_lists_to_compare(Offer, relations_offer)
          expect(response.count).to eq(3)
          expect(response[:job_categories].first).to eq(relations_offer.job_categories.first)
        end
      end
    end

    context "The class is User" do
      context "The user has not any lists" do
        it "should return a empty hash" do
          response = subject.not_empty_lists_to_compare(User, empty_user)
          expect(response).to be_empty
        end
      end

      context "The user has more than one list" do
        it "should return a hash with all the user lists data" do
          response = subject.not_empty_lists_to_compare(User, the_user)
          expect(response.count).to eq(2)
          expect(response[:vehicles].first).to eq(the_user.vehicles.first)
        end
      end
    end

    context "The class is Curriculum Vitae" do
      context "The curriculum vitae has not any lists" do
        it "should return a empty hash" do
          response = subject.not_empty_lists_to_compare(CurriculumVitae, empty_curriculum_vitae)
          expect(response).to be_empty
        end
      end

      context "The curriculum_vitae has more than one list" do
        it "should return a hash with all the offer lists data" do
          response = subject.not_empty_lists_to_compare(CurriculumVitae, relations_curriculum)
          expect(response.count).to eq(2)
          expect(response[:job_categories].first).to eq(relations_curriculum.job_categories.first)
        end
      end
    end
  end

  describe "Default version of affinity calculator" do
    context "when calculate affinity percentage, the default version" do
      it "should return 1.0" do
        version = AffinityCalculator::VERSION
        expect(version).to eq('1.0')
      end
    end
  end
end
