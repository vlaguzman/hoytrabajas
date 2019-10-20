require 'rails_helper'

RSpec.describe Users::Wizards::StepFive::FormParamsService do

  describe "#form_params" do
    let!(:available_work_days) { create_list(:available_work_day, 5) }
    let(:create_available_work_days_list) { ListConverter.model_list(AvailableWorkDay) }

    let!(:working_days) { create_list(:working_day, 5) }
    let(:create_working_days_list) { ListConverter.model_list(WorkingDay) }

    let!(:currencies) { create_list(:currency, 5) }
    let(:create_currencies_list) { ListConverter.model_list(Currency) }

    let!(:salary_periods) { create_list(:salary_period, 5) }
    let(:create_salary_periods_list) { ListConverter.model_list(SalaryPeriod) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: '¡Búsquemos las mejores ofertas!',
        subtitle: 'Brinda a las empresas información valiosa sobre ti.',
        form: {
          buttons: {
            submit: 'Siguiente',
            next: 'Saltar',
            previous: 'Regresar',
            previousPath: '/users/wizards/step_four',
            nextPath: '/users/wizards/step_six'
          },
          action: '/users/wizards/step_five',
          method: :put,
          type: :user,
          formFields: {
            available_work_day_ids: {
              name: "user[curriculum_vitae][available_work_day_ids][]",
              label: "¿Que días estas disponible para trabajar?",
              values: create_available_work_days_list
            },
            working_day_ids: {
              name: "user[curriculum_vitae][working_day_ids][]",
              label: "Franja horaria",
              values: create_working_days_list
            },
            range_type: {
              name: "user[curriculum_vitae][curriculum_vitae_salary][range_type]",
              label: "Aspiración salarial*",
              values: ["Rango", "Fijo"]
            },
            currency_id: {
              name: "user[curriculum_vitae][curriculum_vitae_salary][currency_id]",
              label: '',
              values: create_currencies_list
            },
            from: {
              name: "user[curriculum_vitae][curriculum_vitae_salary][from]",
              label: '',
            },
            to: {
              name: "user[curriculum_vitae][curriculum_vitae_salary][to]",
              label: '',
            },
            salary_period_id: {
              name: 'user[curriculum_vitae][curriculum_vitae_salary][salary_period_id]',
              label: 'Pago',
              values: create_salary_periods_list
            }
          }
        }
      }

      response = subject.new(
        form_type: :user,
        template_translation_path: "users.wizards.step_fives.show",
        action_path: "/users/wizards/step_five" ,
        previous_path: "/users/wizards/step_four",
        next_path: "/users/wizards/step_six",
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end