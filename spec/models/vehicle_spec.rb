require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'associations' do
    it { should respond_to(:description) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:curriculum_vitaes) }
    it { should have_and_belong_to_many(:offers) }
  end

end