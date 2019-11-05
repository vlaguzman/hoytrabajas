require 'rails_helper'

RSpec.describe Offer, type: :model do

  describe "class methods" do
    let(:subject) { described_class }

    describe "scopes" do
      it { should respond_to(:related_job_category) }
      it { should respond_to(:active) }
    end
  end

  describe "validations" do
    it { should validate_presence_of(:title) }

    it { should respond_to(:address) }
    it { should respond_to(:cellphone) }
    it { should respond_to(:description) }
    it { should respond_to(:vacancies_quantity) }
    it { should respond_to(:close_date) }
    it { should respond_to(:immediate_start) }
    it { should respond_to(:required_experience) }
    it { should respond_to(:description_responsibilities) }
    it { should respond_to(:release_date) }
    it { should respond_to(:status) }
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
    it { should belong_to(:job_category) }
    it { should belong_to(:work_mode) }
    it { should belong_to(:job_category) }
    it { should belong_to(:contract_type) }
    it { should have_one(:offer_salary) }
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
    it { should have_and_belong_to_many(:sexes) }
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

  describe "#before_save" do
    it "assign the parametrized name to the slug field" do
      offer = build(:offer, title: 'Pañalera de pingüinos de compañía', slug: nil)
      offer.save
      expect(offer.slug).to eq('panalera-de-pinguinos-de-compania')
    end
  end

  describe "#by_applied_offer_cv" do
    before(:each) do
      @cv = FactoryBot.create(:curriculum_vitae)
      @cv_2 = FactoryBot.create(:curriculum_vitae)
      @cv_3 = FactoryBot.create(:curriculum_vitae)
      offer = FactoryBot.create(:offer, title: 'just_an_offer')
      offer_2 = FactoryBot.create(:offer, title: 'an_other_offer')
      applied_offer = FactoryBot.create(:applied_offer, curriculum_vitae: @cv, offer: offer)
      applied_offer_2 = FactoryBot.create(:applied_offer, curriculum_vitae: @cv, offer: offer_2)
      applied_offer_3 = FactoryBot.create(:applied_offer, curriculum_vitae: @cv_2, offer: offer_2)
    end

    context "there just one opply offer with a cv_id" do
      it "should return the offers related to a curriculum vitae" do
        expect(Offer.by_applied_offer_cv(@cv_2.id).first.title).to eq('an_other_offer')
        expect(Offer.by_applied_offer_cv(@cv_2.id).count).to eq(1)
      end
    end

    context "there are two opplied offers" do
      it "should return the offers related to a curriculum vitae" do
        expect(Offer.by_applied_offer_cv(@cv.id).first.title).to eq('just_an_offer')
        expect(Offer.by_applied_offer_cv(@cv.id).count).to eq(2)
      end
    end

    context "there not are any applied offers by cv_id" do
      it "shold return an empty array" do
        expect(Offer.by_applied_offer_cv(@cv_3.id)).to eq([])
        expect(Offer.by_applied_offer_cv(@cv_3.id).count).to eq(0)
      end
    end
  end

end
