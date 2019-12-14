require "rails_helper"

RSpec.describe Users::Wizards::StepNines::EducationalLevelPresenter do
  let(:expected_educational_level) { create(:educational_level,
    start_date: Date.new(2010,1,1),
    finish_date: Date.new(2010,11,1),
    degree: 'Software Ingeneer',
    city: create(:city, description: 'La Dorada', state: create(:state, description: 'Caldas'))
  ) }

  let(:subject) { described_class.new(expected_educational_level) }

  describe '#range_of_time' do
    it 'should return a string with month year to month year format' do
      response = subject.range_of_time

      expect(response).to eq("Enero 2010 - Noviembre 2010 - 10 Mes(es)")
    end
  end

  describe "#location" do
    it "should return state and city" do
      response = subject.location

      expect(response).to eq("La Dorada, Caldas")
    end
  end

  describe "#return_path" do
    it "Should return the path" do
      response = subject.return_path

      expect(response).to eq('/users/wizards/step_nine')
    end
  end

  describe "#next_path" do
    it "Should return the path" do
      response = subject.next_path

      expect(response).to eq('/users/wizards/step_ten')
    end
  end

end