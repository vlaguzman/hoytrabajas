require 'rails_helper'

RSpec.describe Users::Wizards::StepTenService do
  describe '#call' do
    let(:new_curriculum_vitae) { create(:curriculum_vitae, :empty) }

    let(:params) do
      {
        title: 'Profesor del año 1999',
        start_date: '30/12/1999',
        entity_name: 'Sena'
      }
    end

    let(:new_acknowledgment) { build(:acknowledgment, :empty, curriculum_vitae: new_curriculum_vitae) }

    context 'When all strong params are valid' do
      it 'should return a instace of User' do
        response, updated = subject.(source: new_acknowledgment, update_params: params)

        expect(response).to be_an_instance_of(Acknowledgment)
        expect(updated).to be_truthy

        expect(response.title).to eq('Profesor del año 1999')
        expect(response.start_date).to eq(Date.new(1999, 12, 30))
        expect(response.entity_name).to eq('Sena')
      end

      it 'should create a acknowledgment object' do
        expect(Acknowledgment.count).to eq(0)

        subject.(source: new_acknowledgment, update_params: params)

        expect(Acknowledgment.count).to eq(1)
      end

      it 'acknowledgment object should be assoc with the cv' do
        response, = subject.(source: new_acknowledgment, update_params: params)

        expect(Acknowledgment.find_by(curriculum_vitae_id: new_curriculum_vitae.id)).to be_present
      end
    end
  end
end