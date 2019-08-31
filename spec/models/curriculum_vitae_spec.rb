require 'rails_helper'

RSpec.describe CurriculumVitae, type: :model do

  describe "validations" do
    it { should validate_presence_of(:area_code) }
    it { should validate_presence_of(:about_me) }
    it { should validate_presence_of(:release_date) }
    it { should validate_presence_of(:travel_disponibility) }
    it { should validate_presence_of(:visits_count) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:labor_disponibility) }
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
    it { should have_many(:visits) }
    it { should have_and_belong_to_many(:limitations) }
    it { should have_and_belong_to_many(:soft_skills) }
    it { should have_and_belong_to_many(:educational_degrees) }

  end
end