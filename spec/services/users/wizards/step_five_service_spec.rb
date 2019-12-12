require 'rails_helper'

RSpec.describe Users::Wizards::StepFiveService do

  describe "#call" do
    let!(:new_curriculum_vitae) { create(:curriculum_vitae, :empty) }

    context "When the params are valids" do
      let!(:available_work_day_ids) do
        [
          create(:available_work_day, description: "jueves").id,
          create(:available_work_day, description: "lunes").id,
          create(:available_work_day, description: "martes").id,
        ]
      end

      let!(:working_day_ids) do
        [
          create(:working_day, description: "Mañana tarde").id,
          create(:working_day, description: "Todo el dia").id
        ]
      end

      let!(:currency_id) { create(:currency).id }
      let!(:salary_period_id) { create(:salary_period, description: "Diario").id }

      let(:params) do
        {
          available_work_day_ids: [available_work_day_ids.join(",")],
          working_day_ids: [working_day_ids.join(",")],
          curriculum_vitae_salary: {
            currency_id: currency_id,
            from: 4000, to: 10000,
            salary_period_id: salary_period_id
          }
        }
      end

      it "Should return a modifiend User" do
        update_curriculum = subject.(curriculum_vitae: new_curriculum_vitae, update_params: params)

        expect(update_curriculum).to be_an_instance_of(CurriculumVitae)
      end

      it "Should update the curriculum vitae" do
        update_curriculum = subject.(curriculum_vitae: new_curriculum_vitae, update_params: params)

        expect(new_curriculum_vitae.available_work_days.pluck(:description)).to match_array(["jueves", "lunes", "martes"])
        expect(new_curriculum_vitae.working_days.pluck(:description)).to match_array(["Mañana tarde", "Todo el dia"])

      end

      it "should create a curriculum vitae salary object associated to the curriculum vitae" do
        expect(new_curriculum_vitae.curriculum_vitae_salary).to be_nil

        update_curriculum = subject.(curriculum_vitae: new_curriculum_vitae, update_params: params)

        updated_cv_salary = update_curriculum.curriculum_vitae_salary

        expect(CurriculumVitaeSalary.count).to eq(1)

        expect(updated_cv_salary).to be_present
        expect(updated_cv_salary).to be_an_instance_of(CurriculumVitaeSalary)
        expect(updated_cv_salary.currency.description).to eq("COP")
        expect(updated_cv_salary.from).to eq(4000)
        expect(updated_cv_salary.to).to eq(10000)
        expect(updated_cv_salary.salary_period.description).to eq("Diario")
      end
    end
  end

end