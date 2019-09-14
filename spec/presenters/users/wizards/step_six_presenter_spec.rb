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

  describe "#job_categories_list" do
    it { should respond_to(:job_categories_list) }

    it "should return a array with available work days objects" do
      expect(subject.job_categories_list).to match_array(JobCategory.all.map { |object| [object.description, object.id] })
    end
  end

  describe "#technical_skills_list" do
    it { should respond_to(:technical_skills_list) }

    it "should return a array with available work days objects" do
      expect(subject.technical_skills_list).to match_array(TechnicalSkill.all.map { |object| [object.description, object.id] })
    end
  end

  describe "#levels_list" do
    it { should respond_to(:levels_list) }

    it "should return a array with available work days objects" do
      expect(subject.levels_list).to match_array(Level.all.map { |object| [object.description, object.id] })
    end
  end

  describe "#languages_list" do
    it { should respond_to(:languages_list) }

    it "should return a array with available work days objects" do
      expect(subject.languages_list).to match_array(Language.all.map { |object| [object.description, object.id] })
    end
  end

end