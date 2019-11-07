require 'rails_helper'

RSpec.describe Company, type: :model do

  describe "validations" do
    it { should respond_to(:name) }
    it { should respond_to(:contact_name) }
    it { should respond_to(:cellphone) }
    it { should respond_to(:contact_cellphone) }
    it { should respond_to(:nit) }
    it { should respond_to(:address) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should respond_to(:web_site) }
    it { should respond_to(:contact_web_site) }
    it { should respond_to(:description) }
    it { should respond_to(:contact_work_position) }
    it { should respond_to(:logo) }

    it { should respond_to(:employees_range_description) }
  end

  context "attachments" do
    subject {  FactoryBot.build(:company).logo }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe "associoations" do
    it { should have_and_belong_to_many(:users) }
    it { should belong_to(:city) }
    it { should have_many(:offers) }
  end
end
