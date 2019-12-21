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

  describe "class methods" do
    let(:subject) { described_class }
    let(:expected_offer_attr_array) { [:contract_type_id, :educational_degree_id, :sex_id] }
    let(:expected_offer_list_array) { [:vehicles, :driving_licences] }

    describe "#attributes_to_compare " do
      it "Should return the array with principal attributes" do
        expect(subject::ATTRIBUTES_TO_COMPARE).to match_array(expected_offer_attr_array) 
      end
    end

    describe "#lists_to_compare" do
      it "Should return the array with principal list attributes" do
        expect(subject::LISTS_TO_COMPARE).to match_array(expected_offer_list_array) 
      end
    end
  end

  describe "#curriculum_vitae" do
    let(:user) { create(:user) }
    context "the user has not the curriculum vitae" do
      it "should return nil" do
        expect(user.curriculum_vitae).to be_present
        expect(CurriculumVitae.count).to eq(1)
      end
    end

    context "the user has one curriculum vitae" do
      it "should return the only curriculum vitae" do
        curriculum_vitae =  FactoryBot.create(:curriculum_vitae, user: user)
        expect(user.curriculum_vitae.about_me).to eq(curriculum_vitae.about_me)
      end
    end

    context "the user has more than one curriculum vitae" do
      it "should return the first curriculum vitae" do
        curriculum_vitae =  FactoryBot.create(:curriculum_vitae, user: user, about_me: "the best worker")
        curriculum_vitae_2 =  FactoryBot.create(:curriculum_vitae, user: user)
        expect(user.curriculum_vitae.about_me).to eq(curriculum_vitae.about_me)
      end
    end
  end

  describe "#after_confirmation" do
    it {should respond_to(:after_confirmation)}
    it "update confirmed_at field" do
      expect(subject.after_confirmation).to eq(true)
    end
  end

  describe "#born_city" do
    let(:user) { create(:user, born_city_id: nil) }
    let(:city) { create(:city) }

    context "when has born_city_id" do
      it "should return the city object" do
        user.update(born_city_id: city.id)
        user.reload

        expect(user.born_city).to eq(city)
      end
    end

    context "when has not born_city_id" do
      it "should return nil" do
        expect(user.born_city).to eq(nil)
      end
    end
  end

  describe "#residence_city" do
    let(:user) { create(:user, residence_city_id: nil) }
    let(:city) { create(:city) }

    context "when has a residence_city_id" do
      it "should return the city object" do
        user.update(residence_city_id: city.id)
        user.reload

        expect(user.residence_city).to eq(city)
      end
    end

    context "when has not residence_city_id" do
      it "should return nil" do
        expect(user.residence_city).to eq(nil)
      end
    end
  end

  describe ".from_omniauth" do
    it "creates a new user with the params given" do
      request = double(provider: 'facebook', uid: '101566359522040331902', info: double(email: 'pepito@gmaile.com', name: 'Pepe Perez', image: 'http://graph.facebook.com/v2.10/10156635952204033/picture'))
      user = User.from_omniauth(request)
      expect(user.uid).to eq('101566359522040331902')
    end
  end
end
