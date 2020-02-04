require "rails_helper"

RSpec.describe Users::Wizards::StepSevenPresenter do

  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe '#skip_path' do
    it 'should return a string' do
      skip_path = subject.skip_path

      expect(skip_path).to be_an_instance_of(String)
    end
  end

  describe '#next_path' do
    it 'should return a string' do
      next_path = subject.next_path

      expect(next_path).to be_an_instance_of(String)
    end
  end

  describe '#return_path' do
    it 'should return a string' do
      return_path = subject.return_path

      expect(return_path).to be_an_instance_of(String)
    end
  end

end