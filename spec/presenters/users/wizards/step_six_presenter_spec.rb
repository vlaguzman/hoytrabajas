require "rails_helper"

RSpec.describe Users::Wizards::StepSixPresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe "#soft_skills_list" do
    it { should respond_to(:soft_skills_list) }

    it "should return a array with available work days objects" do
      expect(subject.soft_skills_list).to match_array(SoftSkill.all.map { |object| [object.description, object.id] })
    end
  end

end