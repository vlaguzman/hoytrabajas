require "rails_helper"

RSpec.describe Users::Wizards::StepFourPresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe "#states_list" do
    it { should respond_to(:states_list) }

    it "should return a array with state objects" do
      expect(subject.states_list).to match_array(State.all)
    end
  end

  describe "#cities_list" do
    it { should respond_to(:cities_list) }

    it "should return a array with cities objects" do
      expect(subject.cities_list).to match_array(City.all)
    end
  end

  describe "#vehicles_list" do
    it { should respond_to(:vehicles_list) }

    it "should return a array with vehicle objects" do
      expect(subject.vehicles_list).to match_array(Vehicle.all)
    end
  end

  describe "#work_modes_list" do
    it { should respond_to(:work_modes_list) }

    it "should return a array with vehicle objects" do
      expect(subject.work_modes_list).to match_array(subject.model_list(WorkMode))
    end
  end

  describe "#driving_licences_list" do
    it { should respond_to(:driving_licences_list) }

    it "should return a array with driving licences list objects" do
      expect(subject.driving_licences_list).to match_array(DrivingLicence.all)
    end
  end

  describe "#work_modes_list" do
    it { should respond_to(:work_modes_list) }

    it "should return a array with work_modes_list objects" do
      work_modes = subject.work_modes_list.shift
      expect(work_modes.first).to eq(" Presencial ")
    end
  end

end
