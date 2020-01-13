require 'rails_helper'

RSpec.describe Users::WizardService do

  let(:candidate) { create(:user, :first_time_candidate) }
  let(:new_curriculum) { create(:curriculum_vitae, user: candidate) }

  describe "#update_step" do
    it { should respond_to(:update_step) }

    context "when the params are valid" do
      let(:job_category_ids) { [create(:job_category, description: "Marketing").id] }
      let(:offer_type_ids) { [create(:offer_type, description: "Full Time").id] }
      let(:work_mode_ids) { [create(:work_mode, description: "Undefined term").id] }

      let(:params) do
        {
          name: "Elcan",
          last_name: "Didato",
          birthday: Date.parse("1999-12-31"),
          contact_number: "900121213",
          identification_number: "90807060",
          curriculum_vitae: {
            area_code: "130121",
            about_me: "Amet nulla officia do voluptate.",
            release_date: Date.parse("2019-09-11"),
            travel_disponibility: true,
            job_category_ids: job_category_ids,
            offer_type_ids: offer_type_ids,
            work_mode_ids: work_mode_ids
          }
        }
      end

      it "Should be modified the user and the curriculum vitae" do
        new_curriculum
        updated_candidate = subject.update_step(candidate, update_params: params)

        expect(updated_candidate).to be_an_instance_of(User)

        expect(updated_candidate.name).to eq(params[:name])
        expect(updated_candidate.last_name).to eq(params[:last_name])
        expect(updated_candidate.birthday).to eq(params[:birthday])
        expect(updated_candidate.contact_number).to eq(params[:contact_number])
        expect(updated_candidate.identification_number).to eq(params[:identification_number])

        expect(updated_candidate.curriculum_vitaes.count).to eq(1)

        updated_cv = updated_candidate.curriculum_vitaes.first

        expect(updated_cv.area_code).to eq("130121")
        expect(updated_cv.about_me).to eq("Amet nulla officia do voluptate.")
        expect(DatesManager.default date:updated_cv.release_date).to eq(DatesManager.default date:Date.new(2019, 9, 11))
        expect(updated_cv.travel_disponibility).to be_truthy
        expect(updated_cv.job_categories.last.description).to eq("Marketing")
        expect(updated_cv.offer_types.last.description).to eq("Full Time")
        expect(updated_cv.work_modes.last.description).to eq("Undefined term")
      end

    end

  end

  describe "#update_curriculum_vitae" do
    describe "update soft skills" do
      let!(:expected_soft_skill_ids) do
        [
          create(:soft_skill).id,
          create(:soft_skill).id,
          create(:soft_skill).id,
        ]
      end

      let(:curriculum_params) do
        {
          soft_skill_ids: expected_soft_skill_ids
        }
      end

      it "should have associated the passed soft skills" do
        expect(new_curriculum.soft_skill_ids).to be_empty

        response, updated = subject.update_curriculum_vitae(new_curriculum, update_params: curriculum_params)

        expect(updated).to be_truthy
        expect(response).to be_an_instance_of(CurriculumVitae)
        expect(response.soft_skill_ids).to match_array(expected_soft_skill_ids)
      end
    end
  end

end
