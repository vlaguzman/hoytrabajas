require 'rails_helper'

RSpec.describe Acknowledgment, type: :model do

  describe "validations" do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:start_date) }
    it { is_expected.to respond_to(:entity_name) }
    it { is_expected.to respond_to(:diploma) }
  end

  context "attachments" do
    subject { build(:acknowledgment).diploma }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe 'associations' do
    it { should belong_to(:curriculum_vitae) }
  end
end
