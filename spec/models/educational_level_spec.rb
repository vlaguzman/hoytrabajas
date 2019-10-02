require 'rails_helper'

RSpec.describe EducationalLevel, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:degree) }
    it { is_expected.to respond_to(:institution_name) }
    it { is_expected.to respond_to(:start_date) }
    it { is_expected.to respond_to(:finish_date) }
    it { is_expected.to respond_to(:ongoing_study) }
  end

  context "attachments" do
    subject { build(:educational_level).diploma }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe 'associations' do
    it { should belong_to(:curriculum_vitae) }
    it { should belong_to(:city) }
    it { should have_and_belong_to_many(:offers) }
  end
end