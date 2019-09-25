require "rails_helper"

RSpec.describe Users::Wizards::StepEightPresenter do
  let(:developer) { create(:work_position, description: "Developer")}
  let(:head_hunter) { create(:work_position, description: "Head Hunter") }
  let(:curriculum) { create(:curriculum_vitae, user: create(:user, :first_time_candidate)) }
  let!(:work_experiences) do
    [
      create(:work_experience, curriculum_vitae: curriculum, company_name: "HoyCamellas", work_position: developer),
      create(:work_experience, curriculum_vitae: curriculum, company_name: "VerdeIlogico", work_position: head_hunter),
    ]
  end
  let(:candidate) { curriculum.user }

  let(:subject) { described_class.new(candidate) }

  describe "#job_categories_list" do
    it { should respond_to(:job_categories_list) }

    it "should return a array with job category objects" do
      expect(subject.job_categories_list).to match_array(JobCategory.all.map { |object| [object.description, object.id] })
    end
  end

  describe "#work_positions_list" do
    it { should respond_to(:work_positions_list) }

    it "should return a array with work position objects" do
      expect(subject.work_positions_list).to match_array(WorkPosition.all.map { |object| [object.description, object.id] })
    end
  end

  describe "#work_methodologies_list" do
    it { should respond_to(:work_methodologies_list) }

    it "should return a array with work methodoly objects" do
      expect(subject.work_methodologies_list).to match_array(WorkMethodology.all.map { |object| [object.description, object.id] })
    end
  end

  describe "#cities_list" do
    it { should respond_to(:cities_list) }

    it "should return a array with city objects" do
      expect(subject.cities_list).to match_array(City.all.map { |object| [object.description, object.id] })
    end
  end

  describe "#technical_skills_list" do
    it { should respond_to(:technical_skills_list) }

    it "should return a array with city objects" do
      expect(subject.technical_skills_list).to match_array(TechnicalSkill.all.map { |object| [object.description, object.id] })
    end
  end

  describe "#registered_experience" do
    it "Should return a array of candidate works experiences" do
      experiences = WorkExperience.where(curriculum_vitae_id: subject.curriculum_vitaes.first.id).map { |exp| [exp.company_name, exp.work_position.description] }

      expect(subject.registered_experience).to match_array(experiences)
    end
  end

  describe "#registered_experience_message" do
    context "experience present" do
      it "should return the message" do
        expected_message = "Llevas #{subject.registered_experience.count} registro(s) de experiencia laboral"

        expect(subject.registered_experience_message).to eq(expected_message)
      end
    end

    context "experience not present" do
      it "should return nil" do
        WorkExperience.destroy_all

        expect(subject.registered_experience_message).to be_nil
      end
    end
  end

  describe "#have_experience?" do
    it "Should return a boolean if user have experience" do
      experiences = WorkExperience.where(curriculum_vitae_id: subject.curriculum_vitaes.first.id).map { |exp| [exp.company_name, exp.work_position.description] }.any?

      expect(subject.have_experience?).to be_truthy
    end

    context "curriculum user does not have registered experience" do
      it "Should return falsy" do
        WorkExperience.destroy_all

        experiences = WorkExperience.where(curriculum_vitae_id: subject.curriculum_vitaes.first.id).map { |exp| [exp.company_name, exp.work_position.description] }.any?

      expect(subject.have_experience?).to be_falsey
      end
    end
  end

end