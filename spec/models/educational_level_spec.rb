require 'rails_helper'

RSpec.describe EducationalLevel, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:institution_name) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:finish_date) }
    it { is_expected.to validate_presence_of(:degree) }
    it { is_expected.to validate_presence_of(:ongoing_study) }
  end

  describe 'associations' do
    it { should belong_to(:curriculum_vitae) }
    it { should belong_to(:city) }
  end
end