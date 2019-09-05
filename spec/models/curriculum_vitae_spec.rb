require 'rails_helper'

RSpec.describe CurriculumVitae, type: :model do

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should respond_to(:area_code) }
    it { should respond_to(:about_me) }
    it { should respond_to(:release_date) }
    it { should respond_to(:travel_disponibility) }
    it { should respond_to(:visits_count) }
    it { should respond_to(:city) }
    it { should respond_to(:labor_disponibility) }
    it { should respond_to(:photo) }
    it { should respond_to(:visits) }
  end

  context "attachments" do
    subject {  FactoryBot.build(:curriculum_vitae).photo }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:city) }
    it { should belong_to(:labor_disponibility) }
    it { should belong_to(:work_mode) }
    it { should belong_to(:contract_type) }
    it { should have_many(:visits) }
    it { should have_and_belong_to_many(:soft_skills) }
    it { should have_and_belong_to_many(:educational_degrees) }
    it { should have_and_belong_to_many(:vehicles) }
    it { should have_and_belong_to_many(:working_days) }
    it { should have_and_belong_to_many(:available_work_days) }
    it { should have_and_belong_to_many(:languages) }
    it { should have_and_belong_to_many(:technical_skills) }
    it { should have_and_belong_to_many(:users) }
  end
end
