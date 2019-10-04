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

    it { should respond_to(:company_description) }
    it { should respond_to(:company_name) }
    it { should respond_to(:company_web_site) }
    it { should respond_to(:company_employees_range_description) }

    it { should respond_to(:salary_from) }
    it { should respond_to(:salary_to) }
    it { should respond_to(:salary_currency_description) }
    it { should respond_to(:salary_period_description) }

    it { should respond_to(:age_range_from) }
    it { should respond_to(:age_range_to) }

    it { should respond_to(:sex_description) }
    it { should respond_to(:city_description) }
    it { should respond_to(:offer_type_description) }
    it { should respond_to(:work_mode_description) }
    it { should respond_to(:contract_type_description) }
    it { should respond_to(:available_work_days_description) }
    it { should respond_to(:working_days_description) }

    it { should respond_to(:languages_list) }
  end

  context "attachments" do
    subject {  FactoryBot.build(:offer).image }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe "assocciations" do
    it { should belong_to(:company) }
    it { should belong_to(:city) }
    it { should belong_to(:job_category) }
    it { should belong_to(:offer_type) }
    it { should belong_to(:job_category) }
    it { should belong_to(:sex) }
    it { should belong_to(:job_category) }
    it { should belong_to(:work_mode) }
    it { should belong_to(:job_category) }
    it { should belong_to(:contract_type) }
    it { should have_one(:offers_salaries) }
    it { should have_and_belong_to_many(:terms) }
    it { should have_and_belong_to_many(:functions) }
    it { should have_and_belong_to_many(:job_aids) }
    it { should have_and_belong_to_many(:vehicles) }
    it { should have_and_belong_to_many(:driving_licences) }
    it { should have_and_belong_to_many(:working_days) }
    it { should have_and_belong_to_many(:available_work_days) }
    it { should have_and_belong_to_many(:languages) }
    it { should have_and_belong_to_many(:soft_skills) }
    it { should have_and_belong_to_many(:technical_skills) }
    it { should have_and_belong_to_many(:work_positions) }
    it { should have_and_belong_to_many(:responsibilities) }
    it { should have_and_belong_to_many(:educational_level) }
  end

  describe "#active" do
    context "there are just one active_offer" do
      let!(:offer) { create(:offer) }
      it "should return one offer" do
        expect(Offer.active.count).to eq(1)
      end
    end

    context "there are not active_offer" do
      let!(:offer) { create(:offer, :expired_offer) }
      it "should not return any offer" do
        expect(Offer.active.count).to eq(0)
      end
    end

    context "there are active and expired offers" do
      let!(:offers) { [create(:offer, title: 'active_offer'), create(:offer, :expired_offer)] }
      it "should return just the active_offer" do
        expect(Offer.active.first.title).to eq('active_offer')
        expect(Offer.active.count).to eq(1)
      end
    end

  end
end
