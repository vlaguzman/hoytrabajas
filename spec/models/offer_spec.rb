require 'rails_helper'

RSpec.describe Offer, type: :model do

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:cellphone) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:vacancies_quantity) }
    it { should validate_presence_of(:close_date) }
    it { should validate_presence_of(:immediate_start) }
    it { should validate_presence_of(:required_experience) }
    it { should validate_presence_of(:description_responsibilities) }
    it { should validate_presence_of(:release_date) }
    it { should validate_presence_of(:status) }
    it { should respond_to(:image) }
  end

  context "attachments" do
    subject {  FactoryBot.build(:offer).image }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe "assocciations" do
    it { should belong_to(:user) }
    it { should belong_to(:city) }
    it { should belong_to(:job_category) }
    it { should belong_to(:offer_type) }
    it { should belong_to(:job_category) }
    it { should belong_to(:gender) }
    it { should belong_to(:job_category) }
    it { should belong_to(:work_type) }
    it { should belong_to(:job_category) }
    it { should belong_to(:contract_type) }
    it { should have_and_belong_to_many(:terms) }
    it { should have_and_belong_to_many(:functions) }
    it { should have_and_belong_to_many(:job_aids) }
    it { should have_and_belong_to_many(:vehicles) }
  end
end
