require 'rails_helper'

RSpec.describe WorkExperience, type: :model do

  describe "validations" do
    it { should respond_to(:still_in_progress) }
    it { should respond_to(:stated_at) }
    it { should respond_to(:finished_at) }
    it { should respond_to(:company_name) }
    it { should validate_presence_of(:job_category) }
    it { should validate_presence_of(:work_position) }
  end

  describe 'associations' do
    it { should belong_to(:job_category) }
    it { should belong_to(:work_methodology) }
    it { should belong_to(:contract_type) }
    it { should belong_to(:curriculum_vitae) }
    it { should belong_to(:work_position) }
  end
end
