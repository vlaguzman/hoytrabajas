require 'rails_helper'

RSpec.describe Users::Wizards::StepSixService do

  let!(:new_curriculum_vitae) { create(:curriculum_vitae, :empty) }
  let(:subject) { described_class.new(new_curriculum_vitae) }

  describe "#update" do
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
          create(:job_category, description: "Cocina").id,
          create(:job_category, description: "Mecanica").id,
          create(:job_category, description: "Contruccion").id
        ]
      end

      let!(:technical_skills_descriptions) do
        [
          create(:technical_skill, description: "SEO").description,
          create(:technical_skill, description: "Redes sociales").description,
          create(:technical_skill, description: "Ruby On Rails").description,
          create(:technical_skill, description: "Cocina Italiana").description,
          create(:technical_skill, description: "Pintar").description
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
          create(:level, description: "bajo").id,
          create(:level, description: "medio").id,
          create(:level, description: "avanzado").id
        ]
      end

      let(:params) do
        {
          soft_skill_ids: [soft_skills_ids.join(",")],
          technical_skills: [
            {
              job_category_id: job_categories_ids[0],
              technical_skill_description: technical_skills_descriptions[0],
              level_id: levels_ids[0]
            },
            {
              job_category_id: job_categories_ids[0],
              technical_skill_description: technical_skills_descriptions[1],
              level_id: levels_ids[2]
            },
            {
              job_category_id: job_categories_ids[1],
              technical_skill_description: technical_skills_descriptions[2],
              level_id: levels_ids[2]
            }
          ],
          to_learn_skills: [
            {
              job_category_id: job_categories_ids[3],
              technical_skill_description: technical_skills_descriptions[3]
            },
            {
              job_category_id: job_categories_ids[4],
              technical_skill_description: technical_skills_descriptions[4]
            },
            {
              job_category_id: job_categories_ids[1],
              technical_skill_description: technical_skills_descriptions[0]
            }
          ],
          languages: [
            {
              level_id: levels_ids[0],
              language_id: languages_ids[0]
            }
          ]

        }
      end

      it "Should return a modifiend User" do
        updated_cv = subject.update(params)

        expect(updated_cv).to be_an_instance_of(CurriculumVitae)
      end

      it "Should update the curriculum vitae" do
        updated_cv = subject.update(params)

        expect(updated_cv.soft_skill_ids.count).to eq(2)
        expect(updated_cv.soft_skill_ids).to match_array(soft_skills_ids)

        expect(updated_cv.strong_skills.count).to eq(3)
        expect(updated_cv.to_learn_skills.count).to eq(3)
        expect(updated_cv.strong_languages.count).to eq(1)
      end

      it "should asociate a selected soft skills to the curriculum vitae" do
        updated_cv = subject.update(params)

        expect(updated_cv.soft_skills.pluck(:description)).to match_array(["Creatividad","Responsabilidad"])
      end

      it "should create a curriculum vitae techical skills object associated to the curriculum vitae" do
        expect(new_curriculum_vitae.technical_skills.count).to be_zero
        expect(new_curriculum_vitae.strong_languages.count).to be_zero

        updated_cv = subject.update(params)

        strong_skills = updated_cv.strong_skills

        strong_technical_skills = strong_skills.map { |d| d.technical_skill.description }
        strong_job_categories = strong_skills.map { |d| d.job_category.description }
        strong_levels = strong_skills.map { |d| d.level.description }

        expect(strong_technical_skills).to match_array(["SEO","Redes sociales", "Ruby On Rails"])
        expect(strong_levels).to match_array(["avanzado", "avanzado", "bajo"])
        expect(strong_job_categories).to match_array(["Desarrollo de Software", "Marketing", "Marketing"])
      end

      context "When the user send a tecnical skill but the skill exist and the user write with upercase" do

        it "Should create only the valid skills" do
          params.tap do |field|
            field[:technical_skills] = [{
              job_category_id: job_categories_ids[0],
              technical_skill: "SeO",
              level_id: levels_ids[2]
            }]
            field[:to_learn_skills] = [{
              job_category_id: job_categories_ids[3],
              technical_skill: 'ruby On rails'
            }]
          end

          updated_cv = subject.update(params)

          expected_errors = {
            :technical_skills=>[{:error=>:invalid_skill}],
            :to_learn_skills=>[{:error=>:invalid_skill}]
          }

          expect(updated_cv.errors).to be_present
          expect(updated_cv.errors.details).to eq(expected_errors)

        end
      end
    end
  end

end
