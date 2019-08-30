require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "should validate the presence of profile" do
    profile = FactoryBot.build(:profile)
    profile.valid?

  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:nationality) }
    it { is_expected.to validate_presence_of(:document_type) }
    it { is_expected.to validate_presence_of(:document_number) }
    it { is_expected.to validate_presence_of(:contact_number) }
    it { is_expected.to validate_presence_of(:curriculum_vitae) }
    it { is_expected.to validate_presence_of(:about_you) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:handicap) }
    it { is_expected.to validate_presence_of(:educational_degree) }
  end

  describe "associations" do                                                  
    it { should belong_to(:user) }                                            
    it { should belong_to(:curriculum_vitae) }
    it { should belong_to(:document_type) }                                   
    it { should belong_to(:gender) }                                          
    it { should have_many(:nationality) }
    it { should have_and_belongs_to_many(:handicap) }                         
    it { should have_and belongs_to_many(:educational_degree) }               
  end
end
