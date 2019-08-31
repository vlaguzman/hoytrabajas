require 'rails_helper'

RSpec.describe User, type: :model do
  user = FactoryBot.build(:user)
  user.valid?

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_presence_of(:sign_in_count) }
    it { is_expected.to validate_presence_of(:confirmed_at) }
    #it { is_expected.to validate_presence_of(:name) }
    #it { is_expected.to validate_presence_of(:last_name) }
    #it { is_expected.to validate_presence_of(:nationaloty) }
    #it { is_expected.to validate_presence_of(:document_type) }
    #it { is_expected.to validate_presence_of(:identification_number) }
    #it { is_expected.to validate_presence_of(:contact_number) }
    #it { is_expected.to validate_presence_of(:about_me) }
    #it { is_expected.to validate_presence_of(:sexuality) }
    #it { is_expected.to validate_presence_of(:birthday) }
    #it { is_expected.to validate_presence_of(:handicap) }
    #it { is_expected.to validate_presence_of(:educational_degree) }
 
    
  end

  describe "associations" do
    #it { should belong_to(:curriculum_vitae) }
    #it { should belong_to(:document_type) }
    #it { should belong_to(:sexuality) }
    #it { should belong_to(:nationality) }
    #it { should have_and_belongs_to_many(:handicap) }
    #it { should have_and_belonds_to_many(:educational_degree) }
  end



end
