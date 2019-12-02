require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe "#languages_list" do
    let(:subject) { create(:offer) }

    it "should return languages list" do
      expected_array = create_list(:languages_offers, 5, offer_id: subject.id)

      expect(subject.languages_list).to eq(expected_array)
    end
  end

  describe "class methods" do
    let(:subject) { described_class }

    describe "scopes" do
      it { should respond_to(:related_job_category) }
      it { should respond_to(:by_applied_offer_cv) }
      it { should respond_to(:active) }
      it { should respond_to(:by_job_categories) }
    end

    let!(:cv)                { create(:curriculum_vitae) }
    let!(:cv_2)              { create(:curriculum_vitae) }
    let!(:cv_3)              { create(:curriculum_vitae) }
    let!(:job_category)      { create(:job_category, description: 'Operario') }
    let!(:job_category_2)    { create(:job_category, description: 'Marketing') }
    let!(:job_category_3)    { create(:job_category, description: 'Seguridad') }
    let!(:offer)             { create(:offer, title: 'just_an_offer', job_categories: [job_category]) }
    let!(:offer_2)           { create(:offer, title: 'an_other_offer', job_categories: [job_category_2]) }
    let!(:applied_offer)     { create(:applied_offer, curriculum_vitae: cv, offer: offer) }
    let!(:applied_offer_2)   { create(:applied_offer, curriculum_vitae: cv, offer: offer_2) }
    let!(:applied_offer_3)   { create(:applied_offer, curriculum_vitae: cv_2, offer: offer_2) }

    describe "#by_job_categories" do
      let!(:offer_3)           { create(:offer, title: 'an_other_offer_three', job_categories: [job_category, job_category_2]) }
      let!(:offer_4)           { create(:offer, title: 'an_other_offer_four', job_categories: [job_category]) }

      context "When you search for a category and find results" do
        it "Should return the results found" do
          expect(Offer.by_job_categories(job_category.id).first.job_category_ids).to match_array(job_category.id)
          expect(Offer.by_job_categories(job_category.id).count).to eq(3)
        end
      end

      context "When you search through several categories and find results" do
        it "Should return the results found" do
          ids_categories = [job_category.id, job_category_2.id]
          expect(Offer.by_job_categories(ids_categories).map(&:job_category_ids).flatten.uniq).to match_array([job_category.id, job_category_2.id])
          expect(Offer.by_job_categories([job_category.id, job_category_2.id]).count).to eq(4)
        end
      end

      context "When no results are found by the category sought" do
        it "Should not return anything" do
          expect(Offer.by_job_categories(job_category_3.id).count).to eq(0)
        end
      end
    end

    describe "#by_applied_offer_cv" do
      context "there just one opply offer with a cv_id" do
        it "should return the offers related to a curriculum vitae" do
          expect(Offer.by_applied_offer_cv(cv_2.id).first.title).to eq('an_other_offer')
          expect(Offer.by_applied_offer_cv(cv_2.id).count).to eq(1)
        end
      end

      context "there are two opplied offers" do
        it "should return the offers related to a curriculum vitae" do
          expect(Offer.by_applied_offer_cv(cv.id).first.title).to eq('just_an_offer')
          expect(Offer.by_applied_offer_cv(cv.id).count).to eq(2)
        end
      end

      context "there not are any applied offers by cv_id" do
        it "shold return an empty array" do
          expect(Offer.by_applied_offer_cv(cv_3.id)).to eq([])
          expect(Offer.by_applied_offer_cv(cv_3.id).count).to eq(0)
        end
      end
    end

    describe "#not_applied_offers_by_cv" do
      context "there just one opply offer with a cv_id" do
        it "should return the offers that is not related to a curriculum vitae" do
          expect(Offer.not_applied_offers_by_cv(cv_2.id).count).to eq(1)
          expect(Offer.not_applied_offers_by_cv(cv_2.id).first.title).to eq('just_an_offer')
        end
      end

      context "there are two opplied offers" do
        it "should return an empty array" do
          expect(Offer.not_applied_offers_by_cv(cv.id).count).to eq(0)
          expect(Offer.not_applied_offers_by_cv(cv.id)).to eq([])
        end
      end

      context "there not are any applied offers by cv_id" do
        it "shold return an array with all offers" do
          expect(Offer.not_applied_offers_by_cv(cv_3.id).count).to eq(2)
        end
      end
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
    it { should belong_to(:offer_type) }
    it { should belong_to(:work_mode) }
    it { should belong_to(:contract_type) }
    it { should have_one(:offer_salary) }
    it { should have_one(:offer_required_experiences) }
    it { should have_and_belong_to_many(:job_categories) }
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

  describe "#created_at_desc" do
    it "should return offers order descendingly" do
      offer_1 = create(:offer, title: 'first created', created_at: Time.new(2018, 01, 01))
      offer_2 = create(:offer, title: 'second created', created_at: Time.new(2019, 01, 02))

      response = described_class.created_at_desc

      expect(response.first).to eq(offer_2)
      expect(response.last).to eq(offer_1)
    end
  end
end
