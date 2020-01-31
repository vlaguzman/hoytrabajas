require "rails_helper"

RSpec.describe Users::Wizards::StepNines::ChoicesPresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe '#skip_path' do
    it 'should return a path' do
      response = subject.skip_path

      expect(response).to eq('/users/wizards/step_eleven')
    end
  end

  describe '#next_path' do
    it 'should return a path' do
      response = subject.next_path

      expect(response).to eq('/users/wizards/step_nine')
    end
  end

  describe '#return_path' do
    context 'when user has a work experience' do

      let!(:work_experience) { create(:work_experience,
        started_at: Date.new(2010,1,1),
        finished_at: Date.new(2010,11,1),
        work_position: create(:work_position, description: "Ruby Developer"),
        curriculum_vitae_id: candidate.curriculum_vitae.id
      ) }

      it 'should return a path to step_eight' do
        response = subject.return_path
  
        expect(response).to eq('/users/wizards/step_eight')
      end
    end

    context 'when user does not have work experience' do
      it 'should return a path to step_six' do
        response = subject.return_path

        expect(response).to eq('/users/wizards/step_six')
      end
    end
  end

  describe '#has_work_experience?' do
    it 'should return a boolean' do
      has_work_experience = subject.has_work_experience?

      expect(has_work_experience).to be_an_instance_of(Boolean)
    end
  end

end