require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should respond_to(:name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:birthday) }
    it { should respond_to(:contact_number) }
    it { should respond_to(:identification_number) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:sign_in_count) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:sex) }
    it { should respond_to(:contract_type) }
    it { should respond_to(:document_type) }
    it { should respond_to(:work_mode) }
    it { should respond_to(:curriculum_vitaes) }
    it { should respond_to(:nationalities) }
    it { should respond_to(:educational_degree) }
    it { should respond_to(:limitations) }
    it { should respond_to(:city) }
  end

  describe "associations" do
    it { should belong_to(:sex) }
    it { should belong_to(:document_type) }
    it { should belong_to(:work_mode) }
    it { should belong_to(:contract_type) }
    it { should belong_to(:educational_degree) }
    it { should belong_to(:city) }
    it { should have_many(:curriculum_vitaes) }
    it { should have_and_belong_to_many(:nationalities) }
    it { should have_and_belong_to_many(:limitations) }
    it { should have_and_belong_to_many(:vehicles) }
    it { should have_and_belong_to_many(:driving_licences) }
    it { should accept_nested_attributes_for(:curriculum_vitaes)}
  end
end
