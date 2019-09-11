require 'rails_helper'

RSpec.describe Users::Wizards::StepThreeService do
  let(:candidate) {create(:user, :first_time_candidate) }

  let(:new_curriculum) { create(:curriculum_vitae, user: candidate) }
  let!(:job_categories) do
    [
      create(:job_category, description: 'seguridad'),
      create(:job_category, description: 'logistica y transporte')
    ]
  end

  let!(:offer_types) do
    [
      create(:offer_type, description: 'Tiempo completo'),
      create(:offer_type, description: 'Medio tiempo')
    ]
  end

  let!(:contract_type) { create(:contract_type, description: "Indiferente") }
  let!(:work_mode) { create(:work_mode, description: "Indiferente") }
  let!(:labor_disponibility) { create(:labor_disponibility, description: "Inmediato") }

  let(:params) do
    {
      job_category_ids:       job_categories.pluck(:id),
      offer_type_ids:         job_categories.pluck(:id),
      contract_type_id:       offer_types.last.id,
      work_mode_ids:          [work_mode.id],
      labor_disponbility_id:  labor_disponibility.id
    }
  end

  it { should be_an_instance_of(Module) }

  describe "#call" do
    it "Should return a modified user" do
      new_curriculum

      modified_candidate = subject.(candidate: candidate, update_params: params)
      modified_curriculum = modified_candidate.curriculum_vitaes.first

      expect(User.count).to eq(1)
      expect(CurriculumVitae.count).to eq(1)

      saved_job_categories = params[:job_category_ids].map { |id| JobCategory.find_by(id: id) }
      expect(modified_curriculum.job_categories).to match_array(saved_job_categories)

      saved_offer_types = params[:offer_type_ids].map { |id| OfferType.find_bby(id: id) }
      expect(modified_curriculum.offer_types).to match_array(saved_offer_types)

      expect(modified_curriculum.contract_type).to eq(CotractType.find_by(id: params[:contract_type_id]))

      saved_work_modes = work_mode_ids.map { |id| WorkMode.find_by(id: id) }
      expect(modified_curriculum.work_modes).to match_array(saved_work_modes)

      expect(modified_curriculum.labor_disponibility).to eq(LaborDisponibility.find(id: params[:labor_disponbility_id]))
    end

  end
end