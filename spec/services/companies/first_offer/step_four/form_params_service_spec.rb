require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepFour::FormParamsService do

  describe '#form_params' do
    let!(:company) { create(:company, :first_time) }
    let!(:offer) { create(:offer) }

    let(:subject) { described_class }

    it 'should return the expected object' do

      expected_object = {
        title: 'Creemos tu primera oferta',
        subtitle: 'Brinda a tu candidato una relevante de tu empresa.',
        form: {
          placeholders: {},
          buttons: {
            submit: 'Siguiente',
            next: 'Saltar',
            previous: 'Regresar',
            previousPath: '/companies/first_offer/step_two',
            nextPath: '/companies/first_offer/step_four',
            addOther: nil
          },
          action: '/companies/first_offer/step_three',
          method: :put,
          type: :company,
          formFields: {
            title: {
              name: 'company[title]',
              label: 'Título de tu oferta',
              current_value: ''
            },
            job_category_ids: {
              name: 'company[job_category_ids]',
              label: 'Selecciona las categorías de tu oferta',
              values: [],
              current_value: ''
            },
            offers_work_positions: {
              name: 'company[offers_work_positions]',
              label: 'Elige el cargo que deseas contratar',
              values: [],
              current_value: ''
            },
            offer_type_id: {
              name: 'company[offer_type_id]',
              label: 'Tipo de oferta',
              values: [],
              current_value: ''
            },
            work_mode_id:  {
              name: 'company[work_mode_id]',
              label: 'Modalidad de trabajo',
              values: [],
              current_value: ''
            }
          }
        }
      }

      response = subject.new(
        errors: offer.errors,
        action_path: '/companies/first_offer/step_four',
        next_path: '/companies/first_offer/step_five',
        previous_path: '/companies/first_offer/step_three',
        form_type: :offer,
        template_translation_path: 'companies.first_offer.step_fours.show',
        form_method: :put
      ).form_params

      puts "#" * 100
      puts response.inspect puts "#" * 100
      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
