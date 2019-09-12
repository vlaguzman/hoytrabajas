require "rails_helper"

RSpec.describe Users::Wizards::StepFivePresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe "#available_work_days_list" do
    it { should respond_to(:available_work_days_list) }

    it "should return a array with available work days objects" do
      expect(subject.available_work_days_list).to match_array(AvailableWorkDay.all)
    end
  end

  describe "#working_days_list" do
    it { should respond_to(:working_days_list) }

    it "should return a array with available work days objects" do
      expect(subject.working_days_list).to match_array(WorkingDay.all)
    end
  end

  describe "#range_types_list" do
    it { should respond_to(:range_types_list) }

    it "should return a array with  objects" do
      expect(subject.range_types_list).to match_array([["Rango", 1], ["Fijo", 2]])
    end
  end

  describe "#currencies_list" do
    it { should respond_to(:currencies_list) }

    it "should return a array with  objects" do
      expect(subject.currencies_list).to match_array(Currency.all)
    end
  end

  describe "#salary_periods_list" do
    it { should respond_to(:salary_periods_list) }

    it "should return a array with  objects" do
      expect(subject.salary_periods_list).to match_array(SalaryPeriod.all)
    end
  end

end