require 'rails_helper'

RSpec.describe Company, type: :model do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:contact_name) }
    it { should validate_presence_of(:cellphone) }
    it { should validate_presence_of(:contact_cellphone) }
    it { should validate_presence_of(:nit) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:web_site) }
    it { should validate_presence_of(:contact_web_site) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:contact_work_position) }
    it { should respond_to(:logo) }
  end

  context "attachments" do
    subject {  FactoryBot.build(:company).logo }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe "associoations" do
    it { should belong_to(:employees_range) }
  end
end