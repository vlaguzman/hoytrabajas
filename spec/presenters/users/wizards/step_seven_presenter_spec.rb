require "rails_helper"

RSpec.describe Users::Wizards::StepSevenPresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe "#_list" do
    xit { should respond_to(:_list) }

    xit "should return a array with available work days objects" do
      expect(subject._list).to match_array([])
    end
  end

end