require 'rails_helper'

RSpec.describe Users::Wizards::StepSixService do

  describe "#call" do
    let!(:new_curriculum_vitae) { create(:curriculum_vitae, :new_curriculum_vitae) }

    context "When the params are valids" do
      let!(:soft_skills_ids) do
        [
          create(:soft_skill, description: "Creatividad").id,
          create(:soft_skill, description: "Responsabilidad").id
        ]
      end

      let!(:job_categories_ids) do
        [
          create(:job_category, description: "Marketing").id,
          create(:job_category, description: "Desarrollo de Software").id,
        ]
      end

      let!(:technical_skills_ids) do
        [
          create(:technical_skill, description: "SEO").id,
          create(:technical_skill, description: "Redes sociales").id,
        ]
      end

      let!(:languages_ids) do
        [
          create(:language, description: "Parsel").id,
          create(:language, description: "Inglés").id,
        ]
      end

      let!(:levels_ids) do
        [
          create(:level, description: "medio").id,
          create(:level, description: "avanzado").id,
        ]
      end

      let(:params) do
        {
          soft_skill_ids: [soft_skills_ids.join(",")]

          #TODO Oscar temporal comment untile complete de fields
          #,
          #curriculum_vitaes_technical_skills:{
          #  job_category_id: JobCategory.find_by(description: "Marketing").id,
          #  technical_skill_id:TechnicalSkill.find_by(description: "SEO").id,
          #  level_id:Level.find_by(description: "avanzado").id
          #},
          #to_learn_skills:{
          #  job_category_id: JobCategory.find_by(description: "Marketing").id,
          #  technical_skill_id: TechnicalSkill.find_by(description: "Redes sociales").id
          #},
          #curriculum_vitaes_languages:{
          #  language_id:Language.find_by(description: 'Inglés').id,
          #  level_id: Level.find_by(description: "avanzado").id
          #}

        }
      end

      it "Should return a modifiend User" do
        updated_cv = subject.(curriculum_vitae: new_curriculum_vitae, update_params: params)

        expect(updated_cv).to be_an_instance_of(CurriculumVitae)
        expect(updated_cv.soft_skill_ids).to match_array(soft_skills_ids)
      end

      it "Should update the curriculum vitae" do
        updated_cv = subject.(curriculum_vitae: new_curriculum_vitae, update_params: params)

        expect(updated_cv.soft_skill_ids.count).to eq(2)

        #TODO Oscar temporal comment untile complete de fields
        # expect(CurriculumVitaesLanguages.count).to eq(1)
        # expect(new_curriculum_vitae.languages.count).to eq(1)
        # expect(CurriculumVitaesTechnicalSkills.count).to eq(2)
        # expect(new_curriculum_vitae.technical_skills.count).to eq(2)
        # expect(new_curriculum_vitae.soft_skills.count).to eq(2)
      end

      it "should asociate a selected soft skills to the curriculum vitae" do
        updated_cv = subject.(curriculum_vitae: new_curriculum_vitae, update_params: params)

        expect(updated_cv.soft_skills.pluck(:description)).to match_array(["Creatividad","Responsabilidad"])
      end

      it "should create a curriculum vitae techical skills object associated to the curriculum vitae" do
        expect(new_curriculum_vitae.technical_skills.count).to be_zero
        expect(new_curriculum_vitae.languages.count).to be_zero

        updated_cv = subject.(curriculum_vitae: new_curriculum_vitae, update_params: params)

        #TODO Oscar temporal comment untile complete de fields
        #expect(updated_cv.technical_skills.pluck(:description)).to match_array(["SEO","Redes sociales"])
        #expect(updated_cv.languages.pluck(:description)).to match_array(["Inglés"])

        #saved_to_learn_skill = updated_cv.technical_skills.select {|skill| skill.step_up: true }

        #expect(saved_to_learn_skill.level).to eq(nil)
      end
    end
  end

end
