require 'rails_helper'

RSpec.describe CurriculumVitae, type: :model do

  it "should validate the presence of travel_disponibility" do
    curriculum = FactoryBot.build(:curriculum_vitae, travel_disponibility: nil)
    curriculum.valid?

    expect(curriculum.errors[:travel_disponibility].size).to eq(1)
  end

  it "should validate the presence of release_date" do
    curriculum = FactoryBot.build(:curriculum_vitae, release_date: nil)
    curriculum.valid?

    expect(curriculum.errors[:release_date].size).to eq(1)
  end

  it "should validate the presence of tell_us" do
    curriculum = FactoryBot.build(:curriculum_vitae, tell_us: nil)
    curriculum.valid?

    expect(curriculum.errors[:tell_us].size).to eq(1)
  end

  it "should validate the presence of identification_number" do
    curriculum = FactoryBot.build(:curriculum_vitae, identification_number: nil)
    curriculum.valid?

    expect(curriculum.errors[:identification_number].size).to eq(1)
  end

  it "should validate the presence of cellphone_number" do
    curriculum = FactoryBot.build(:curriculum_vitae, cellphone_number: nil)
    curriculum.valid?

    expect(curriculum.errors[:cellphone_number].size).to eq(1)
  end

  it "should validate the presence of area_code" do
    curriculum = FactoryBot.build(:curriculum_vitae, area_code: nil)
    curriculum.valid?

    expect(curriculum.errors[:area_code].size).to eq(1)
  end

  it "should validate the presence of cellphone_number" do
    curriculum = FactoryBot.build(:curriculum_vitae, cellphone_number: nil)
    curriculum.valid?

    expect(curriculum.errors[:cellphone_number].size).to eq(1)
  end

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
  end
end