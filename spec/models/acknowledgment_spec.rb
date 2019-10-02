require 'rails_helper'

RSpec.describe Acknowledgment, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:entity_name) }
  end

  context "attachments" do
    subject { build(:acknowledgment).diploma }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe 'associations' do
    it { should belong_to(:curriculum_vitae) }
  end
end
