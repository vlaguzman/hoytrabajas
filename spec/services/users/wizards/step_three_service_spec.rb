require 'rails_helper'

RSpec.describe Users::Wizards::StepThreeService do
  let(:curriculum_vitae) { create(:curriculum_vitae, user:create(:user, :first_time_candidate)) }

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
  let!(:work_modes) do
    [
      create(:work_mode, description: "Indiferente"),
      create(:work_mode, description: "Remoto")
    ]
  end

  let!(:contract_type) { create(:contract_type, description: "Indiferente") }
  let!(:labor_disponibility) { create(:labor_disponibility, description: "Inmediato") }

  let(:params) do
    {
      job_category_ids:       [job_categories.pluck(:id).join(",")],
      offer_type_ids:         [offer_types.pluck(:id).join(",")],
      contract_type_id:       contract_type.id,
      work_mode_ids:          [work_modes.pluck(:id).join(",")],
      labor_disponibility_id: labor_disponibility.id
    }
  end

  it { should be_an_instance_of(Module) }

  describe "#call" do
    it "Should return a modified curriculum vitae" do

      modified_curriculum, update = subject.(curriculum_vitae: curriculum_vitae, update_params: params)

      expect(User.count).to eq(1)
      expect(CurriculumVitae.count).to eq(1)

      saved_job_categories = job_categories.pluck(:id).map { |id| JobCategory.find_by(id: id) }
      expect(modified_curriculum.job_categories).to match_array(saved_job_categories)

      saved_offer_types = offer_types.pluck(:id).map { |id| OfferType.find_by(id: id) }
      expect(modified_curriculum.offer_types).to match_array(saved_offer_types)

      saved_work_modes = work_modes.pluck(:id).map { |id| WorkMode.find_by(id: id) }
      expect(modified_curriculum.work_modes).to match_array(saved_work_modes)

      expect(modified_curriculum.contract_type).to eq(ContractType.find_by(id: params[:contract_type_id]))
      expect(modified_curriculum.labor_disponibility).to eq(LaborDisponibility.find_by(id: params[:labor_disponibility_id]))
    end

  end
end