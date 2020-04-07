require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepFour::FormParamsService do

  describe '#form_params' do
    let!(:company) { create(:company, :first_time) }

    let(:subject) { described_class }

    it 'should return the expected object' do

      expected_object = {
        title: 'Conozcamos más de tu oferta',
        subtitle: 'Brinda a tu candidato información relevante de tu empresa.',
        immediate_start_description: "Inicio inmediato",
        form: {
          placeholders: {},
          buttons: {
            submit: 'Siguiente',
            next: 'Saltar',
            previous: 'Regresar',
            previousPath: '/companies/first_offer/step_three',
            nextPath: '/companies/first_offer/step_five',
            addOther: nil
          },
          action: '/companies/first_offer/step_four',
          method: :put,
          type: :company,
          formFields: {
            offer_type_id: {
              name: 'company[offer_type_id]',
              label: 'Tipo de oferta',
              values: [],
              current_value: ''
            },
            work_mode_id: {
              name: 'company[work_mode_id]',
              label: 'Modalidad de trabajo',
              values: [],
              current_value: ''
            },
            contract_type_id: {
              name: 'company[contract_type_id]',
              label: 'Acuerdo legal',
              values: [],
              current_value: ''
            },
            sex_ids: {
              name: 'company[sex_ids][]',
              label: 'Tu oferta está dirigida a',
              values: [],
              current_value: ''
            },
            vacancies_quantity: {
              name: 'offer[vacancies_quantity]',
              label: 'Elige el número de vacantes',
              values: {min: 1, max: 100},
              step: 1,
              current_value: nil
            },
            age_range_list_ids: {
              current_value: '',
              label: 'Edad del candidato (Puedes elegir más de uno)',
              name: 'company[age_range_list_ids][]',
              values: []
            },
            immediate_start: {
              name: 'offer[immediate_start]',
              label: '¿Cuál es el tiempo para cubrir esta oferta?',
              description: 'Inicio inmediato',
              current_value: nil
            },
            close_date: {
              name: 'offer[close_date]',
              label: 'Fecha de cierre de la oferta',
              current_value: ''
            }
          }
        }
      }

      response = subject.new(
        errors: company.errors,
        action_path: '/companies/first_offer/step_four',
        next_path: '/companies/first_offer/step_five',
        previous_path: '/companies/first_offer/step_three',
        form_type: :company,
        template_translation_path: 'companies.first_offer.step_fours.show',
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
