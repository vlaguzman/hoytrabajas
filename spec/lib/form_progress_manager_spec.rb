require 'rails_helper'

RSpec.describe FormProgressManager do
  let(:max_company_steps){ 7 }
  let(:max_user_steps){ 11 }
  describe '#calculate_company_progress' do
    it 'should calculate the correct % of progress for company wizards' do
      expect(subject.calculate_company_progress(1)).to eq(100 / max_company_steps * 1)
      expect(subject.calculate_company_progress(2)).to eq(100 / max_company_steps * 2)
      expect(subject.calculate_company_progress(3)).to eq(100 / max_company_steps * 3)
      expect(subject.calculate_company_progress(4)).to eq(100 / max_company_steps * 4)
      expect(subject.calculate_company_progress(5)).to eq(100 / max_company_steps * 5)
      expect(subject.calculate_company_progress(6)).to eq(100 / max_company_steps * 6)
      expect(subject.calculate_company_progress(7)).to eq(100 / max_company_steps * 7)
    end
  end

  describe '#calculate_user_progress' do
    it 'should calculate the correct % of progress for user wizards' do
      expect(subject.calculate_user_progress(1)).to eq(100 / max_user_steps * 1)
      expect(subject.calculate_user_progress(2)).to eq(100 / max_user_steps * 2)
      expect(subject.calculate_user_progress(3)).to eq(100 / max_user_steps * 3)
      expect(subject.calculate_user_progress(4)).to eq(100 / max_user_steps * 4)
      expect(subject.calculate_user_progress(5)).to eq(100 / max_user_steps * 5)
      expect(subject.calculate_user_progress(6)).to eq(100 / max_user_steps * 6)
      expect(subject.calculate_user_progress(7)).to eq(100 / max_user_steps * 7)
      expect(subject.calculate_user_progress(8)).to eq(100 / max_user_steps * 8)
      expect(subject.calculate_user_progress(9)).to eq(100 / max_user_steps * 9)
      expect(subject.calculate_user_progress(10)).to eq(100 / max_user_steps * 10)
      expect(subject.calculate_user_progress(11)).to eq(100 / max_user_steps * 11)
    end
  end
end

