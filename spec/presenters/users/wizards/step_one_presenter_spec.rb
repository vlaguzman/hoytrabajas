require "rails_helper"

RSpec.describe Users::Wizards::StepOnePresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe "#nationalities_list" do
    it { should respond_to(:nationalities_list) }

    it "should return a array with nationalities objects" do
      expect(subject.nationalities_list).to match_array(Nationality.all)
    end
  end

  describe "#document_types_list" do
    it { should respond_to(:document_types_list) }

    it "should return a array with document types objects" do
      expect(subject.document_types_list).to match_array(DocumentType.all)
    end
  end

end