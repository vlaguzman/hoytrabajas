require 'rails_helper'

RSpec.describe AddModelErrors::CurriculumVitaes::TechnicalSkills do

  let(:subject) do
    class DummyClass
      include AddModelErrors::CurriculumVitaes::TechnicalSkills
    end

    DummyClass.new
  end

  let(:curriculum_vitae) { create(:curriculum_vitae) }

  let(:valid_strong_skills) do
    [
      {
        job_category_id: 1,
        technical_skill_description: "DevOps",
        level_id: 3
      },
      {
        job_category_id: 1,
        technical_skill_description: "Ruby Dev",
        level_id: 3
      },
    ]
  end

  let(:invalid_strong_skills) do
    [
      {
        job_category_id: '',
        technical_skill_description: '',
        level_id: ''
      },
      {
        job_category_id: '',
        technical_skill_description: '',
        level_id: ''
      },
    ]
  end

  describe "#validate_strong_skills" do

    context "When the user send params" do
      it "Should no add errors" do
        response = subject.validate_strong_skills(model: curriculum_vitae, strong_skills_list: valid_strong_skills)

        expect(response).to be_falsy
      end
    end

    context "When the user dont send at least one strong skill" do
      it "should add error of empty skills" do
        response = subject.validate_strong_skills(model: curriculum_vitae, strong_skills_list: invalid_strong_skills)

        expected_errors = {:technical_skills=>[{:error=>:empty}]}

        expect(response.errors.details).to eq(expected_errors)
      end
    end
  end
end