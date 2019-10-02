require "rails_helper"

RSpec.describe Users::Wizards::StepNinePresenter do

  let!(:curriculum) { create(:curriculum_vitae, :new_curriculum_vitae, user: create(:user, :first_time_candidate)) }
  let(:candidate) { curriculum.user }
  let(:subject) { described_class.new(candidate) }

  let(:educational_level) { create(:educational_level, curriculum_vitae: curriculum) }

  let!(:city) { create(:city) }
  let!(:cities_list) { City.all.map { |city| [city.description, city.id] } }

  describe "#cities_list" do
    it { should respond_to(:cities_list) }

    it "should return a array with cites objects" do
      expect(subject.cities_list).to match_array(cities_list)
    end
  end

  describe "#registered_studies" do
    it { should respond_to(:registered_studies) }
  end

  describe "#have_studies?" do
    it { should respond_to(:have_studies?) }

    it "should return a true if have studies" do
      educational_level

      expect(subject.have_studies?).to be_truthy
    end

    context "When educational level" do
      it "it should return falsey" do
        expect(subject.have_studies?).to be_falsey
      end
    end
  end

  describe "#registered_studies_message" do
    it { should respond_to(:registered_studies_message) }

    it "should return a message" do
      educational_level

      expect(subject.registered_studies_message).to eq("Llevas 1 registro(s) de informacion academica")
    end
  end
end

