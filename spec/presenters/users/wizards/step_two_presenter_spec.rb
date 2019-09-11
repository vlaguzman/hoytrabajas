require "rails_helper"

RSpec.describe Users::Wizards::StepTwoPresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe "#sexes_list" do
    it { should respond_to(:sexes_list) }

    it "should return a array with nationalities objects" do
      expect(subject.sexes_list).to match_array(Sex.all)
    end
  end

  describe "#limitations_list" do
    it { should respond_to(:limitations_list) }

    it "should return a array with nationalities objects" do
      expect(subject.limitations_list).to match_array(Limitation.all)
    end
  end

  describe "#educational_degrees_list" do
    it { should respond_to(:educational_degrees_list) }

    it "should return a array with nationalities objects" do
      expect(subject.educational_degrees_list).to match_array(EducationalDegree.all)
    end
  end

end