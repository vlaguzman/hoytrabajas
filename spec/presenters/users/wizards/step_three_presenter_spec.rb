require "rails_helper"

RSpec.describe Users::Wizards::StepThreePresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe "#job_categories_list" do
    it { should respond_to(:job_categories_list) }

    it "should return a array with job category objects" do
      expect(subject.job_categories_list).to match_array(JobCategory.all)
    end
  end

  describe "#offer_types_list" do
    it { should respond_to(:offer_types_list) }

    it "should return a array with offer type objects" do
      expect(subject.offer_types_list).to match_array(OfferType.all)
    end
  end

  describe "#contract_types_list" do
    it { should respond_to(:contract_types_list) }

    it "should return a array with contract type objects" do
      expect(subject.contract_types_list).to match_array(ContractType.all)
    end
  end

  describe "#work_modes_list" do
    it { should respond_to(:work_modes_list) }

    it "should return a array with work mode objects" do
      expect(subject.work_modes_list).to match_array(WorkMode.all)
    end
  end

  describe "#labor_disponibilities_list" do
    it { should respond_to(:labor_disponibilities_list) }

    it "should return a array with work mode objects" do
      expect(subject.labor_disponibilities_list).to match_array(LaborDisponibility.all)
    end
  end

end