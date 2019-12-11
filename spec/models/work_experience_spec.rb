require 'rails_helper'

RSpec.describe WorkExperience, type: :model do

  describe "validations" do
    it { should respond_to(:still_in_progress) }
    it { should respond_to(:started_at) }
    it { should respond_to(:finished_at) }
    it { should respond_to(:company_name) }
    it { should validate_presence_of(:job_category) }
    it { should validate_presence_of(:work_position) }
  end

  describe 'associations' do
    it { should belong_to(:city) }
    it { should belong_to(:job_category) }
    it { should belong_to(:work_methodology) }
    it { should belong_to(:contract_type) }
    it { should belong_to(:curriculum_vitae) }
    it { should belong_to(:work_position) }
    it { should have_and_belong_to_many(:technical_skills) }
  end

  describe "#user_wizard_step_eight_list" do
    let(:subject) { described_class }

    it { should respond_to(:user_wizard_step_eight_list) }

    let(:curriculum_vitae_id) { create(:curriculum_vitae).id }
    let(:work_experiences) { create_list(:work_experience, 5, curriculum_vitae_id: curriculum_vitae_id) }

    context "When is need show registered work experience" do
      it "should return a array with company name and description" do
        expected_array = work_experiences.map { |exp| [exp.company_name, exp.work_position.description] }

        expect(subject.user_wizard_step_eight_list(curriculum_vitae_id)).to match_array(expected_array)
      end
    end
  end
  describe "#total_time" do
    let(:curriculum_vitae_id) { create(:curriculum_vitae).id }
    let(:work_experience)     { create(:work_experience, curriculum_vitae_id: curriculum_vitae_id) }

    describe "When is need show see the total time of work_experience" do

      context "when total_time is days" do
        it "should return diffence with 'day(s)'" do
          work_experience.update(started_at: Date.new(2019, 01, 01), finished_at: Date.new(2019, 01, 19))
          expect(work_experience.total_time).to eq("18 day(s)")

        end
      end

      context "when total_time is months" do
        it "should return diffence with 'months(s)'" do
          work_experience.update(started_at: Date.new(2019, 01, 01), finished_at: Date.new(2019, 06, 19))
          expect(work_experience.total_time).to eq("5.6 month(s)")

        end
      end

      context "when total_time is years" do
        it "should return diffence with 'years(s)'" do
          work_experience.update(started_at: Date.new(2019, 01, 01), finished_at: Date.new(2020, 06, 19))
          expect(work_experience.total_time).to eq("1.5 year(s)")

        end
      end
    end
  end
end
