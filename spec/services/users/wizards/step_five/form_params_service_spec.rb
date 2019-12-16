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

    context "When user does not have data" do
      let(:cv) { create(:curriculum_vitae, :empty) }

      it "should return the expected object" do

        expected_object = {
          title: '¡Búsquemos las mejores ofertas!',
          subtitle: 'Brinda a las empresas información valiosa sobre ti.',
          form: {
            buttons: {
              addOther: nil,
              submit: 'Siguiente',
              next: 'Saltar',
              previous: 'Regresar',
              previousPath: '/users/wizards/step_four',
              nextPath: '/users/wizards/step_six'
            },
            action: '/users/wizards/step_five',
            method: :post,
            type: :curriculum_vitae,
            formFields: {
              available_work_day_ids: {
                name: "curriculum_vitae[available_work_day_ids][]",
                label: "¿Que días estas disponible para trabajar?",
                values: create_available_work_days_list,
                current_value: []
              },
              working_day_ids: {
                name: "curriculum_vitae[working_day_ids][]",
                label: "Franja horaria",
                values: create_working_days_list,
                current_value: []
              },
              range_type: {
                name: "curriculum_vitae[curriculum_vitae_salary][range_type]",
                label: "Aspiración salarial*",
                values: [{id: 1, description: "Rango"}, {id: 2, description: "Fijo"}]
              },
              currency_id: {
                name: "curriculum_vitae[curriculum_vitae_salary][currency_id]",
                label: 'Divisa',
                values: create_currencies_list,
                current_value: nil
              },
              from: {
                name: "curriculum_vitae[curriculum_vitae_salary][from]",
                label: '',
                current_value: nil
              },
              to: {
                name: "curriculum_vitae[curriculum_vitae_salary][to]",
                label: '',
                current_value: nil
              },
              salary_period_id: {
                name: 'curriculum_vitae[curriculum_vitae_salary][salary_period_id]',
                label: 'Pago',
                values: create_salary_periods_list,
                current_value: nil
              }
            },
            placeholders: {}
          }
        }

        response = subject.new(
          source: cv,
          errors: cv.errors,
          form_type: :curriculum_vitae,
          template_translation_path: "users.wizards.step_fives.show",
          action_path: "/users/wizards/step_five" ,
          previous_path: "/users/wizards/step_four",
          next_path: "/users/wizards/step_six",
          form_method: :post
        ).form_params

        expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

        expect(response.keys).to match_array(expected_object.keys)
        expect(response).to eq(expected_object)
      end
    end

    context "When user have data" do

      let(:expected_available_work_days) { [available_work_days[0], available_work_days[1]] }
      let(:expected_working_days) { [working_days[0], working_days[1] ] }

      let(:cv) { create(:curriculum_vitae,
        available_work_days: expected_available_work_days,
        working_days: expected_working_days,
        curriculum_vitae_salary: create(:curriculum_vitae_salary,
          currency: currencies.last,
          salary_period: salary_periods.last
        )
        ) }

      it "should return the expected object" do

        expected_object = {
          title: '¡Búsquemos las mejores ofertas!',
          subtitle: 'Brinda a las empresas información valiosa sobre ti.',
          form: {
            buttons: {
              addOther: nil,
              submit: 'Siguiente',
              next: 'Saltar',
              previous: 'Regresar',
              previousPath: '/users/wizards/step_four',
              nextPath: '/users/wizards/step_six'
            },
            action: '/users/wizards/step_five',
            method: :post,
            type: :curriculum_vitae,
            formFields: {
              available_work_day_ids: {
                name: "curriculum_vitae[available_work_day_ids][]",
                label: "¿Que días estas disponible para trabajar?",
                values: create_available_work_days_list,
                current_value: expected_available_work_days.pluck(:id)
              },
              working_day_ids: {
                name: "curriculum_vitae[working_day_ids][]",
                label: "Franja horaria",
                values: create_working_days_list,
                current_value: expected_working_days.pluck(:id)
              },
              range_type: {
                name: "curriculum_vitae[curriculum_vitae_salary][range_type]",
                label: "Aspiración salarial*",
                values: [{id: 1, description: "Rango"}, {id: 2, description: "Fijo"}]
              },
              currency_id: {
                name: "curriculum_vitae[curriculum_vitae_salary][currency_id]",
                label: 'Divisa',
                values: create_currencies_list,
                current_value: currencies.last.id
              },
              from: {
                name: "curriculum_vitae[curriculum_vitae_salary][from]",
                label: '',
                current_value: 800000
              },
              to: {
                name: "curriculum_vitae[curriculum_vitae_salary][to]",
                label: '',
                current_value: 5000000
              },
              salary_period_id: {
                name: 'curriculum_vitae[curriculum_vitae_salary][salary_period_id]',
                label: 'Pago',
                values: create_salary_periods_list,
                current_value: salary_periods.last.id
              }
            },
            placeholders: {}
          }
        }

        response = subject.new(
          source: cv,
          errors: cv.errors,
          form_type: :curriculum_vitae,
          template_translation_path: "users.wizards.step_fives.show",
          action_path: "/users/wizards/step_five" ,
          previous_path: "/users/wizards/step_four",
          next_path: "/users/wizards/step_six",
          form_method: :post
        ).form_params

        expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

        expect(response.keys).to match_array(expected_object.keys)
        expect(response).to eq(expected_object)
      end
    end

  end

end
