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

  describe '#form_information' do
    it 'should return a object used by the react component to build it' do
      response = subject.form_information

      expect(response).to be_an_instance_of(Hash)

      expected_keys = [:title, :form]

      expect(response.keys).to eq(expected_keys)
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