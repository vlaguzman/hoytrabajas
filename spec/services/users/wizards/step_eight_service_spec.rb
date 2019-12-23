require 'rails_helper'

RSpec.describe Users::Wizards::StepEightService do

  describe "#call" do
    context "When the params are valids" do
      let!(:job_categories_ids) do
        [
          create(:job_category, description: "Marketing").id,
          create(:job_category, description: "Desarrollo de Software").id,
        ]
      end

      let!(:work_position_id) { create(:work_position, description: "Developer").id }

      let!(:work_methodology_id) { create(:work_methodology, description: "Telework").id }

      let!(:city_id) { create(:city, description: "Bogota").id }

      let!(:technical_skills) do
        [
          create(:technical_skill, description: "SEO").description,
        ]
      end

      let(:params) do
        {
          job_category_id: job_categories_ids[0],
          company_name: "HoyTrabajas.com",
          work_position_id: work_position_id,
          work_methodology_id: work_methodology_id,
          city_id: city_id,
          technical_skills: "SEO, Redes sociales",
          started_at: "5/10/2017",
          finished_at: "5/10/2018",
          still_in_progress: "1"
        }
      end

      let!(:empty_cv) { create(:curriculum_vitae, :empty, work_experiences: []) }

      let(:new_work_experience) { build(:work_experience, :empty,
        curriculum_vitae: empty_cv,
        job_category: nil,
        work_position: nil,
        technical_skills: []
      ) }


      it "Should return a modifiend User" do
        updated_work_experience, updated = subject.(source: new_work_experience, update_params: params)

        expect(updated).to be_truthy

        expect(updated_work_experience.technical_skills.pluck(:description)).to match_array(["SEO", "Redes sociales"])
        expect(updated_work_experience).to be_an_instance_of(WorkExperience)
      end

      it "should create a work eperience user asocc with the user" do
        WorkExperience.destroy_all

        updated_work_experience, updated = subject.(source: new_work_experience, update_params: params)

        expect(updated).to be_truthy

        expect(WorkExperience.count).to eq(1)

        expect(updated_work_experience.job_category.description).to eq("Marketing")
        expect(updated_work_experience.company_name).to eq("HoyTrabajas.com")
        expect(updated_work_experience.work_position.description).to eq("Developer")
        expect(updated_work_experience.work_methodology.description).to eq("Telework")
        expect(updated_work_experience.city.description).to eq("Bogota")
        expect(updated_work_experience.technical_skills.pluck(:description)).to match_array(["SEO", "Redes sociales"])
        expect(updated_work_experience.started_at.to_s).to eq("2017-10-05")
        expect(updated_work_experience.finished_at.to_s).to eq("2018-10-05")
        expect(updated_work_experience.still_in_progress).to be_truthy
      end

      describe "params are incomplete" do
        context "When work experience does not hace required values" do
          it "should return a user with errors" do
            params.tap do |object|
              object[:work_position_id] = nil
            end

            updated_work_experience, _ = subject.(source: new_work_experience, update_params: params)

            expect(updated_work_experience.errors.any?).to be_truthy
            expect(updated_work_experience.errors.full_messages).to match_array(["Work position El Cargo no puede estar vacío","Work position Debes seleccionar un Cargo"])
          end
        end
      end

    end
  end

end