require 'rails_helper'

RSpec.describe CurriculumVitae, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:area_code) }
    it { is_expected.to validate_presence_of(:cellphone_number) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:identification_number) }
    it { is_expected.to validate_presence_of(:tell_us) }
    it { is_expected.to validate_presence_of(:release_date) }
    it { is_expected.to validate_presence_of(:labor_disponibility) }
    it { is_expected.to validate_presence_of(:document_type) }
    it { is_expected.to validate_presence_of(:handicap) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:work_type) }
    it { is_expected.to validate_presence_of(:contract_type) }
    it { is_expected.to validate_presence_of(:travel_disponibility) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:city) }
    it { should belong_to(:nationality) }
    it { should belong_to(:labor_disponibility) }
    it { should belong_to(:document_type) }
    it { should belong_to(:handicap) }
    it { should belong_to(:gender) }
    it { should belong_to(:work_type) }
    it { should belong_to(:contract_type) }
    it { should have_and_belong_to_many(:soft_skills) }
  end
end