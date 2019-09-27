require 'rails_helper'

RSpec.describe Users::Wizards::StepEightService do

  describe "#call" do
    let!(:new_curriculum_vitae) { create(:curriculum_vitae, :new_curriculum_vitae) }

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

      let!(:technical_skills_ids) do
        [
          create(:technical_skill, description: "SEO").id,
          create(:technical_skill, description: "Redes sociales").id,
        ]
      end

      let(:params) do
        {
          curriculum_vitae:{
            work_experience:{
              job_category_id: JobCategory.find_by(description: "Marketing").id,
              company_name: "HoyTrabajas.com",
              work_position_id: work_position_id,
              work_methodology_id: work_methodology_id,
              city_id: city_id,
              technical_skill_ids: technical_skills_ids,
              started_at: "5-10-2017",
              finished_at: "5-10-2018",
              still_in_progress: "1"
            }
          }
        }
      end

      it "Should return a modifiend User" do
        candidate = new_curriculum_vitae.user

        updated_candidate = subject.(candidate: candidate, update_params: params)

        expect(updated_candidate).to be_an_instance_of(User)
      end

      it "should create a work eperience user asocc with the user" do
        candidate = new_curriculum_vitae.user
        updated_candidate = subject.(candidate: candidate, update_params: params)

        expect(WorkExperience.count).to eq(1)

        work_experience = WorkExperience.find_by(curriculum_vitae_id: new_curriculum_vitae.id)

        expect(work_experience.job_category.description).to eq("Marketing")
        expect(work_experience.company_name).to eq("HoyTrabajas.com")
        expect(work_experience.work_position.description).to eq("Developer")
        expect(work_experience.work_methodology.description).to eq("Telework")
        expect(work_experience.city.description).to eq("Bogota")
        expect(work_experience.technical_skills.pluck(:description)).to match_array(["SEO", "Redes sociales"])
        expect(work_experience.started_at.to_s).to eq("2017-10-05")
        expect(work_experience.finished_at.to_s).to eq("2018-10-05")
        expect(work_experience.still_in_progress).to be_truthy
      end

      describe "params are incomplete" do
        context "When work experience does not hace required values" do
          it "should return a user with errors" do
            params[:curriculum_vitae][:work_experience].tap do |object|
              object[:work_position_id] = nil
            end

            candidate = new_curriculum_vitae.user
            updated_candidate = subject.(candidate: candidate, update_params: params)

            expect(candidate.errors.any?).to be_truthy
            expect(candidate.errors.full_messages).to match_array(["Work position El Cargo no puede estar vacío","Work position Debes seleccionar un Cargo"])
          end
        end
      end

    end
  end

end