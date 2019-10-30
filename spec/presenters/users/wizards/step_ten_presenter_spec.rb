require "rails_helper"

RSpec.describe Users::Wizards::StepTenPresenter do

  let!(:curriculum) { create(:curriculum_vitae, :new_curriculum_vitae, user: create(:user, :first_time_candidate)) }
  let(:candidate) { curriculum.user }
  let(:subject) { described_class.new(candidate) }

  let(:acknowledgment) { create(:acknowledgment, curriculum_vitae: curriculum) }

  describe '#form_information' do
    it 'should return a object used by the react component to build it' do
      response = subject.form_information

      expect(response).to be_an_instance_of(Hash)

      expected_keys = [:title, :subtitle, :form]

      expect(response.keys).to eq(expected_keys)
    end
  end

  describe "#registered_acknowledgments" do
    it { should respond_to(:registered_acknowledgments) }
  end

  describe "#have_acknowledgments?" do
    it { should respond_to(:have_acknowledgments?) }

    it "should return a true if have acknowledgments" do
      acknowledgment

      expect(subject.have_acknowledgments?).to be_truthy
    end

    context "When anything acknowledgment is not present in db" do
      it "it should return falsey" do
        expect(subject.have_acknowledgments?).to be_falsey
      end
    end
  end

  describe "#registered_acknowledgments_message" do
    it { should respond_to(:registered_acknowledgments_message) }

    it "should return a message" do
      acknowledgment

      expect(subject.registered_acknowledgments_message).to eq("Llevas 1 registro(s) de reconocimientos")
    end
  end
end