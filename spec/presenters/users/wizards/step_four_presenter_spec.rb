require "rails_helper"

RSpec.describe Users::Wizards::StepFivePresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe "#" do
    it { should respond_to(:) }

    it "should return a array with  objects" do
      expect(subject.).to match_array(.all)
    end
  end

end