require "rails_helper"

RSpec.describe Users::Wizards::StepEights::WorkExperiencePresenter do
  let(:expected_work_experience) { create(:work_experience,
    started_at: Date.new(2010,1,1),
    finished_at: Date.new(2010,11,1),
    work_position: create(:work_position, description: "Ruby Developer")
  ) }

  let(:subject) { described_class.new(expected_work_experience) }

  describe '#range_of_time' do
    it 'should return a string with month year to month year format' do
      response = subject.range_of_time

      expect(response).to eq("Enero 2010 - Noviembre 2010 - 10 Mes(es)")
    end
  end

  describe "#return_path" do
    it "Should return the path" do
      response = subject.return_path

      expect(response).to eq('/users/wizards/step_eight')
    end
  end

  describe "#next_path" do
    it "Should return the path" do
      response = subject.next_path

      expect(response).to eq('/users/wizards/step_nine')
    end
  end

  describe "#responsabilities" do
    it "should return array" do
      response = subject.responsabilities

      expect(response).to be_an_instance_of(Array)
    end
  end
end